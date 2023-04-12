#include <nvboard.h>
#include "Vtimer.h"

static TOP_NAME top;

void nvboard_bind_all_pins(Vtimer* top);
void single_cycle() {
    top.clk = 0;top.eval();
    top.clk = 1;top.eval();
}
void reset(int n) {
    top.rst = 1;
    while (n-- > 0) {
        single_cycle();
    }
    top.rst = 0;
}
int main(){
    nvboard_bind_all_pins(&top);
    nvboard_init();
    reset(20);
    while(1){
        nvboard_update();
        single_cycle();
    }
    nvboard_quit();
}