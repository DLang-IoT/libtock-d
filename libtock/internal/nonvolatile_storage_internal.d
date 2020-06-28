module nonvolatile_storage_internal;

import tock;

extern(C) {
    int nonvolatile_storage_internal_read_done_subscribe(subscribe_cb cb, void* userdata);

    int nonvolatile_storage_internal_write_done_subscribe(subscribe_cb cb, void* userdata);

    int nonvolatile_storage_internal_read_buffer(ubyte* buffer, uint len);

    int nonvolatile_storage_internal_write_buffer(ubyte* buffer, uint len);

    int nonvolatile_storage_internal_get_number_bytes();

    int nonvolatile_storage_internal_read(ubyte offset, uint length);

    int nonvolatile_storage_internal_write(ubyte offset, uint length);
}