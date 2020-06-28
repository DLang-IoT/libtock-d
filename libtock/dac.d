module dac;

extern(C) {
    int dac_initialize();
    int dac_set_value(uint value);
}