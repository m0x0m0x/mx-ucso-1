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

b1() {
    hea1 "UV Jupyter Lan Installation Commands"
}

# Function will ask for an input and convert to hex
encode_to_hex_input() {
    hea1 "Use cast to convert UTF8 to hex"
    echo -e ""
    echo -e "${BLUE}Write Text to encode: "
    echo -e "--------------------------------${NC}"
    read -r dataz
    if [ -z "$dataz" ]; then
        echo -e "${RED}BASTARD! PutSomething!${NC}"
        exit 1
    fi

    cmd1="cast fa \"$dataz\""
    hex_out=$(eval "$cmd1")
    cmd2="cast tas $hex_out"
    hex_in=$(eval "$cmd2")
    file_name="out.txt"

    echo -e "${CYAN}---Output---${NC}"
    echo -e "${GREEN} ${hex_out} ${NC}"
    echo "---Output---" >${file_name}
    echo "$hex_out" >>${file_name}
    echo -e ""
    echo -e "${YELLOW}---Input---${NC}"
    echo -e "${GREEN} ${hex_in} ${NC}"
    echo "---input---" >>${file_name}
    echo "$hex_in" >>${file_name}
}

#Function that will convert data stored in variable to hex
encodedata__to_hex_input() {
    hea1 "Use cast to convert UTF8 Data to hex"

    read -r -d '' dataz <<'EOF'

 ███████╗ ███╗   ███╗ ███████╗ ██╗      ██╗      ██████╗   █████╗  ███╗   ██╗ ████████╗ ██╗   ██╗
 ██╔════╝ ████╗ ████║ ██╔════╝ ██║      ██║      ██╔══██╗ ██╔══██╗ ████╗  ██║ ╚══██╔══╝ ╚██╗ ██╔╝
 ███████╗ ██╔████╔██║ █████╗   ██║      ██║      ██████╔╝ ███████║ ██╔██╗ ██║    ██║     ╚████╔╝ 
 ╚════██║ ██║╚██╔╝██║ ██╔══╝   ██║      ██║      ██╔═══╝  ██╔══██║ ██║╚██╗██║    ██║      ╚██╔╝  
 ███████║ ██║ ╚═╝ ██║ ███████╗ ███████╗ ███████╗ ██║      ██║  ██║ ██║ ╚████║    ██║       ██║   
 ╚══════╝ ╚═╝     ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝      ╚═╝  ╚═╝ ╚═╝  ╚═══╝    ╚═╝       ╚═╝   

EOF

    cmd1="cast fa \"$dataz\""
    hex_out=$(eval "$cmd1")
    file_name="out.txt"

    echo -e "${CYAN}---Output---${NC}"
    echo -e "${GREEN} ${hex_out} ${NC}"
    echo "---Output---" >${file_name}
    echo "$hex_out" >>${file_name}
    echo -e ""
}

# Send data with the transaction
ca_send_hex() {
    hea1 "Use cast to send hex data"

    read -r -d '' dataz <<'EOF'

 ⡏⣿⢱⣦⡀⡈⠻⢷⣾⠀⠀⡀⠀⠀⢻⣷⡞⠀⠀⠀⢀⣠⣲⣧⡢⠝⡇⢸⡿⣻
 ⣿⣛⠼⠛⠇⠯⢆⣌⣱⣴⣴⢀⢉⠹⣻⣵⠓⠠⣀⡀⢸⡏⣿⣽⣡⣖⣿⣿⡿⣿
 ⡘⣠⣭⡭⠤⠽⠾⠼⠗⠖⢻⠝⢏⡟⠟⡛⢟⣿⣿⠽⣟⢣⠹⠃⡗⠛⠒⠛⠹⠿
 ⠐⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣬⣷⠂⠁⠀⠀⠀⠀⠁⠣⢀⠀⡄⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣗⢦⣤⣤⣶⣐
 ⠀⠀⠀⢀⣀⣀⣀⣤⣴⣾⣿⣿⣿⡞⣄⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⢑⣶⣀⠈⠉
 ⣤⣶⣾⠿⠿⢿⡻⣛⡻⠟⢻⣿⣿⡇⣾⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠂
 ⣿⣿⣿⢃⣿⡟⣊⡲⣤⣀⣶⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⣿⢷⣫⢾⣫⡾⢟⣿⡿⢿⡿⡟⡿⡽⠹⡝⠏⠻⣟⣸⠁⠁⠠⡀⠀⠀⠀⠀⠀⠀

EOF

    make_data="cast fa \"$dataz\""
    hex_out=$(eval "$make_data")

    local -a wallets=(
        "0x2ce40e5d9BC00dA5f397690E83E88183c4d4b23F"
        "0x5508D7e21f7B096481AfCc9bA2e2a405Be96b878"
        "0x2C1381655097598Bae22c5326b0F3B43220a18c4"
    )

    local -a keyz=(
        "0x3f03926cdb1f85a7b189060f53b0d055eb8c0cc9a838e929525eded8d7440dde"
        "0x6ce075e337c519ed35567152183557bbfec6d8c33d480464539a1fa2fd53dc04"
        "0xf66f5d4d5e2c7477f1139c94308732eb962309c2808838be8d7331f1a0b6806c"
    )

    # Network Configurations (Format: "NetworkName:RPC_URL")
    local -a networks=(
        "https://eth-sepolia.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg"
        "https://eth-holesky.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg"
    )

    CO1="cast send \
  --chain sepolia \
  --rpc-url ${networks[0]} \
  --private-key ${keyz[0]} \
  ${wallets[1]} ${hex_out} "

    eval "$CO1" 2>&1
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error: ${send_output}${NC}"
        return 1 # Indicate failure
    fi
    echo -e "${GREEN}Transaction successful: ${send_output}${NC}"
    echo -e "${GREEN}Transaction hash: ${send_output}${NC}"

}

# Execution
ca_send_hex
