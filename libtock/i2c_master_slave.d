module i2c_master_slave;

import tock;

extern(C) {
    int i2c_master_slave_set_callback (subscribe_cb callback, void* callback_args);
    int i2c_master_slave_set_master_write_buffer(ubyte* buffer, uint len);
    int i2c_master_slave_set_master_read_buffer(ubyte* buffer, uint len);
    int i2c_master_slave_set_slave_read_buffer(ubyte* buffer, uint len);
    int i2c_master_slave_set_slave_write_buffer(ubyte* buffer, uint len);
    int i2c_master_slave_write(ubyte address, ubyte length);
    int i2c_master_slave_write_read(ubyte address, ubyte write_length, ubyte read_length);
    int i2c_master_slave_read(ushort address, ushort len);
    int i2c_master_slave_listen();
    int i2c_master_slave_set_slave_address(ubyte address);
    int i2c_master_slave_enable_slave_read(uint len);

    int i2c_master_slave_write_sync(ubyte address, ubyte length);
    int i2c_master_slave_write_read_sync(ubyte address, ubyte wlen, ubyte rlen);
    int i2c_master_slave_read_sync(ushort address, ushort len);
}