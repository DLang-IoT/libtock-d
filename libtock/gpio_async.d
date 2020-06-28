module gpio_async;

import tock;
import gpio;

extern(C) {
    int gpio_async_set_callback(subscribe_cb callback, void* callback_args);

    int gpio_async_interrupt_callback(subscribe_cb callback, void* callback_args);

    int gpio_async_make_output(uint port, ubyte pin);
    int gpio_async_set(uint port, ubyte pin);
    int gpio_async_clear(uint port, ubyte pin);
    int gpio_async_toggle(uint port, ubyte pin);
    int gpio_async_make_input(uint port, ubyte pin, GPIO_InputMode_t pin_config);
    int gpio_async_read(uint port, ubyte pin);
    int gpio_async_enable_interrupt(uint port, ubyte pin, GPIO_InterruptMode_t irq_config);
    int gpio_async_disable_interrupt(uint port, ubyte pin);
    int gpio_async_disable(uint port, ubyte pin);

    int gpio_async_make_output_sync(uint port, ubyte pin);
    int gpio_async_set_sync(uint port, ubyte pin);
    int gpio_async_clear_sync(uint port, ubyte pin);
    int gpio_async_toggle_sync(uint port, ubyte pin);
    int gpio_async_make_input_sync(uint port, ubyte pin, GPIO_InputMode_t pin_config);
    int gpio_async_read_sync(uint port, ubyte pin);
    int gpio_async_enable_interrupt_sync(uint port, ubyte pin, GPIO_InterruptMode_t irq_config);
    int gpio_async_disable_interrupt_sync(uint port, ubyte pin);
    int gpio_async_disable_sync(uint port, ubyte pin);
}