
# Question 3: Four-input minority function

SIMULATOR = iverilog
RUNNER = vvp
PYTHON = python3

RTL = rtl/minority_function.v
TB = tests/tb_minority_function.v

SIM_EXE = sim_minority
LOG = simulation.log
WAVE = minority_function.vcd

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
