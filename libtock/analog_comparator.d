module analog_comparator;

import tock;

extern(C) {
    bool analog_comparator_exists();
    int analog_comparator_count();
    bool analog_comparator_comparison(ubyte channel);
    int analog_comparator_start_comparing(ubyte channel);
    int analog_comparator_stop_comparing(ubyte channel);
    int analog_comparator_interrupt_callback(subscribe_cb callback, void* callback_args);
}