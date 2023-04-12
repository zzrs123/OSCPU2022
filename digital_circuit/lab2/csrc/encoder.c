//  8-3 优先编码器并用7位数码管显示
// Cpp部分不需要怎么改

#include <nvboard.h>
#include "Vencoder_top.h"

static TOP_NAME top;

void nvboard_bind_all_pins(Vencoder_top* top);

int main(){
    nvboard_bind_all_pins(&top);
    nvboard_init();

    while(1){
        nvboard_update();
        top.eval();
    }

    nvboard_quit();
}
