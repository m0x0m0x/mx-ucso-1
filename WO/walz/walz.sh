#!/usr/bin/bash
# This bash srcript is for installing the KL docker image here
clear

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'
export NC='\033[0m' # No Color

# Commands

hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

# Creating a keystore
cast_create_keystore() {
    echo -e "${GREEN}Creating keystore...${NC}"

    # Get he name for the keystore
    echo -e "Enter the name of keystore: "
    read nama
    if [ -z "$nama" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi

    CO1="mkdir -p $nama"
    CO2="cast wallet new $nama"
    echo -e "${GREEN}Command: ${NC}${CO1}"
    eval "$CO1"
    eval "$CO2"

}

# Execution
cast_create_keystore
