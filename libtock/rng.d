module rng;

import tock;

extern(C) {
    int rng_async(subscribe_cb callback, ubyte* buf, uint len, uint num);

    int rng_sync(ubyte* buf, uint len, uint num);

    int rng_set_callback(subscribe_cb callback, void* callback_args);

    int rng_get_random(int num_bytes);
}