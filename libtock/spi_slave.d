module spi_slave;

import tock;

extern(C) {
    int spi_slave_get_chip_select();

    int spi_slave_set_phase(bool phase);
    int spi_slave_get_phase();

    int spi_slave_set_polarity(bool pol);
    int spi_slave_get_polarity();

    int spi_slave_chip_selected(subscribe_cb cb, bool* cond);

    int spi_slave_read_buf(const char* str, size_t len);
    int spi_slave_write(const char* str, size_t len, subscribe_cb cb, bool* cond);
    int spi_slave_read_write(const char* write, char* read, size_t len, subscribe_cb cb, bool* cond);

    int spi_slave_write_sync(const char* write, size_t len);
    int spi_slave_read_write_sync(const char* write, char* read, size_t len);
}