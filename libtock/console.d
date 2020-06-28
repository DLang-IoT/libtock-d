module console;

import tock;

extern(C) {
    int putstr(const char* str);
    int putnstr(const char* str, size_t len);
    int putnstr_async(const char* str, size_t len, subscribe_cb cb, void* userdata);

    int getnstr(char* str, size_t len);
    int getnstr_async(char* str, size_t len, subscribe_cb cb, void* userdata);

    int getch();

    int getnstr_abort();
}