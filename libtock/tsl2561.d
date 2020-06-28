module tsl2561;

import tock;

extern(C) {
    int tsl2561_set_callback(subscribe_cb callback, void* callback_args);
    int tsl2561_get_lux();

    int tsl2561_get_lux_sync();
}