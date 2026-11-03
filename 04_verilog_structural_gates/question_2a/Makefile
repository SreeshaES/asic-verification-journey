
# Question 2(a): Eight-bit tri-state buffer array

SIMULATOR = iverilog
RUNNER = vvp

RTL = rtl/Buffer1.v rtl/buffer_array.v
TB = tests/tb_buffer_array.v

SIM_EXE = sim_buffer
LOG = simulation.log
WAVE = buffer_array.vcd

.PHONY: all compile simulate check clean

all: compile simulate check

compile:
	$(SIMULATOR) -g2012 -o $(SIM_EXE) $(RTL) $(TB)

simulate: compile
	$(RUNNER) $(SIM_EXE) > $(LOG) 2>&1
	cat $(LOG)

check: simulate
	python3 check_simulation.py $(LOG)

clean:
	rm -f $(SIM_EXE) $(LOG) $(WAVE)
