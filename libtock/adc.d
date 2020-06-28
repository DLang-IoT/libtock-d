module adc;

import tock;

extern(C) {
    int adc_set_callback(subscribe_cb callback, void* callback_args);
    int adc_set_buffer(ushort* buffer, uint length);
    int adc_set_double_buffer(ushort* buffer, uint length);
    bool adc_is_present();
    int adc_channel_count();
    int adc_single_sample(ubyte channel);
    int adc_continuous_sample(ubyte channel, uint frequency);
    int adc_buffered_sample(ubyte channel, uint frequency);
    int adc_continuous_buffered_sample(ubyte channel, uint frequency);
    int adc_stop_sampling();

    int adc_set_single_sample_callback(void function (ubyte, ushort, void*) *callback, void* callback_args);
    int adc_set_continuous_sample_callback(void function (ubyte, ushort, void*) *callback, void* callback_args);
    int adc_set_buffered_sample_callback(void function (ubyte, uint, ushort*, void*) *callback, void* callback_args);
    int adc_set_continuous_buffered_sample_callback(void function (ubyte, uint, ushort*, void*) *callback, void* callback_args);

    int adc_sample_sync(ubyte channel, ushort* sample);
    int adc_sample_buffer_sync(ubyte channel, uint frequency, ushort* buffer, uint length);
}