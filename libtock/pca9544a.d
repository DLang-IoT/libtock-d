module pca9544a;

import tock;

extern(C) {
    int pca9544a_set_callback(subscribe_cb callback, void* callback_args);

    int pca9544a_select_channels(uint channels);
    int pca9544a_disable_all_channels();
    int pca9544a_read_interrupts();
    int pca9544a_read_selected();

    int pca9544a_select_channels_sync(uint channels);
    int pca9544a_disable_all_channels_sync();
    int pca9544a_read_interrupts_sync();
    int pca9544a_read_selected_sync();
}