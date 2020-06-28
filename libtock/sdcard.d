module sdcard;

import tock;

extern(C) {
    int sdcard_set_callback(subscribe_cb callback, void* callback_args);

    int sdcard_set_read_buffer(ubyte* buffer, uint len);
    int sdcard_set_write_buffer(ubyte* buffer, uint len);

    int sdcard_is_installed();

    int sdcard_initialize();
    int sdcard_initialize_sync(uint* block_size, uint* size_in_kB);

    int sdcard_read_block(uint sector);
    int sdcard_read_block_sync(uint sector);

    int sdcard_write_block(uint sector);
    int sdcard_write_block_sync(uint sector);
}