#include <nvboard.h>
#include "Vfsm.h"

TOP_NAME top;

void nvboard_bind_all_pins(Vfsm* top);

// static void single_cycle() {
//     top.clk = 0;top.eval();
//     top.clk = 1;top.eval();
// }

int main(){
    nvboard_bind_all_pins(&top);
    nvboard_init();

    while(1){
        nvboard_update();
        top.eval();

    }
    nvboard_quit();
}