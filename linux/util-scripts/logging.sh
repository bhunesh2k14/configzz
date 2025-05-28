#!/bin/bash

# logging.sh - Custom logging for echo statements with colors and formatting

LOG_FILE="${LOG_FILE:-/tmp/custom_log.log}"

# Color codes
NC='\033[0m'        # No Color
BOLD='\033[1m'
INFO_COLOR='\033[1;34m'   # Bold Blue
WARN_COLOR='\033[1;33m'   # Bold Yellow
ERROR_COLOR='\033[1;31m'  # Bold Red

log() {
    local level="$1"
    shift
    local msg="$*"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    local color
    case "$level" in
        INFO)  color="$INFO_COLOR" ;;
        WARN)  color="$WARN_COLOR" ;;
        ERROR) color="$ERROR_COLOR" ;;
        *)     color="$NC" ;;
    esac
    # Print colored message to terminal
    echo -e "${BOLD}[$timestamp] ${color}[$level]${NC} $msg"
    # Print plain message to log file (no color codes)
    echo "[$timestamp] [$level] $msg" >> "$LOG_FILE"
}

info() {
    log "INFO" "$@"
}

warn() {
    log "WARN" "$@"
}

error() {
    log "ERROR" "$@"
}

# Example usage:
# info "This is an info message"
# warn "This is a warning"
# error "This is an error"