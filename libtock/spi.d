module spi;

import tock;

extern(C) {
    int spi_init();

    int spi_set_chip_select(char cs);
    int spi_get_chip_select();

    int spi_set_rate(int rate);
    int spi_get_rate();

    int spi_set_phase(bool phase);
    int spi_get_phase();

    int spi_set_polarity(bool pol);
    int spi_get_polarity();

    int spi_hold_low();
    int spi_release_low();

    int spi_write_byte(char);
    int spi_read_buf(const char* str, size_t len);
    int spi_write(const char* str, size_t len, subscribe_cb cb, bool* cond);
    int spi_read_write(const char* write, char* read, size_t len, subscribe_cb cb, bool* cond);

    int spi_write_sync(const char* write, size_t len);
    int spi_read_write_sync(const char* write, char* read, size_t len);
}