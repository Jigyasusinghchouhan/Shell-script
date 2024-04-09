#!/bin/bash

# Disclaimer
echo "This script is for entertainment purposes only."

# Function definition to check adherence to company protocols
function check_protocol() {
    read -p "Enter the name of the employee: " employee_name
    read -p "Has $employee_name followed all company protocols? (yes/no): " adherence

    if [[ $adherence == "yes" ]]; then
        echo "$employee_name is following company protocols."
    else
        echo "$employee_name is not following company protocols."
    fi
}

# Calling the function
check_protocol

