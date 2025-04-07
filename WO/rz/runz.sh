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

installz() {
    hea1 "Installing bacon "
    CO2="cargo install bacon cargo-show-asm"
    echo -e "${GREEN}$CO2${NC}"
    eval "$CO2"
}

run1() {
    CO1="bacon run -- -q"
    echo -e "${GREEN}$CO1${NC}"
    eval "$CO1"
}

# Execution
run1
