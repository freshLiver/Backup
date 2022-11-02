#!/bin/bash

# get recv/send speed array from dstat
speed_toks=( $(dstat --net 1 2 | tail -n 1 | tr -s ' ') )


echo "▼ ${speed_toks[0]^^} | ▲ ${speed_toks[1]^^}"
