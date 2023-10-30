"""
This module is an interface to the package's data.json file.
"""

import json
import os

DATA = json.load(
    open(
        os.path.dirname(
            os.path.realpath(__file__)
        ) + "/data.json"
    )
)
