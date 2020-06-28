#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <console.h>
#include <lps25hb.h>
#include <tock.h>

int main (void) {
  printf("[LPS25HB] Test\n");

  // Start a pressure measurement
  int rc = lps25hb_get_pressure_sync();

  if (rc < 0) {
    printf("Error getting pressure: %d\n", rc);
  } else {
    // Print the pressure value
    unsigned pressure = rc;
    printf("\tValue(%u ubar) [0x%X]\n\n", pressure, pressure);
  }
}
