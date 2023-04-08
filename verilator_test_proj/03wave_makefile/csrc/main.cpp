#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "Vour_wave.h"
#include "verilated_vcd_c.h"
 
vluint64_t main_time = 0;  //initial 仿真时间
 
double sc_time_stamp()
 {
     return main_time;
 }
 
int main(int argc,char **argv)
{
    Verilated::commandArgs(argc,argv);
    Verilated::traceEverOn(true); //导出vcd波形需要加此语句
 
    VerilatedVcdC* tfp = new VerilatedVcdC(); //导出vcd波形需要加此语句
 
    Vour_wave *top = new Vour_wave("top");
    top->trace(tfp, 0);
    tfp->open("wave.vcd"); //打开vcd
 
    while(!sc_time_stamp() < 20 && !Verilated::gotFinish())
    {                                                                                                                                                                                                            
        int a = rand() & 1;
        int b = rand() & 1;
        top->a = a;
        top->b = b;
        top->eval();
        printf("a = %d, b = %d, f = %d\n",a,b, top->f);
        tfp->dump(main_time); //dump wave
        main_time++; //推动仿真时间
        sleep(0.1);//慢一点
    }
    top->final();
    tfp->close();
    delete top;
    return 0;
}