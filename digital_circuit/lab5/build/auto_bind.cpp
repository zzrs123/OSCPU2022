#include <nvboard.h>
#include "Vregs_top.h"

void nvboard_bind_all_pins(Vregs_top* top) {
	nvboard_bind_pin( &top->wr_en, BIND_RATE_SCR, BIND_DIR_IN , 1, BTNC);
	nvboard_bind_pin( &top->in_data, BIND_RATE_SCR, BIND_DIR_IN , 8, SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0);
	nvboard_bind_pin( &top->in_data_addr, BIND_RATE_SCR, BIND_DIR_IN , 4, SW11, SW10, SW9, SW8);
	nvboard_bind_pin( &top->out_data_addr, BIND_RATE_SCR, BIND_DIR_IN , 4, SW15, SW14, SW13, SW12);
	nvboard_bind_pin( &top->out_data, BIND_RATE_SCR, BIND_DIR_OUT, 8, LD7, LD6, LD5, LD4, LD3, LD2, LD1, LD0);
}
