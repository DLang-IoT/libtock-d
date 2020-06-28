module app_state;

import tock;

extern(C) {
    void* _app_state_flash_pointer;
    void* app_state_save(subscribe_cb callback, void* callback_args);
    int app_state_save_sync();
}