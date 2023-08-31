#!/bin/bash
curl -s https://raw.githubusercontent.com/NodesLLS/Node_tools/main/logo.sh | bash
curl -s https://raw.githubusercontent.com/NodesLLS/Node_tools/main/preinstall.sh | bash
curl -s https://raw.githubusercontent.com/NodesLLS/Node_tools/main/docker.sh | bash
curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh
wget https://raw.githubusercontent.com/NodesLLS/Shardeum_NodeFull/main/healthcheck.sh
###################

external_ip=$(curl -s eth0.me)
port=8080
COLOR_RESET='\033[0m'
COLOR_YELLOW='\033[1;33m'
COLOR_CYAN='\033[1;36m'


echo -e "${COLOR_CYAN}External IP address: ${COLOR_YELLOW}https://$external_ip:$port${COLOR_RESET}"
##################
SESSION_NAME="node-monitor"

SCRIPT_PATH="/root/healthcheck.sh"


tmux has-session -t $SESSION_NAME 2>/dev/null
if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION_NAME
fi


tmux send-keys -t $SESSION_NAME "bash $SCRIPT_PATH" C-m

