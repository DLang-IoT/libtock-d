module alarm;

import tock;

extern(C) {
    struct alarm_t;
    void alarm_at(uint expiration, subscribe_cb, void*, alarm_t* alarm);
    void alarm_cancel(alarm_t*);
    uint alarm_read();
}