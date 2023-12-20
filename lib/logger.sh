# Logger.sh - Provides enhanced logging functionalities for Bash scripts
# --- Initialization Functions ---
# Initializes the logger by clearing the log file
# Usage: initiate_logger
initiate_logger() {
    > "$LOG_PATH"  # Clear the log file
    log_success "Logger initialized."
}

# --- Logging Functions ---
# Logs an event with a specified mood (log level) and narrative (message).
# Inputs:
#   $1 - The mood (log level) of the message.
#   $2 - The narrative (log message).
# Note: Supports bold styling for certain moods.
log_event() {
    local mood=$1
    local narrative=$2
    local timestamp="$(date '+%b/%d/%Y — %-l:%M %p')"

    # Check for verbose mode and append details if enabled
    if [ "$VERBOSE_MODE" = true ]; then
        narrative="$narrative (Verbose Mode ...)"  # Add your verbose details here
    fi

    local style=""
    if [[ $mood == "BOLD_"* ]]; then
        mood="${mood#BOLD_}"  # Remove 'BOLD_' prefix
        style="$(tput bold)${COLOR_PALETTE[$mood]}"
    fi

    # Logging to console and file
    echo -e "${style}${COLOR_PALETTE[$mood]}[$timestamp][$mood] - $narrative${COLOR_PALETTE[RESET]}"
    echo "[$timestamp][$mood] - $narrative" >> "$LOG_PATH"
}

# Additional logging functionalities
# Logs debug messages based on VERBOSE_MODE or LOG_LEVEL
log_debug() {
    if [ "$VERBOSE_MODE" = true ] || [[ "$LOG_LEVEL" == "DEBUG" ]]; then
        log_event "DEBUG" "$1"
    fi
}

log_warning() {
    log_event "WARNING" "$1"
}

log_error() {
    log_event "ERROR" "$1"
}

log_info() {
    log_event "INFO" "$1"
}

log_success() {
    log_event "SUCCESS" "$1"
}

# Bold Log Variants
log_bold_info() {
    log_event "BOLD_INFO" "$1"
}

log_bold_success() {
    log_event "BOLD_SUCCESS" "$1"
}

log_bold_warning() {
    log_event "BOLD_WARNING" "$1"
}

log_bold_error() {
    log_event "BOLD_ERROR" "$1"
}
