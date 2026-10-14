
import subprocess


def run_simulation():
    print("Starting Cocotb simulation...")

    with open("simulation.log", "w") as log_file:
        result = subprocess.run(
            ["make"],
            stdout=log_file,
            stderr=subprocess.STDOUT
        )

    return result.returncode


def analyze_log(filename):
    errors = []
    warnings = []

    with open(filename, "r") as log_file:
        for line in log_file:
            line = line.strip()

            if "ERROR" in line.upper():
                errors.append(line)

            elif "WARNING" in line.upper():
                warnings.append(line)

    return errors, warnings


def main():
    return_code = run_simulation()

    errors, warnings = analyze_log("simulation.log")

    print("\n===== SIMULATION SUMMARY =====")
    print("Errors:", len(errors))
    print("Warnings:", len(warnings))

    print("\n--- Errors ---")
    for error in errors:
        print(error)

    print("\n--- Warnings ---")
    for warning in warnings:
        print(warning)

    if return_code == 0 and len(errors) == 0:
        print("\nSimulation PASSED")
    else:
        print("\nSimulation FAILED")


if __name__ == "__main__":
    main()
