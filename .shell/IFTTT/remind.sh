#!/bin/bash

trigger="add_reminder"
min_args=1
max_args=2

remind () {
    makerHook $trigger $min_args $max_args "$@"
}
