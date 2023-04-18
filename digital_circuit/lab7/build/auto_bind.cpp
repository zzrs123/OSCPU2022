#include <nvboard.h>
#include "Vps2_func.h"

void nvboard_bind_all_pins(Vps2_func* top) {
	nvboard_bind_pin( &top->clrn, BIND_RATE_SCR, BIND_DIR_IN , 1, SW0);
	nvboard_bind_pin( &top->ps2_clk, BIND_RATE_RT , BIND_DIR_IN , 1, PS2_CLK);
	nvboard_bind_pin( &top->ps2_data, BIND_RATE_RT , BIND_DIR_IN , 1, PS2_DAT);
	nvboard_bind_pin( &top->ready, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD0);
	nvboard_bind_pin( &top->fifo_overflow, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD1);
	nvboard_bind_pin( &top->out_led0, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG0G, SEG0F, SEG0E, SEG0D, SEG0C, SEG0B, SEG0A);
	nvboard_bind_pin( &top->out_led1, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG1G, SEG1F, SEG1E, SEG1D, SEG1C, SEG1B, SEG1A);
	nvboard_bind_pin( &top->out_led2, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG2G, SEG2F, SEG2E, SEG2D, SEG2C, SEG2B, SEG2A);
	nvboard_bind_pin( &top->out_led3, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG3G, SEG3F, SEG3E, SEG3D, SEG3C, SEG3B, SEG3A);
	nvboard_bind_pin( &top->out_led4, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG4G, SEG4F, SEG4E, SEG4D, SEG4C, SEG4B, SEG4A);
	nvboard_bind_pin( &top->out_led5, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG5G, SEG5F, SEG5E, SEG5D, SEG5C, SEG5B, SEG5A);
}
