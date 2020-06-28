module ble;

import tock;

enum TxPower_t {
  POSITIVE_10_DBM = 10,
  POSITIVE_9_DBM = 9,
  POSITIVE_8_DBM = 8,
  POSITIVE_7_DBM = 7,
  POSITIVE_6_DBM = 6,
  POSITIVE_5_DBM = 5,
  POSITIVE_4_DBM = 4,
  POSITIVE_3_DBM = 3,
  POSITIVE_2_DBM = 2,
  POSITIVE_1_DBM = 1,
  ZERO_DBM = 0,
  NEGATIVE_1_DBM = 0xff,
  NEGATIVE_2_DBM = 0xfe,
  NEGATIVE_3_DBM = 0xfd,
  NEGATIVE_4_DBM = 0xfc,
  NEGATIVE_5_DBM = 0xfb,
  NEGATIVE_6_DBM = 0xfa,
  NEGATIVE_7_DBM = 0xf9,
  NEGATIVE_8_DBM = 0xf8,
  NEGATIVE_9_DBM = 0xf7,
  NEGATIVE_10_DBM = 0xf6,
  NEGATIVE_11_DBM = 0xf5,
  NEGATIVE_12_DBM = 0xf4,
  NEGATIVE_13_DBM = 0xf3,
  NEGATIVE_14_DBM = 0xf2,
  NEGATIVE_15_DBM = 0xf1,
  NEGATIVE_16_DBM = 0xf0,
  NEGATIVE_17_DBM = 0xef,
  NEGATIVE_18_DBM = 0xee,
  NEGATIVE_19_DBM = 0xed,
  NEGATIVE_20_DBM = 0xec
}

extern(C) {
  int ble_start_advertising(int pdu_type, ubyte* advd, int len, ushort interval);
  int ble_stop_advertising();

  int ble_start_passive_scan(ubyte* data, ubyte len, subscribe_cb callback);
  int ble_stop_passive_scan();

  int ble_set_tx_power(TxPower_t power_level);
}