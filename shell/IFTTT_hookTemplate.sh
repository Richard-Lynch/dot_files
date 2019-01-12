#!/bin/bash

name_of_function () {
    trigger="name_of_trigger_event"
    min_args=0
    max_args=-1 # -1 for no max ( 3 is upper limit in makerHook.sh )

    # source ~/Drive/Programs/scripts/utils/IFTTT/makerHook.sh
    makerHook $trigger $min_args $max_args "$@"
}
