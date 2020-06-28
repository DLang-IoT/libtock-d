module l3gd20;

extern(C) {
    struct L3GD20XYZ;
    bool l3gd20_is_present();
    int l3gd20_power_on();
    int l3gd20_set_scale(char scale);
    int l3gd20_enable_hpf(bool enabled);
    int l3gd20_set_hpf_parameters(char mode, char divider);
    int l3gd20_read_xyz(L3GD20XYZ* xyz);
    int l3gd20_read_temperature(int* temperature);
}