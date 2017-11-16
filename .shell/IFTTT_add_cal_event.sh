#!/bin/bash


event () {
    trigger="add_cal_event"
    min_args=1
    max_args=-1 # -1 for no max ( 3 is upper limit in makerHook.sh )
    makerHook $trigger $min_args $max_args "$@"
}
