#include <nvboard.h>
#include "Valu.h"

void nvboard_bind_all_pins(Valu* top) {
	nvboard_bind_pin( &top->in_func, BIND_RATE_SCR, BIND_DIR_IN , 3, SW2, SW1, SW0);
	nvboard_bind_pin( &top->in_a, BIND_RATE_SCR, BIND_DIR_IN , 4, SW7, SW6, SW5, SW4);
	nvboard_bind_pin( &top->in_b, BIND_RATE_SCR, BIND_DIR_IN , 4, SW11, SW10, SW9, SW8);
	nvboard_bind_pin( &top->out_result, BIND_RATE_SCR, BIND_DIR_OUT, 4, LD3, LD2, LD1, LD0);
	nvboard_bind_pin( &top->out_carry, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD4);
	nvboard_bind_pin( &top->out_overflow, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD5);
	nvboard_bind_pin( &top->out_zero, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD6);
}
