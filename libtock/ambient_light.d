module ambient_light;

import tock;

extern(C) {
    struct ambient_light_data_t;

    int ambient_light_subscribe(subscribe_cb callback, void* userdata);
    int ambient_light_start_intensity_reading();

    int ambient_light_read_intensity_sync(int* lux_value);
}