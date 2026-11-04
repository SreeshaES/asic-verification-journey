
# Question 4: 8-input Even Parity Generator

SIMULATOR = iverilog
RUNNER = vvp
PYTHON = python3

RTL = rtl/even_parity_generator.v
TB = tests/tb_even_parity_generator.v

SIM_EXE = sim_even_parity
LOG = simulation.log
WAVE = even_parity_generator.vcd

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
