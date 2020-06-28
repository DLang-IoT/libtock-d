module tmp006;

import tock;

extern(C) {
    int tmp006_read_sync(ushort* temp_reading);
    int tmp006_read_async(subscribe_cb callback, void* callback_args);
    int tmp006_start_sampling(ubyte period, subscribe_cb callback, void* callback_args);
    int tmp006_stop_sampling();
}