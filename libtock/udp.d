module udp;

import tock;

extern(C) {
    alias udp_port_t = ushort;
    struct ipv6_addr_t;
    struct sock_addr_t;
    struct sock_handle_t;

    int udp_socket(sock_handle_t* handle, sock_addr_t* addr);
    int udp_bind(sock_handle_t* handle, sock_addr_t* addr, char* buf_bind_cfg);
    int udp_close(sock_handle_t* handle);

    size_t udp_send_to(void* buf, size_t len, sock_addr_t* dst_addr);
    size_t udp_recv(subscribe_cb callback, void* buf, size_t len);
    size_t udp_recv_sync(void* buf, size_t len);

    int udp_list_ifaces(ipv6_addr_t* ifaces, size_t len);
}