module aes;

import tock;

extern(C) {
    int aes128_set_callback(subscribe_cb callback, void* callback_args);
    int aes128_set_data(const char* data, char len);
    int aes128_set_ctr(const char* ctr, char len);

    int aes128_encrypt_start();
    int aes128_decrypt_start();

    int aes128_encrypt_ctr(const char* buf, char buf_len, const char* ctr, char ctr_len, subscribe_cb callback);
    int aes128_decrypt_ctr(const char* buf, char buf_len, const char* ctr, char ctr_len, subscribe_cb callback);

    int aes128_set_key_sync(const char* key, char len);

    int aes128_encrypt_ctr_sync(const char* buf, char buf_len, const char* ctr, char ctr_len);
    int aes128_decrypt_ctr_sync(const char* buf, char buf_len, const char* ctr, char ctr_len);
}