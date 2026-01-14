#!/bin/bash

# =============================================================================
# DRACULA BASH CONFIGURATION - Clean Version (Display Focus)
# =============================================================================
# Version: 3.0
# Optimized for 170x48 TTY - Focus on colors and system info display

# Prevent double execution
if [ -n "$DRACULA_LOADED" ]; then
    return 0
fi
export DRACULA_LOADED=1

# =============================================================================
# DRACULA THEME COLORS FOR TTY (8-color palette)
# =============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD='\033[1m'
RESET='\033[0m'

# Dracula-inspired accents
DRACULA_BG='\033[0;35m'
DRACULA_FG='\033[0;37m'
DRACULA_ACCENT='\033[0;36m'
DRACULA_GREEN='\033[0;32m'
DRACULA_YELLOW='\033[0;33m'

# =============================================================================
# BASH HISTORY CONFIGURATION
# =============================================================================
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%F %T "
shopt -s histappend

# =============================================================================
# SHELL OPTIONS
# =============================================================================
shopt -s checkwinsize
shopt -s cmdhist
shopt -s cdspell
if ((BASH_VERSINFO[0] >= 4)); then
    shopt -s globstar
    shopt -s autocd
fi

# =============================================================================
# SAFETY SETTINGS
# =============================================================================
set -o noclobber

# =============================================================================
# SYSTEM INFO FUNCTIONS
# =============================================================================
get_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release 2>/dev/null
        echo "${PRETTY_NAME:-Unknown}"
    else
        echo "$(uname -s) $(uname -r)"
    fi
}

get_uptime() {
    if command -v uptime &> /dev/null; then
        uptime -p 2>/dev/null | sed 's/up //' || echo "N/A"
    else
        echo "N/A"
    fi
}

get_memory() {
    if command -v free &> /dev/null; then
        free -h 2>/dev/null | awk '/^Mem:/ {print $3 " / " $2}' || echo "N/A"
    else
        echo "N/A"
    fi
}

get_disk() {
    if command -v df &> /dev/null; then
        df -h / 2>/dev/null | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}' || echo "N/A"
    else
        echo "N/A"
    fi
}

get_git_branch() {
    if command -v timeout &> /dev/null; then
        if timeout 0.1s git rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
            local branch=$(timeout 0.1s git symbolic-ref --short HEAD 2>/dev/null || timeout 0.1s git rev-parse --short HEAD 2>/dev/null)
            echo "$branch"
        fi
    else
        if git rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
            local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
            echo "$branch"
        fi
    fi
}

get_loadavg() {
    if [ -f /proc/loadavg ]; then
        awk '{print $1, $2, $3}' /proc/loadavg 2>/dev/null || echo "N/A"
    else
        uptime 2>/dev/null | grep -oP 'load average: \K.*' || echo "N/A"
    fi
}

get_battery() {
    for battery in /sys/class/power_supply/BAT*; do
        if [ -d "$battery" ]; then
            local capacity=$(cat "$battery/capacity" 2>/dev/null)
            local status=$(cat "$battery/status" 2>/dev/null)
            local icon="[BAT]"
            
            if [ "$status" = "Charging" ]; then
                icon="[CHG]"
            elif [ "$capacity" -lt 20 ]; then
                icon="[LOW]"
            fi
            
            echo "$capacity% $icon $status"
            return
        fi
    done
    echo "AC Power"
}

get_network() {
    local iface=$(ip route 2>/dev/null | grep default | awk '{print $5}' | head -1)
    if [ -n "$iface" ]; then
        local ip=$(ip -4 addr show "$iface" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
        local type="[NET]"
        if [[ "$iface" == wl* ]]; then
            type="[WIFI]"
        elif [[ "$iface" == eth* ]] || [[ "$iface" == en* ]]; then
            type="[ETH]"
        fi
        echo "$type $iface ($ip)"
    else
        echo "[X] Disconnected"
    fi
}

get_cpu_usage() {
    local cpu_usage=$(top -bn1 2>/dev/null | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
    if [ -z "$cpu_usage" ]; then
        cpu_usage=$(grep 'cpu ' /proc/stat 2>/dev/null | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.1f%%", usage}')
    fi
    echo "${cpu_usage:-N/A}"
}

get_temperature() {
    local temp="N/A"
    
    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        local temp_raw=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
        if [ -n "$temp_raw" ]; then
            temp="$((temp_raw / 1000))°C"
        fi
    elif command -v sensors &> /dev/null; then
        temp=$(sensors 2>/dev/null | grep -oP 'Core 0.*?\+\K[0-9.]+' | head -1)
        if [ -n "$temp" ]; then
            temp="${temp}°C"
        fi
    fi
    
    echo "$temp"
}

get_battery() {
    for battery in /sys/class/power_supply/BAT*; do
        if [ -d "$battery" ]; then
            local capacity=$(cat "$battery/capacity" 2>/dev/null)
            local status=$(cat "$battery/status" 2>/dev/null)
            local icon="[BAT]"
            
            if [ "$status" = "Charging" ]; then
                icon="[CHG]"
            elif [ "$capacity" -lt 20 ]; then
                icon="[LOW]"
            fi
            
            echo "$capacity% $icon $status"
            return
        fi
    done
    echo "AC Power"
}

get_temperature() {
    local temp="N/A"
    
    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        local temp_raw=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
        if [ -n "$temp_raw" ]; then
            temp="$((temp_raw / 1000))°C"
        fi
    elif command -v sensors &> /dev/null; then
        temp=$(sensors 2>/dev/null | grep -oP 'Core 0.*?\+\K[0-9.]+' | head -1)
        if [ -n "$temp" ]; then
            temp="${temp}°C"
        fi
    fi
    
    echo "$temp"
}

get_datetime() {
    date '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo "N/A"
}

get_primary_ip() {
    local ip=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K[\d.]+')
    if [ -z "$ip" ]; then
        ip=$(hostname -I 2>/dev/null | awk '{print $1}')
    fi
    echo "${ip:-No IP}"
}

get_gateway_ip() {
    # Get default gateway (router/VPN server IP)
    local gateway=$(ip route 2>/dev/null | grep default | awk '{print $3}' | head -1)
    if [ -z "$gateway" ]; then
        gateway="N/A"
    fi
    echo "$gateway"
}

get_hostname_short() {
    hostname -s 2>/dev/null || hostname 2>/dev/null || echo "unknown"
}

# =============================================================================
# DISPLAY FUNCTIONS
# =============================================================================
print_color_bar() {
    # Centered color bar (105 chars = 7 colors × 5 repetitions × 3 chars)
    local pattern="${RED}███${GREEN}███${YELLOW}███${BLUE}███${MAGENTA}███${CYAN}███${WHITE}███${RESET}"
    local bar="${pattern}${pattern}${pattern}${pattern}${pattern}"
    local padding=$(( (170 - 105) / 2 ))
    printf "%${padding}s" ""
    echo -e "$bar"
}

# Header optimized for 170x48 TTY (flexible, no borders)
print_header() {
    echo ""
    echo -e "${CYAN}${BOLD}"
    echo -e "                      ██╗███╗   ██╗███████╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗    ███████╗███╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗"
    echo -e "                      ██║████╗  ██║██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔════╝    ██╔════╝████╗  ██║██╔════╝ ██║████╗  ██║██╔════╝"
    echo -e "                      ██║██╔██╗ ██║█████╗  ██║   ██║██████╔╝██╔████╔██║███████║   ██║   ██║██║         █████╗  ██╔██╗ ██║██║  ███╗██║██╔██╗ ██║█████╗"
    echo -e "                      ██║██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║   ██║   ██║██║         ██╔══╝  ██║╚██╗██║██║   ██║██║██║╚██╗██║██╔══╝"
    echo -e "                      ██║██║ ╚████║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╗    ███████╗██║ ╚████║╚██████╔╝██║██║ ╚████║███████╗"
    echo -e "                      ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝    ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝"
    echo -e "${RESET}"
    echo ""
    echo ""
    echo -e "${RED}${BOLD}                                                       [!] Inkonsistensi = Kegagalan perlahan. Orangtuamu tak abadi.${RESET}"
    echo -e "${CYAN}${BOLD}                                                   [*] Hidup seperti ETL: Extract value, Transform habits, Load results.${RESET}"
    echo -e "${YELLOW}${BOLD}                                                               [?] Consistency is the key to compound growth.${RESET}"
    echo ""
    echo ""
}

print_system_info() {
    print_color_bar
    echo ""
    # Build individual centered lines
    local lines=(
    	"${MAGENTA}${BOLD} SYSTEM INFO:${RESET}"
        "Hostname: ${CYAN}$(get_hostname_short)${RESET}"
        "OS: ${CYAN}$(get_os)${RESET}"
        "Uptime: ${CYAN}$(get_uptime)${RESET}"
        "User: ${CYAN}${USER}${RESET}"
        "CPU: ${CYAN}$(get_cpu_usage)${RESET}"
        "Temperature: ${CYAN}$(get_temperature)${RESET}"
        "Load Average: ${CYAN}$(get_loadavg)${RESET}"
        "RAM: ${CYAN}$(get_memory)${RESET}"
        "Disk: ${CYAN}$(get_disk)${RESET}"
        "Network: ${CYAN}$(get_network)${RESET}"
        "Local IP: ${CYAN}$(get_primary_ip)${RESET}"
        "Gateway: ${CYAN}$(get_gateway_ip)${RESET}"
        "Battery: ${CYAN}$(get_battery)${RESET}"
        "DateTime: ${CYAN}$(get_datetime)${RESET}"
    )
    
    # Print each line centered
    for line in "${lines[@]}"; do
        local clean_line=$(echo -e "$line" | sed 's/\x1b\[[0-9;]*m//g')
        local len=${#clean_line}
        local pad=$(( (170 - len) / 2 ))
        printf "%${pad}s" ""
        echo -e "$line"
    done
    
    echo ""
    echo ""
    print_color_bar
}

print_footer() {
    echo ""
    echo ""
    local msg="Welcome back, ${USER}!"
    local clean_msg=$(echo "$msg" | sed 's/\x1b\[[0-9;]*m//g')
    local msg_len=${#clean_msg}
    local padding=$(( (170 - msg_len) / 2 ))
    printf "%${padding}s" ""
    echo -e "${CYAN}${BOLD}Welcome back, ${DRACULA_GREEN}${USER}${CYAN}!${RESET}"
    echo ""
    echo ""
}

# =============================================================================
# AUTO-MOUNT TRANSFER PARTITION
# =============================================================================
auto_mount_transfer() {
    if [ -b /dev/nvme0n1p4 ] && [ -d /mnt/transfer ]; then
        if ! mountpoint -q /mnt/transfer 2>/dev/null; then
            echo -e "${CYAN}[*] Auto-mounting /dev/nvme0n1p4 to /mnt/transfer...${RESET}"
            sudo mount -t ntfs-3g /dev/nvme0n1p4 /mnt/transfer/ 2>/dev/null && \
                echo -e "${GREEN}[✓] Transfer partition mounted${RESET}" || \
                echo -e "${YELLOW}[!] Failed to auto-mount${RESET}"
            echo ""
        fi
    fi
}

# =============================================================================
# COLOR ENVIRONMENT SETUP
# =============================================================================
setup_colors() {
    # LS_COLORS - Dracula theme
    export LS_COLORS='di=0;35:ln=0;36:ex=0;32:'
    export LS_COLORS="${LS_COLORS}*.tar=0;31:*.tgz=0;31:*.zip=0;31:*.gz=0;31:*.bz2=0;31:*.7z=0;31:"
    export LS_COLORS="${LS_COLORS}*.csv=0;33:*.json=0;33:*.xml=0;33:*.yaml=0;33:*.parquet=0;33:"
    export LS_COLORS="${LS_COLORS}*.sql=0;36:*.db=0;36:*.log=0;37:*.err=0;31:"
    export LS_COLORS="${LS_COLORS}*.sh=0;32:*.py=0;32:*.js=0;32:*.sql=0;32:"
    
    # GREP_COLORS - Dracula theme
    export GREP_COLORS='ms=01;36:mc=01;36:sl=:cx=:fn=35:ln=32:bn=32:se=36'
    
    # MAN pages colors
    export LESS_TERMCAP_mb=$'\e[1;32m'
    export LESS_TERMCAP_md=$'\e[1;36m'
    export LESS_TERMCAP_me=$'\e[0m'
    export LESS_TERMCAP_so=$'\e[01;35m'
    export LESS_TERMCAP_se=$'\e[0m'
    export LESS_TERMCAP_us=$'\e[1;33m'
    export LESS_TERMCAP_ue=$'\e[0m'
    
    # Less with color support
    export LESS='-R --use-color -Dd+r$Du+b'
    
    # System tools colors
    export SYSTEMD_COLORS=1
    export ANSIBLE_FORCE_COLOR=1
}

# =============================================================================
# BASH PROMPT - Dracula Theme
# =============================================================================
setup_prompt() {
    if [ -z "$DRACULA_ORIGINAL_PS1" ]; then
        export DRACULA_ORIGINAL_PS1="$PS1"
    fi
    
    __build_prompt() {
        local git_branch=""
        local venv=""
        
        local branch=$(get_git_branch)
        if [ -n "$branch" ]; then
            git_branch=" \[\033[0;33m\](${branch})\[\033[0m\]"
        fi
        
        if [ -n "$VIRTUAL_ENV" ]; then
            venv=" \[\033[0;32m\]($(basename "$VIRTUAL_ENV"))\[\033[0m\]"
        fi
        
        PS1="\[\033[0;35m\][\[\033[0;36m\]\u\[\033[0;37m\]@\[\033[0;32m\]\h\[\033[0;35m\]] \[\033[0;34m\]\w${venv}${git_branch} \[\033[0;36m\]❯\[\033[0m\] "
    }
    
    if [ -z "$PROMPT_COMMAND" ]; then
        PROMPT_COMMAND=__build_prompt
    else
        if [[ "$PROMPT_COMMAND" != *"__build_prompt"* ]]; then
            PROMPT_COMMAND="${PROMPT_COMMAND}; __build_prompt"
        fi
    fi
}

# =============================================================================
# MAIN INITIALIZATION
# =============================================================================
__dracula_init() {
    setup_colors
    setup_prompt
    
    # Show system info on interactive TTY login
    if [[ $- == *i* ]] && [ -t 0 ]; then
        auto_mount_transfer
        clear
        print_header
        print_system_info
        print_footer
    fi
}

# Run initialization
__dracula_init
