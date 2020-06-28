module lps25hb;

import tock;

extern(C) {
    int lps25hb_set_callback(subscribe_cb callback, void* callback_args);
    int lps25hb_get_pressure();
    int lps25hb_get_pressure_sync();
}