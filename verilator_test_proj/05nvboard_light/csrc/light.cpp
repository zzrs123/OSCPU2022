#include <nvboard.h>
#include "Vlight.h"

static TOP_NAME light;

void nvboard_bind_all_pins(Vlight *light);

void single_cycle() {
  light.clk = 0; light.eval();
  light.clk = 1; light.eval();
}

void reset(int n) {
    light.rst = 1;
    while (n-- > 0) {
        single_cycle();
    }
    light.rst = 0;
}


int main(){
    nvboard_bind_all_pins(&light);
    nvboard_init();
    reset(10);
    while(1){
        nvboard_update();
        single_cycle();
    }
    nvboard_quit();
}
