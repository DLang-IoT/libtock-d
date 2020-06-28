#include "l3gd20.h"

// struct to hold values send with the callback
typedef struct l3gd20_response {
  int data1;
  int data2;
  int data3;
  bool done;  // the callback has been called
} L3GD20Response;

// see manual page 9
const float SCALE_FACTOR[3] = {8.75, 17.5, 70.0};

unsigned char scale_factor = 0;

static void command_callback_yield (int data1, int data2, int data3, void* ud) {
  L3GD20Response *response = (L3GD20Response*)ud;
  if (response) {
    response->data1 = data1;
    response->data2 = data2;
    response->data3 = data3;
    response->done  = true;
  }
}

static int l3gd20_subscribe (subscribe_cb cb, void *userdata) {
  return subscribe(DRIVER_NUM_L3GD20, 0, cb, userdata);
}

bool l3gd20_is_present (void) {
  L3GD20Response response;
  response.data1 = false;
  response.done  = false;
  // subscribe
  l3gd20_subscribe (command_callback_yield, &response);
  if (command (DRIVER_NUM_L3GD20, 1, 0, 0) == TOCK_SUCCESS) {
    yield_for (&(response.done));
  }
  return response.data1 ? true : false;
}

int l3gd20_power_on (void) {
  int evalue;
  L3GD20Response response;
  response.done = false;
  // subscribe
  l3gd20_subscribe (command_callback_yield, &response);
  evalue = command (DRIVER_NUM_L3GD20, 2, 0, 0);
  if (evalue == TOCK_SUCCESS) {
    yield_for (&(response.done));
  }
  return evalue;
}

int l3gd20_set_scale (unsigned char scale) {
  if (scale > 2) scale = 2;
  int evalue;
  L3GD20Response response;
  response.done = false;
  // subscribe
  l3gd20_subscribe (command_callback_yield, &response);
  evalue = command (DRIVER_NUM_L3GD20, 3, scale, 0);
  if (evalue == TOCK_SUCCESS) {
    scale_factor = scale;
    yield_for (&(response.done));
  }
  return evalue;
}

int l3gd20_enable_hpf (bool enabled) {
  int evalue;
  L3GD20Response response;
  response.done = false;
  // subscribe
  l3gd20_subscribe (command_callback_yield, &response);
  evalue = command (DRIVER_NUM_L3GD20, 4, enabled ? 1 : 0, 0);
  if (evalue == TOCK_SUCCESS) {
    yield_for (&(response.done));
  }
  return evalue;
}

int l3gd20_set_hpf_parameters (unsigned char mode, unsigned char divider) {
  int evalue;
  L3GD20Response response;
  response.done = false;
  // subscribe
  l3gd20_subscribe (command_callback_yield, &response);
  evalue = command (DRIVER_NUM_L3GD20, 5, mode, divider);
  if (evalue == TOCK_SUCCESS) {
    yield_for (&(response.done));
  }
  return evalue;
}

int l3gd20_read_xyz (L3GD20XYZ *xyz) {
  int evalue;
  L3GD20Response response;
  response.done = false;
  // subscribe
  l3gd20_subscribe (command_callback_yield, &response);
  evalue = command (DRIVER_NUM_L3GD20, 6, 0, 0);
  if (evalue == TOCK_SUCCESS) {
    yield_for (&(response.done));
    if (xyz != NULL) {
      xyz->x = (float)response.data1 * SCALE_FACTOR[scale_factor] * 0.001;
      xyz->y = (float)response.data2 * SCALE_FACTOR[scale_factor] * 0.001;
      xyz->z = (float)response.data3 * SCALE_FACTOR[scale_factor] * 0.001;
    }
  }
  return evalue;
}

int l3gd20_read_temperature (int *temperature) {
  int evalue;
  L3GD20Response response;
  response.done = false;
  // subscribe
  l3gd20_subscribe (command_callback_yield, &response);
  evalue = command (DRIVER_NUM_L3GD20, 7, 0, 0);
  if (evalue == TOCK_SUCCESS) {
    yield_for (&(response.done));
    if (temperature != NULL) {
      *temperature = response.data1;
    }
  }
  return evalue;
}
