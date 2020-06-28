module usb;

import tock;

extern(C) {
    int usb_exists();
    int usb_subscribe(subscribe_cb, void*);
    int usb_enable_and_attach_async();
    int usb_enable_and_attach();
}