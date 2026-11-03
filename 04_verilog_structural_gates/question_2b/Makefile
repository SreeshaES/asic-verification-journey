
# Question 2(b): Eight-bit bidirectional buffer array

SIMULATOR = iverilog
RUNNER = vvp
PYTHON = python3

RTL = rtl/Buffer1.v rtl/bidirectional_buffer_array.v
TB = tests/tb_bidirectional_buffer_array.v

SIM_EXE = sim_bidirectional
LOG = simulation.log
WAVE = bidirectional_buffer_array.vcd

.PHONY: all compile simulate check clean

all: check

compile:
	$(SIMULATOR) -g2012 -o $(SIM_EXE) $(RTL) $(TB)

simulate: compile
	$(RUNNER) $(SIM_EXE) > $(LOG) 2>&1; status=$$?; cat $(LOG); exit $$status

check: simulate
	$(PYTHON) run_sim.py $(LOG)

clean:
	rm -f $(SIM_EXE) $(LOG) $(WAVE)
