#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include"Vour_OnOff.h"

int main(int argc,char **argv){
	Verilated::commandArgs(argc,argv);
	Vour_OnOff *top = new Vour_OnOff("top");
	while(!Verilated::gotFinish()){
		int a = rand() & 1;
		int b = rand() & 1;
		top->a = a;
		top->b = b;
		top->eval();
		printf("a=%d, b=%d, f=%d\n", a, b, top->f);
		assert(top->f == a ^ b);
		sleep(1);
	}
	delete top;
	return 0;
	
}

