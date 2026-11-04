# Question 5: Sum-of-Minterms Function

SIMULATOR = iverilog
RUNNER = vvp
PYTHON = python3

RTL = rtl/minterm_function.v
TB = tests/tb_minterm_function.v

SIM_EXE = sim_minterm_function
LOG = simulation.log
WAVE = minterm_function.vcd

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