module ltc294x;

import tock;

enum interrupt_pin_conf_e {
  InterruptPinDisabled = 0,
  InterruptPinChargeCompleteMode = 1,
  InterruptPinAlertMode = 2,
};

enum vbat_alert_adc_mode_e {
  // LTC2941
  VbatAlertOff = 0,
  VbatAlert2V8 = 1,
  VbatAlert2V9 = 2,
  VbatAlert3V0 = 3,
  // LTC29412/3
  ADCSleep = 0,
  ADCManual = 1,
  ADCScan = 2,
  ADCAuto = 3,  
};

enum ltc294x_model_e {
  LTC2941 = 1,
  LTC2942 = 2,
  LTC2943 = 3,   
};

extern(C) {
    int ltc294x_set_callback (subscribe_cb callback, void* callback_args);

    int ltc294x_read_status();

    int ltc294x_configure(ltc294x_model_e model,interrupt_pin_conf_e int_pin, ushort prescaler, vbat_alert_adc_mode_e vbat);

    int ltc294x_reset_charge();

    int ltc294x_set_high_threshold(ushort threshold);

    int ltc294x_set_low_threshold(ushort threshold);

    int ltc294x_get_charge();

    int ltc294x_get_voltage();

    int ltc294x_get_current();

    int ltc294x_shutdown();

    int ltc294x_set_model(ltc294x_model_e model);


    int ltc294x_read_status_sync();
    int ltc294x_configure_sync(ltc294x_model_e model, interrupt_pin_conf_e int_pin, ushort prescaler, vbat_alert_adc_mode_e vbat);
    int ltc294x_reset_charge_sync();
    int ltc294x_set_high_threshold_sync(ushort threshold);
    int ltc294x_set_low_threshold_sync(ushort threshold);
    int ltc294x_get_charge_sync();
    int ltc294x_get_voltage_sync();
    int ltc294x_get_current_sync();
    int ltc294x_shutdown_sync();


    int ltc294x_convert_to_coulomb_uah(int c, int Rsense, ushort prescaler, ltc294x_model_e model);
    int ltc294x_convert_to_voltage_mv(int v);
    int ltc294x_convert_to_current_ua(int c, int Rsense);
}