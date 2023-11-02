#!/usr/bin/python3

import os
import subprocess
import time
from pathlib import Path

challenge_dir = Path(sys.argv[1])
PORT = "8547"
WEB3_INFURA_RPC = os.getenv("WEB3_INFURA_RPC")

# Command to run in the background
anvil_command = [
    "anvil",
    "--fork-url",
    WEB3_INFURA_RPC,
    "--auto-impersonate",
    "--port",
    PORT,
    # "--derivation-path",
    # "m/44'/60'/0'/",
]

# Start the anvil command in the background
anvil_process = subprocess.Popen(
    anvil_command,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    start_new_session=True,
    preexec_fn=os.setpgrp,  # This creates a new process group to keep it running in the background
)

# Sleep for 5 seconds
time.sleep(5)

# Change the current directory
os.chdir(challenge_dir / "challenge" / "project")

# Run the second command
forge_command = [
    "forge",
    "script",
    "--rpc-url",
    f"http://127.0.0.1:{PORT}",
    "script/Deploy.s.sol:Deploy",
    "--broadcast",
    "--unlocked",
    "--sender",
    "$(cast az)",
]

# Run the second command
forge_process = subprocess.Popen(
    forge_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE
)

# You can wait for the second command to finish if needed
forge_process.wait()

# You can check the output of the anvil process if necessary
anvil_output, anvil_error = anvil_process.communicate()

# Now, both commands are completed, and you can continue with your script

# Example: Print the output of the anvil process
print("Anvil Process Output:")
print(anvil_output.decode())
print("Anvil Process Error:")
print(anvil_error.decode())
