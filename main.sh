#!/bin/bash

# Main Script for Advanced Bash Skeleton

# Base Directory of the Script
BASE_DIR="$(dirname "$0")"

# Source Configuration and Libraries
source "$BASE_DIR/config/settings.cfg"
source "$BASE_DIR/config/palette.sh"
source "$BASE_DIR/lib/debugger.sh"
source "$BASE_DIR/lib/logger.sh"
source "$BASE_DIR/lib/environment.sh"
source "$BASE_DIR/lib/error_handling.sh"
source "$BASE_DIR/lib/helpers.sh"

# Set Terminal Title
set_terminal_title() {
    local title=$1
    echo -ne "\033]0;${title}\007"
}
set_terminal_title "$APPLICATION_TITLE"

# Main Functionality
main() {
    initiate_logger
    log_event "BOLD_INFO" "Starting the script"
    log_debug "Starting main function execution."

    # Example log calls
    log_info "This is an informational message."
    log_warning "This is a warning message."
    log_error "This is an error message."
    log_success "This is a success message."

    # Example log calls
    log_event "BOLD_INFO" "This is a bold informational message."
    log_bold_info "This is a bolded informational message."
    log_bold_warning "This is a bolded warning message."
    log_bold_error "This is a bolded error message."
    log_bold_success "This is a bolded success message."
    list_files
    confirm_action
    show_current_path
    get_current_user
    show_system_info
    create_zip lib
    extract_zip extractor/zips/lib.zip
    calculate_directory_size
    # Ensure environment is correctly set up
    verify_environment

    # Core Script Logic
    # Place your main script logic here
    # Example: log_event "INFO" "Performing task XYZ..."
    log_info "Script execution completed"
}

# Error Handling
trap 'graceful_exit' ERR

# Execute Main Function
main