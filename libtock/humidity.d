module humidity;

import tock;

extern(C) {
    int humidity_set_callback(subscribe_cb callback, void* callback_args);
    int humidity_read();
    int humidity_read_sync(uint* humi);
}