#include <stdbool.h>
#include <stdio.h>

#include "led.h"
#include "timer.h"
#include "tock.h"

#include <ieee802154.h>
#include <udp.h>

// Sample UDP packet reception app.
// Receives packets at the specified address and port indefinitely

#define MAX_RX_PACKET_LEN 200

char packet_rx[MAX_RX_PACKET_LEN];
static unsigned char BUF_BIND_CFG[2 * sizeof(sock_addr_t)];
sock_handle_t* handle;

void print_ipv6(ipv6_addr_t *);

void print_ipv6(ipv6_addr_t *ipv6_addr) {
  for (int j = 0; j < 14; j += 2) {
    printf("%02x%02x:", ipv6_addr->addr[j], ipv6_addr->addr[j + 1]);
  }
  printf("%02x%02x", ipv6_addr->addr[14], ipv6_addr->addr[15]);
}

static void callback(int payload_len,
                     __attribute__ ((unused)) int arg2,
                     __attribute__ ((unused)) int arg3,
                     __attribute__ ((unused)) void* ud) {
  led_toggle(0);

#define PRINT_STRING 0
#if PRINT_STRING
  printf("[UDP_RCV]: Rcvd UDP Packet from: ");
  print_ipv6((ipv6_addr_t*)&BUF_BIND_CFG);
  printf(" : %d\n", (uint16_t)(BUF_BIND_CFG[16]) + ((uint16_t)(BUF_BIND_CFG[17]) << 8));
  printf("Packet Payload: %.*s\n", payload_len, packet_rx);
#endif // PRINT_STRING
  // Serialize packet to UART. Format:
  //
  // - 2 magic: 0x8081
  // - 16 byte ipv6 address
  // - 2 byte payload length in network order
  // - payload
  ipv6_addr_t sender_addr = *((ipv6_addr_t*)BUF_BIND_CFG);
  uint8_t header[2 + 1 + 16];
  header[0] = 0x80;
  header[1] = 0x81;
  header[2] = (char)(payload_len & 0xff);
  for (int i = 0; i < 16; i++) {
    header[3 + i] = 1 + sender_addr.addr[i];
  }
  write(0, header, sizeof(header));
  write(0, packet_rx, payload_len);
}

int main(void) {

  ipv6_addr_t ifaces[10];
  udp_list_ifaces(ifaces, 10);

  sock_addr_t addr = {
    ifaces[2],
    16123 // arbitrary port choice
  };

  printf("Opening socket on ");
  print_ipv6(&ifaces[2]);
  printf(" : %d\n", addr.port);
  sock_handle_t h;
  handle = &h;
  udp_bind(handle, &addr, BUF_BIND_CFG);

  // ieee802154_set_address(0x802); //Mac addr is configured in the kernel from serial num
  ieee802154_set_pan(0xABCD);
  ieee802154_config_commit();
  ieee802154_up();

  memset(packet_rx, 0, MAX_RX_PACKET_LEN);
  ssize_t result = udp_recv(callback, packet_rx, MAX_RX_PACKET_LEN);

  switch (result) {
    case TOCK_SUCCESS:
      printf("Succesfully bound to socket, listening for UDP packets\n\n");
      break;
    case TOCK_EINVAL:
      printf("The address requested is not a local interface\n");
      break;
    case TOCK_EBUSY:
      printf("Another userland app has already bound to this addr/port\n");
      break;
    case TOCK_ERESERVE:
      printf("Receive Failure. Must bind to a port before calling receive\n");
      break;
    default:
      printf("Failed to bind to socket %d\n", result);
      break;
  }

  /* Tock keeps the app alive waiting for callbacks after
   * returning from main, so no need to busy wait */
}
