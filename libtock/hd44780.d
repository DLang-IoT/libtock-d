module hd44780;

extern(C) {
    int hd44780_begin();

    int hd44780_clear();
    int hd44780_home();

    int hd44780_no_display();
    int hd44780_display();
    int hd44780_no_blink();
    int hd44780_blink();
    int hd44780_no_cursor();
    int hd44780_cursor();

    int hd44780_scroll_display_left();
    int hd44780_scroll_display_right();
    int hd44780_left_to_right();
    int hd44780_right_to_left();
    int hd44780_autoscroll();
    int hd44780_no_autoscroll();
    int hd44780_set_cursor(ubyte line, ubyte position);

    ubyte hd44780_print_string(char* str);
    ubyte hd44780_print_full_string(char* str);
}