#!/bin/bash

# Claude Code Command Downloader
# Downloads enhanced Claude Code commands from the CCWorkforce/SDDTIS repository

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Base URLs for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/CCWorkforce/SDDTIS/main/.claude/commands"

# Command directory
COMMAND_DIR=".claude/commands"

# Available commands
declare -A COMMANDS=(
    ["specify"]="specify.md"
    ["plan"]="plan.md"
    ["tasks"]="tasks.md"
)

# Function to print colored output
print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Function to show usage
show_usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Downloads enhanced Claude Code commands from the CCWorkforce/SDDTIS repository.

OPTIONS:
    --command <name>    Download a specific command (specify, plan, or tasks)
    --all              Download all available commands
    --list             List all available commands
    --help             Show this help message

EXAMPLES:
    $0 --command specify     Download the specify.md command
    $0 --command plan        Download the plan.md command
    $0 --command tasks       Download the tasks.md command
    $0 --all                 Download all commands
    $0 --list                List available commands

The commands will be saved to: $COMMAND_DIR/

EOF
}

# Function to list available commands
list_commands() {
    print_info "Available Claude Code commands:"
    echo ""
    echo "  Command    File"
    echo "  -------    ----"
    for cmd in "${!COMMANDS[@]}"; do
        printf "  %-10s %s\n" "$cmd" "${COMMANDS[$cmd]}"
    done
    echo ""
    echo "Use: $0 --command <name> to download a specific command"
}

# Function to create command directory if it doesn't exist
ensure_directory() {
    if [ ! -d "$COMMAND_DIR" ]; then
        print_info "Creating directory: $COMMAND_DIR"
        mkdir -p "$COMMAND_DIR"
        print_success "Directory created successfully"
    fi
}

# Function to download a specific command
download_command() {
    local cmd_name=$1

    # Validate command name
    if [ -z "${COMMANDS[$cmd_name]}" ]; then
        print_error "Unknown command: $cmd_name"
        echo "Available commands: ${!COMMANDS[@]}"
        exit 1
    fi

    local file_name="${COMMANDS[$cmd_name]}"
    local url="$BASE_URL/$file_name"
    local dest_path="$COMMAND_DIR/$file_name"

    print_info "Downloading $cmd_name command..."
    print_info "Source: $url"
    print_info "Destination: $dest_path"

    # Check if file exists and warn about overwrite
    if [ -f "$dest_path" ]; then
        print_warning "File exists and will be overwritten: $dest_path"
    fi

    # Download the file
    if curl -fsSL "$url" -o "$dest_path"; then
        print_success "Successfully downloaded: $file_name"

        # Show file info
        local file_size=$(ls -lh "$dest_path" | awk '{print $5}')
        local line_count=$(wc -l < "$dest_path")
        print_info "File size: $file_size"
        print_info "Lines: $line_count"
    else
        print_error "Failed to download: $file_name"
        print_error "Please check your internet connection and try again"
        exit 1
    fi
}

# Function to download all commands
download_all() {
    print_info "Downloading all Claude Code commands..."
    echo ""

    local success_count=0
    local fail_count=0

    for cmd in "${!COMMANDS[@]}"; do
        echo "[$((success_count + fail_count + 1))/${#COMMANDS[@]}] Processing $cmd..."
        if download_command "$cmd"; then
            ((success_count++))
        else
            ((fail_count++))
        fi
        echo ""
    done

    echo "Download Summary:"
    print_success "Successfully downloaded: $success_count commands"
    if [ $fail_count -gt 0 ]; then
        print_error "Failed to download: $fail_count commands"
    fi
}

# Function to check dependencies
check_dependencies() {
    if ! command -v curl &> /dev/null; then
        print_error "curl is not installed. Please install curl to use this script."
        echo "Installation instructions:"
        echo "  macOS: brew install curl"
        echo "  Ubuntu/Debian: sudo apt-get install curl"
        echo "  RHEL/CentOS: sudo yum install curl"
        exit 1
    fi
}

# Main script logic
main() {
    # Check for curl
    check_dependencies

    # Parse command line arguments
    if [ $# -eq 0 ]; then
        show_usage
        exit 0
    fi

    while [[ $# -gt 0 ]]; do
        case $1 in
            --command)
                if [ -z "$2" ]; then
                    print_error "Command name required"
                    show_usage
                    exit 1
                fi
                ensure_directory
                download_command "$2"
                shift 2
                ;;
            --all)
                ensure_directory
                download_all
                shift
                ;;
            --list)
                list_commands
                shift
                ;;
            --help|-h)
                show_usage
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
}

# Run main function
main "$@"