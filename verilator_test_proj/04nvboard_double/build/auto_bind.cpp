#include <nvboard.h>
#include "Vdouble_control.h"

void nvboard_bind_all_pins(Vdouble_control* top) {
	nvboard_bind_pin( &top->a, BIND_RATE_SCR, BIND_DIR_IN , 1, SW0);
	nvboard_bind_pin( &top->b, BIND_RATE_SCR, BIND_DIR_IN , 1, SW1);
	nvboard_bind_pin( &top->f, BIND_RATE_SCR, BIND_DIR_OUT, 1, LD0);
}
