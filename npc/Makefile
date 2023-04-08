ifneq ($(words $(CURDIR)), 1)
    $(error Unsupported: GNU Make cannot build in directories containing spaces, build elsewhere: '$(CURDIR)')
endif

ifeq ($(VERILATOR_ROOT),)
    VERILATOR = verilator
else
    export VERILATOR_ROOT
    VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif
all:
	@echo "Write this Makefile by your self."

# sim:
	
# 	@echo "Write this Makefile by your self."
# 	verilator -Wall --cc --exe --build csrc/main.cpp vsrc/our_wave.v --trace
# 	make -C obj_dir -f Vour_wave.mk Vour_wave
# 	timeout 2 ./obj_dir/Vour_wave # 2s后结束执行
#	gtkwave wave.vcd	
build:
	$(VERILATOR) -Wall --cc --exe --build csrc/main.cpp vsrc/our_wave.v
	make -C obj_dir -f Vour_wave.mk Vour_wave
wave:
	$(VERILATOR) -Wall --cc --exe --build csrc/main.cpp vsrc/our_wave.v --trace
	make -C obj_dir -f Vour_wave.mk Vour_wave
run:
	$(VERILATOR) -Wall --cc --exe --build csrc/main.cpp vsrc/our_wave.v --trace
	make -C obj_dir -f Vour_wave.mk Vour_wave
	./obj_dir/Vour_wave
sim:	
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	gtkwave wave.vcd	
clean:
	-rm -rf obj_dir
include ../Makefile
