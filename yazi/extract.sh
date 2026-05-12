#!/bin/bash
unzip "$1" -d "$(dirname "$1")/$(basename "${1%.zip}")"
