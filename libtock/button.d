module button;

import tock;

extern(C) {
    int button_subscribe(subscribe_cb callback, void* ud);
    int button_enable_interrupt(int pin_num);
    int button_disable_interrupt(int pin_num);
    int button_read(int pin_num);
    int button_count();
}