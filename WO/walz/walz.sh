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
    echo -e "${GREEN}Creating keystores...${NC}"

    # Get he name for the keystore
    echo -e "Enter the name of keystore: "
    read nama
    if [ -z "$nama" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi

    # Command Set
    CO1="mkdir -p $nama"
    CO2="cast wallet new $nama"
    CO3="cast wallet ls --dir $nama"

    # Execution set
    echo -e "${GREEN}-------------------------------${NC}"
    echo -e "${GREEN}Creating Keystore Directory: ${NC}${CO1}"
    eval "$CO1"
    echo -e "${GREEN}-------------------------------${NC}"
    echo -e "${GREEN}Creating New Keystore: ${NC}${CO2}"
    eval "$CO2"
    echo -e "${GREEN}-------------------------------${NC}"
    echo -e "${GREEN}Listing Keystore: ${NC}${CO3}"
    eval "$CO3"

}

cast_decrypt_keystore() {
    # Get he name for the keystore
    echo -e "Enter the name of keystore directory: "
    read nama
    if [ -z "$nama" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi
    echo -e "You entered: ${GREEN}$nama${NC}"

    CO1="cast wallet ls --dir $nama"
    eval "$CO1"
    echo -e "Enter the name of keystore name: "
    read nama2
    if [ -z "$nama2" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi
    echo -e "You entered: ${GREEN}$nama2${NC}"

}

# execution
cast_decrypt_keystore
