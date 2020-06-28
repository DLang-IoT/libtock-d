module ninedof;

import tock;

extern(C) {
    int ninedof_subscribe(subscribe_cb callback, void* userdata);
    int ninedof_start_accel_reading();
    int ninedof_start_magnetometer_reading();
    int ninedof_start_gyro_reading();
    double ninedof_read_accel_mag();

    int ninedof_read_acceleration_sync(int* x, int* y, int* z);

    int ninedof_read_magnetometer_sync(int* x, int* y, int* z);

    int ninedof_read_gyroscope_sync(int* x, int* y, int* z);
}