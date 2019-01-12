#!/bin/bash

makerHook () {
    maker_min=3
    if [[ $# < $maker_min ]] ; then
        echo "Too few hook args;"
        echo "Usage: makerHook  trigger, min_args, max_argss"
        return
    fi

    key=$(< ~/.shell/.IFTTTkey)
    # Settings from caller
    trigger=$1
    min_args=$2
    max_args=$3
    shift $maker_min

    if (( $# < $(($min_args)) )) ; then
        echo "Too few specific args;"
        echo "Min_args: $min_args"
        echo "Max_args: $max_args"
        return
    fi

    if (( $max_args >= 0 )) && (( $# > $(($max_args)) )) ; then
        echo "Too many specific args;"
        echo "Min_args: $min_args"
        echo "Max_args: $max_args"
        return
    fi

    V1=$1
    V2=$2
    V3=$3

    json_template='{
        value1: $v1,
        value2: $v2,
        value3: $v3
    }'

    jq -n --arg v1 "$V1" \
        --arg v2 "$V2" \
        --arg v3 "$V3" "$json_template" |
        curl -sS -o /dev/null -X POST \
        -H "Content-Type: application/json" \
        -d@- \
        https://maker.ifttt.com/trigger/"$trigger"/with/key/"$key" \
        2>&1
}
