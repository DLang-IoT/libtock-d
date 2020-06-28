module ieee802154;

import tock;

enum security_level_t {
  SEC_LEVEL_NONE = 0,
  SEC_LEVEL_MIC32 = 1,
  SEC_LEVEL_MIC64 = 2,
  SEC_LEVEL_MIC128 = 3,
  SEC_LEVEL_ENCMIC32 = 5,
  SEC_LEVEL_ENCMIC64 = 6,
  SEC_LEVEL_ENCMIC128 = 7,
};

enum key_id_mode_t {
  KEY_ID_IMPLICIT = 0,
  KEY_ID_INDEX = 1,
  KEY_ID_SRC_4_INDEX = 2,
  KEY_ID_SRC_8_INDEX = 3, 
};

enum addr_mode_t {
  ADDR_NONE = 0,
  ADDR_SHORT = 2,
  ADDR_LONG = 3,
}

extern(C) {
  int ieee802154_up();
  int ieee802154_down();
  bool ieee802154_is_up();

  int ieee802154_set_address(ushort addr);
  int ieee802154_set_address_long(char* addr_long);
  int ieee802154_set_pan(ushort pan);
  int ieee802154_set_channel(char channel);
  int ieee802154_set_power(char power);
  int ieee802154_config_commit();

  int ieee802154_get_address(ushort* addr);
  int ieee802154_get_address_long(char* addr_long);
  int ieee802154_get_pan(ushort* pan);
  int ieee802154_get_channel(char* channel);
  int ieee802154_get_power(char* power);

  int ieee802154_max_neighbors();
  int ieee802154_min_neighbors();
  int ieee802154_get_neighbor_address(uint index, ushort* addr);
  int ieee802154_get_neighbor_address_long(uint index, char* addr_long);
  int ieee802154_get_neighbor(uint index, ushort* addr, char* addr_long);
  int ieee802154_add_neighbor(ushort addr, char* addr_long, uint* index);
  int ieee802154_remove_neighbor(uint index);

  int ieee802154_max_keys();
  int ieee802154_min_keys();
  int ieee802154_get_key_security_level(uint index, security_level_t* level);
  int ieee802154_get_key_id(uint index, key_id_mode_t* key_id_mode, char* key_id);
  int ieee802154_key_id_bytes(key_id_mode_t key_id_mode);
  int ieee802154_get_key(uint index, char* key);
  int ieee802154_get_key_desc(uint index, security_level_t* level, key_id_mode_t* key_id_mode, char* key_id, char* key);
  int ieee802154_add_key(security_level_t level, key_id_mode_t key_id_mode, char* key_id, char* key, uint* index);
  int ieee802154_remove_key(uint index);

  int ieee802154_send(ushort addr, security_level_t level, key_id_mode_t key_id_mode, char* key_id, const char* payload, char len);

  int ieee802154_receive_sync(const char* frame, char len);

  int ieee802154_receive(subscribe_cb callback, const char* frame, char len);

  int ieee802154_frame_get_length(const char* frame);
  int ieee802154_frame_get_payload_offset(const char* frame);
  int ieee802154_frame_get_payload_length(const char* frame);
  addr_mode_t ieee802154_frame_get_dst_addr(const char* frame, ushort* short_addr, char* long_addr);
  addr_mode_t ieee802154_frame_get_src_addr(const char* frame, ushort* short_addr, char* long_addr);
  bool ieee802154_frame_get_dst_pan(const char* frame, ushort* pan);
  bool ieee802154_frame_get_src_pan(const char* frame, ushort* pan);
}