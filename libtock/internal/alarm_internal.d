module alarm_internal;

import tock;

extern(C) {
    int alarm_internal_subscribe(subscribe_cb cb, void* userdata);

    int alarm_internal_set(uint tics);

    int alarm_internal_stop();

    uint alarm_internal_frequency();
}

