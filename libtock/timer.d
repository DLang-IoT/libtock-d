module timer;

import tock;
import alarm;

extern(C) {
    struct tock_timer_t;

    void timer_in(uint ms, subscribe_cb, void*, tock_timer_t* timer);
    void timer_every(uint ms, subscribe_cb, void*, tock_timer_t* timer);
    void timer_cancel(tock_timer_t*);

    void delay_ms(uint ms);
    void yield_for_with_timeout(bool* cond, uint ms);
}