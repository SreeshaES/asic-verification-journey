import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ReadOnly, Timer


@cocotb.test()
async def test_counter_basic(dut):

    # Start clock
    cocotb.start_soon(
        Clock(dut.clk, 10, unit="ns").start()
    )

    # -------------------------
    # Reset
    # -------------------------
    dut.reset.value = 1
    dut.enable.value = 0

    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    # Now safely sample the reset value
    await ReadOnly()

    assert dut.count.value == 0, \
        "Counter did not reset to 0"

    # -------------------------
    # Release reset
    # -------------------------
    # Wait for the next timestep before driving
    await Timer(1, unit="ns")

    dut.reset.value = 0
    dut.enable.value = 1

    # -------------------------
    # Check counting
    # -------------------------
    for expected_count in range(1, 10):

        await RisingEdge(dut.clk)
        await ReadOnly()

        actual_count = dut.count.value

        assert actual_count == expected_count, \
            f"Expected {expected_count}, got {actual_count}"

    dut._log.info("Basic counter test passed!")
