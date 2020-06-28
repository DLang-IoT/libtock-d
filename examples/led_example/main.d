import led;
import tock;
import timer;

extern(C) int main() {
    int num_leds = led_count();
    for (int count = 0; count < 9; count++) {
        for (int i = 0; i < num_leds; i++) {
            delay_ms(500);
            if (count & (1 << i)) {
                led_on(i);
            } else {
                led_off(i);
            }
        }
    }
    delay_ms(250);
    return 0;
}
