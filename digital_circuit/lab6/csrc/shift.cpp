#include <nvboard.h>
#include "Vlfsr_random.h"

TOP_NAME top;

void nvboard_bind_all_pins(Vlfsr_random* top);

static void single_cycle() {
    top.clk = 0;top.eval();
    top.clk = 1;top.eval();
}

int main() {
    nvboard_bind_all_pins(&top);
    nvboard_init();

    while(1) {
        nvboard_update();
        single_cycle();
    }

    nvboard_quit();
}