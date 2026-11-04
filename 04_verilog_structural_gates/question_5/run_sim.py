import sys
from pathlib import Path


def check_simulation(log_file):
    log_path = Path(log_file)

    if not log_path.is_file():
        print(f"FAIL: Log file not found: {log_file}")
        return 1

    log = log_path.read_text(errors="replace")

    print("\nChecking simulation log...")

    required_messages = [
        "Total combinations: 16",
        "Total errors: 0",
        "ALL TESTS PASSED",
    ]

    missing = [
        message
        for message in required_messages
        if message not in log
    ]

    if "TEST FAILED" in log or missing:
        print("SIMULATION CHECK FAILED")

        for message in missing:
            print(f"Missing expected message: {message}")

        return 1

    print("PASS: All 16 input combinations tested")
    print("PASS: Total errors = 0")
    print("PASS: ALL TESTS PASSED")
    print("SIMULATION CHECK PASSED")

    return 0


if __name__ == "__main__":
    log_file = (
        sys.argv[1]
        if len(sys.argv) > 1
        else "simulation.log"
    )
    sys.exit(check_simulation(log_file))