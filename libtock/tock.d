module tock;

extern(C) {
    alias subscribe_cb = void function(int, int, int, void*);


    void yield();
    int command(uint, uint, int, int);
    int allow(uint, uint, void*, size_t);
    int subscribe(uint, uint, subscribe_cb, void*);

    void* memop(uint, int);
    void yield_for(bool*);

    int tock_enqueue(subscribe_cb, int, int, int, void*);
    void tock_expect(int, int, const char*, uint);
    char* tock_strerror(int);

    bool driver_exists(uint);

    void* tock_app_writeable_flash_region_ends_at(int);
    void* tock_app_memory_begins_at();
    void* tock_app_memory_ends_at();
    void* tock_app_flash_begins_at();
    void* tock_app_flash_ends_at();
    void* tock_app_grant_begins_at();
    int tock_app_number_writeable_flash_regions();
    void* tock_app_writeable_flash_region_begins_at(int);
    void* tock_app_writeable_flash_region_begins_at(int region_index);
}