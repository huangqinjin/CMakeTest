#!/usr/bin/env bash
cmake -P "${BASH_SOURCE%.*}.cmake" -- "$@"
