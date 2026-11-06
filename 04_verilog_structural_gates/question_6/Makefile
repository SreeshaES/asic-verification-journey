
# Question 6: Circuit Schematic Implementation

SIMULATOR = iverilog
RUNNER = vvp
PYTHON = python3

RTL = rtl/circuit_schematic.v
TB = tests/tb_circuit_schematic.v

SIM_EXE = sim_circuit_schematic
LOG = simulation.log
WAVE = circuit_schematic.vcd

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
