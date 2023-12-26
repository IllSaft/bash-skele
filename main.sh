#!/bin/bash

# Base Directory of the Script
BASE_DIR="$(dirname "$0")"
export BASE_DIR

# Source Configuration and Libraries
source "$BASE_DIR/config/settings.cfg"
source "$BASE_DIR/config/palette.sh"
source "$BASE_DIR/lib/logger.sh"
source "$BASE_DIR/lib/debugger.sh"
source "$BASE_DIR/lib/environment.sh"
source "$BASE_DIR/lib/error_handling.sh"
source "$BASE_DIR/lib/helpers.sh"

# Initialize Logger
if [[ -z $LOGGER_INITIALIZED ]]; then
    initiate_logger
    export LOGGER_INITIALIZED=true
fi

# Set Terminal Title
set_terminal_title "$APPLICATION_TITLE"

# Main Function
main() {
    # Log Headers and Environment Verification
    log_bold_nodate_info_header "[ UNIX Bash Skeleton ]"
    verify_environment
    toggle_debug_mode "Debugger Enabled."

    # Example Logger Calls
    log_info "This is an informational message."
    log_warning "This is a warning message."
    log_error "This is an error message."
    log_success "This is a success message."

    # Bold Logger Calls
    log_bold_info "This is a bolded informational message."
    log_bold_warning "This is a bolded warning message."
    log_bold_error "This is a bolded error message."
    log_bold_success "This is a bolded success message."

    # No-Date Bold Logger Calls
    log_bold_nodate_info "This is a bolded informational message."
    log_bold_nodate_warning "This is a bolded warning message."
    log_bold_nodate_error "This is a bolded error message."
    log_bold_nodate_success "This is a bolded success message."

    # Custom Prefix Logger Calls
    log_custom_prefix_1 "This is a custom log prefix."
    log_custom_prefix_2 "This is a custom log prefix."
    log_custom_prefix_3 "This is a custom log prefix."

    # Finalize Execution
    log_nodate_success "Main script execution completed"
}

# Error Handling
trap 'graceful_exit' ERR

# Execute Main Function
main
