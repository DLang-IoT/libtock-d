module temperature;

import tock;

extern(C) {
    int temperature_set_callback (subscribe_cb callback, void* callback_args);
    int temperature_read();
    int temperature_read_sync (int* temperature);
}