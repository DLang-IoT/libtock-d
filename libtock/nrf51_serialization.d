module nrf51_serialization;

import tock;

extern(C) {
    int nrf51_serialization_reset();

    int nrf51_serialization_subscribe(subscribe_cb cb);

    int nrf51_serialization_setup_rx_buffer(char* rx, int rx_len);

    int nrf51_serialization_write(char* tx, int tx_len);
}