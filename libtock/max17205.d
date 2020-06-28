module max17205;

import tock;

extern(C) {
    int max17205_set_callback (subscribe_cb callback, void* callback_args);

    int max17205_read_status();
    int max17205_read_soc();
    int max17205_read_voltage_current();
    int max17205_read_coulomb();
    int max17205_read_rom_id();

    int max17205_read_status_sync(ushort* state);
    int max17205_read_soc_sync(ushort* percent, ushort* soc_mah, ushort* soc_mah_full);
    int max17205_read_voltage_current_sync(ushort* voltage, short* current);
    int max17205_read_coulomb_sync (ushort* coulomb);
    int max17205_read_rom_id_sync (ulong* rom_id_buf);

    float max17205_get_voltage_mV(int vcount);
    float max17205_get_current_uA(int ccount);
    float max17205_get_percentage_mP(int percent);
    float max17205_get_capacity_uAh(int cap);
}