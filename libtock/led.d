module led;

extern(C) {
    int led_count();
    int led_on(int led_num);
    int led_off(int led_num);
    int led_toggle(int led_num);
}