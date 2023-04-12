#include <nvboard.h>
#include "Vtimer.h"

void nvboard_bind_all_pins(Vtimer* top) {
	nvboard_bind_pin( &top->control, BIND_RATE_SCR, BIND_DIR_IN , 3, SW2, SW1, SW0);
	nvboard_bind_pin( &top->out_seg1, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG0G, SEG0F, SEG0E, SEG0D, SEG0C, SEG0B, SEG0A);
	nvboard_bind_pin( &top->out_seg2, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG1G, SEG1F, SEG1E, SEG1D, SEG1C, SEG1B, SEG1A);
	nvboard_bind_pin( &top->finished, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD0);
}
