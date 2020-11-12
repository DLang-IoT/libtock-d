import hd44780;

extern(C) int main() {
    char[16] string_1 = "Hi-from-Nucleo!";
    char[16] string_2 = "Using-GPIO-pins";

    int ret;
    ret = hd44780_begin();
    ret = hd44780_set_cursor(0, 0);

    ret = hd44780_print_string(cast(char*) string_1);
    ret = hd44780_set_cursor(0, 1);
    ret = hd44780_print_string(cast(char*) string_2);
    return 0;
}
