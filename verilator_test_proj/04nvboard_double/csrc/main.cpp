#include <nvboard.h>
#include "Vdouble_control.h"

static TOP_NAME top;

void nvboard_bind_all_pins(Vdouble_control* double_control);

int main() {
    nvboard_bind_all_pins(&top);
    nvboard_init();

    while (1) {
        nvboard_update();
        top.eval();
    }
    // 严谨一点
    nvboard_quit();
}
