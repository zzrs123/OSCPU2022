#include <nvboard.h>
#include "Vfsm.h"

void nvboard_bind_all_pins(Vfsm* top) {
	nvboard_bind_pin( &top->clk, BIND_RATE_SCR, BIND_DIR_IN , 1, BTNC);
	nvboard_bind_pin( &top->reset_n, BIND_RATE_SCR, BIND_DIR_IN , 1, SW0);
	nvboard_bind_pin( &top->in_data, BIND_RATE_SCR, BIND_DIR_IN , 1, SW1);
	nvboard_bind_pin( &top->out_data, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD0);
	nvboard_bind_pin( &top->out_led, BIND_RATE_SCR, BIND_DIR_OUT, 4, LD7, LD6, LD5, LD4);
}
