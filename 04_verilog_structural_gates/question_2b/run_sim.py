
from pathlib import Path
import sys


def check_simulation(log_path="simulation.log"):
    log_file = Path(log_path)

    if not log_file.exists():
        print(f"FAIL: Simulation log not found: {log_file}")
        return False

    log = log_file.read_text(errors="replace")

    print("\nChecking simulation log...")

    # Check for the testbench success message.
    if "ALL TESTS PASSED" not in log:
        print("FAIL: Success message not found.")
        print("Review simulation.log for test failures.")
        return False

    # Check that the testbench reports zero errors.
    if "Total errors: 0" not in log:
        print("FAIL: Total errors: 0 not found.")
        return False

    # Reject explicit test failure markers.
    if "TEST FAILED" in log:
        print("FAIL: Testbench reported TEST FAILED.")
        return False

    print("PASS: ALL TESTS PASSED")
    print("PASS: Total errors = 0")
    print("SIMULATION CHECK PASSED")
    return True


if __name__ == "__main__":
    log_path = sys.argv[1] if len(sys.argv) > 1 else "simulation.log"
    sys.exit(0 if check_simulation(log_path) else 1)
