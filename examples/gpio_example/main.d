import gpio;
import tock;
import timer;

extern(C) int main() {
    GPIO_Pin_t pin1, pin2, pin3;
    int ret;

    pin1 = 5;
    pin2 = 4;
    pin3 = 3;

    ret = gpio_enable_output(pin1);
    ret = gpio_enable_output(pin2);
    ret = gpio_enable_output(pin3);

    int i = 0;
    while (i < 100) {
        gpio_clear(pin1);
        gpio_clear(pin2);
        gpio_clear(pin3);
        if (!(i % 3)) {
            gpio_set(pin1);
        } else if ((i % 3) == 1) {
            gpio_set(pin2);
        } else {
            gpio_set(pin3);
        }
        i++;
        delay_ms(1000);
    }

    return 0;
}