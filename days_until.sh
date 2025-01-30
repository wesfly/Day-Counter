#!/bin/bash

target_date="2025-03-01"

current_date=$(date +"%Y-%m-%d")

# Calculate the difference in days
days_until_target=$(( ($(date -d $target_date +%s) - $(date -d $current_date +%s)) / 86400 ))

notify-send "Days Until March 1, 2025" "There are $days_until_target days left until March 1, 2025."