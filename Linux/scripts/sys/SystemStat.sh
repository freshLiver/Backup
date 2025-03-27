#!/bin/bash

# dependencies: dstat, lm-sensors, bc
USAGE="Usage: ./SystemStat.sh command [interval]"

COMMAND=$1          # no default command, must be specified
INTERVAL=${2:-0}    # default no sleep

if [[ -n "$COMMAND" ]]; then

    # parse args and do command
    case "$COMMAND" in
        --ns | --net_speed)
            ns_toks=( $(dstat --net 1 2 | tail -n 1) )
            OUTPUT="▼ ${ns_toks[0]^^} | ▲ ${ns_toks[1]^^}"
            ;;

        --cu | --cpu_usage)
            cu_toks=( $(dstat --cpu 1 2 | tail -n 1) )
            OUTPUT=$(printf "%3d%%" $((100 - ${cu_toks[2]})))
            ;;

        --ct | --cpu_temper)
            ct_toks=( $(sensors | grep "Package") )
            OUTPUT="${ct_toks[3]:1}"
            ;;

        --mu | mem_usage)
            mu_toks=( $(free | tail -n 2 | head -n 1) )
            mu_gib=$(echo "scale=2; ${mu_toks[2]} / (1024*1024)" | bc -l)
            mu_perc=$(echo "scale=1; ${mu_toks[2]}*100 / ${mu_toks[1]}" | bc -l)
            OUTPUT="${mu_gib} GiB (${mu_perc}%)"
            ;;
        *)
            OUTPUT="$USAGE"
            ;;
    esac

    # print result
    echo " $OUTPUT "

    # sleep if needed
    if [[ $INTERVAL -ge 1 ]]; then
        sleep $INTERVAL
    fi
else
    echo -e "Command not specified.\n\n$USAGE"
fi
