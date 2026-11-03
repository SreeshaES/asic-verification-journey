
from pathlib import Path
import sys


def check_simulation(log_path):
    log_file = Path(log_path)

    if not log_file.exists():
        print(f"FAIL: Simulation log not found: {log_file}")
        return False

    log = log_file.read_text(errors="replace")

    print("\nChecking simulation log...")

    # Check that the simulation reached its success message.
    if "ALL TESTS PASSED" not in log:
        print("FAIL: Success message not found.")
        print("Check the simulation log for errors.")
        return False

    # Check that the Verilog testbench reported zero errors.
    if "Total errors: 0" not in log:
        print("FAIL: Total errors: 0 not found.")
        return False

    # Look for explicit failure messages.
    failure_markers = ("TEST FAILED", "FAIL:")

    for marker in failure_markers:
        if marker in log:
            print(f"FAIL: Found failure marker: {marker}")
            return False

    print("PASS: ALL TESTS PASSED")
    print("PASS: Total errors = 0")
    print("SIMULATION CHECK PASSED")
    return True


if __name__ == "__main__":
    log_path = sys.argv[1] if len(sys.argv) > 1 else "simulation.log"
    sys.exit(0 if check_simulation(log_path) else 1)
