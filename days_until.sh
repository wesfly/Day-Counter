#!/bin/bash

# Function to validate date format
validate_date() {
    local date_str=$1
    if ! [[ $date_str =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        return 1
    fi
    if ! date -d "$date_str" >/dev/null 2>&1; then
        return 1
    fi
    return 0
}

# Read user input
read -p "Enter target date (YYYY-MM-DD): " target_date

# Validate input date
if ! validate_date "$target_date"; then
    echo "Error: Invalid date format. Please use YYYY-MM-DD format."
    exit 1
fi

# Get current date
current_date=$(date +"%Y-%m-%d")

# Calculate days difference
days_until_target=$(( ($(date -d "$target_date" +%s) - $(date -d "$current_date" +%s)) / 86400 ))

# Show notification
notify-send \
    -t 5000 \
    "Days Until Target Date" \
    "There are ${days_until_target#-} days until $target_date."