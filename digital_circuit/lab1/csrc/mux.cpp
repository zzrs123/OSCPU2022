// 两位 4-1 选择器

#include <nvboard.h>
#include "VMux_Top.h"

static TOP_NAME top;

void nvboard_bind_all_pins(VMux_Top * top);

int main(){
    nvboard_bind_all_pins(&top);
    nvboard_init();

    while(1){
        nvboard_update();
        top.eval();

    }

    nvboard_quit();
}