#include <nvboard.h>
#include "Vencoder_top.h"

void nvboard_bind_all_pins(Vencoder_top* top) {
	nvboard_bind_pin( &top->en, BIND_RATE_SCR, BIND_DIR_IN , 1, SW8);
	nvboard_bind_pin( &top->in_signals, BIND_RATE_SCR, BIND_DIR_IN , 8, SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0);
	nvboard_bind_pin( &top->out_code, BIND_RATE_SCR, BIND_DIR_OUT, 4, LD3, LD2, LD1, LD0);
	nvboard_bind_pin( &top->out_led, BIND_RATE_SCR, BIND_DIR_OUT, 7, SEG0G, SEG0F, SEG0E, SEG0D, SEG0C, SEG0B, SEG0A);
}
