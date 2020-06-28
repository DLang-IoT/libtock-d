module crc;

import tock;

enum crc_alg {
    CRC_32,
    CRC_32C, 
    CRC_SAM4L_16,
    CRC_SAM4L_32,
    CRC_SAM4L_32C,
};

extern(C) {
    int crc_exists();

    int crc_compute(const void* buf, size_t buflen, crc_alg value, uint* result);

    int crc_subscribe(subscribe_cb, void*);
    int crc_set_buffer(const void*, size_t);
    int crc_request(crc_alg);
}
