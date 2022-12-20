"""
This module is an interface to the package's data.json file.
"""
import os
import json

DATA = json.load(
    open(
        os.path.dirname(
            os.path.realpath(__file__)
        ) + "/data.json"
    )
)
