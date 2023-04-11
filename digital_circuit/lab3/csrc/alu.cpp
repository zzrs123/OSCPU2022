#include <nvboard.h>
#include "Valu.h"

static TOP_NAME top;

void nvboard_bind_all_pins(Valu* top);

int main(){
    nvboard_bind_all_pins(&top);
    nvboard_init();

    while(1){
        nvboard_update();
        top.eval();

    }
    nvboard_quit();
}