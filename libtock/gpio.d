module gpio;

import tock;

enum GPIO_InputMode_t {
    PullNone = 0,
    PullUp,
    PullDown
};
enum GPIO_InterruptMode_t {
    Change = 0,
    RisingEdge,
    FallingEdge
}

extern(C) {
    alias GPIO_Pin_t = uint;
    int gpio_count();
    int gpio_enable_output(GPIO_Pin_t pin);
    int gpio_set(GPIO_Pin_t pin);
    int gpio_clear(GPIO_Pin_t pin);
    int gpio_toggle(GPIO_Pin_t pin);
    int gpio_enable_input(GPIO_Pin_t pin, GPIO_InputMode_t pin_config);
    int gpio_read(GPIO_Pin_t pin);
    int gpio_enable_interrupt(GPIO_Pin_t pin, GPIO_InterruptMode_t irq_config);
    int gpio_disable_interrupt(GPIO_Pin_t pin);
    int gpio_disable(GPIO_Pin_t pin);
    int gpio_interrupt_callback(subscribe_cb callback, void* callback_args);
}