#!/bin/bash

# Advanced Specify Kit Installer with Claude Code Commands
# Installs uv, runs specify-kit, and downloads enhanced Claude Code commands

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Base URLs and directories
BASE_URL="https://raw.githubusercontent.com/CCWorkforce/SDDTIS/main/.claude/commands"
COMMAND_DIR=".claude/commands"

# Available commands to download - using parallel arrays for compatibility
COMMAND_NAMES=("specify" "plan" "tasks")
COMMAND_FILES=("specify.md" "plan.md" "tasks.md")

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

# Function to check and install uv
install_uv() {
    echo "Checking for uv installation..."

    if ! command -v uv &> /dev/null; then
        echo "uv not found. Installing uv..."

        if [[ "$OSTYPE" == "darwin"* ]]; then
            if command -v brew &> /dev/null; then
                brew install uv
            else
                echo "Installing uv via curl..."
                curl -LsSf https://astral.sh/uv/install.sh | sh
                source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null || true
            fi
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            echo "Installing uv via curl..."
            curl -LsSf https://astral.sh/uv/install.sh | sh
            source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null || true
        else
            echo "Unsupported OS. Please install uv manually: https://docs.astral.sh/uv/getting-started/installation/"
            exit 1
        fi
        print_success "uv installed successfully"
    else
        print_success "uv is already installed"
    fi
}

# Function to create command directory if it doesn't exist
ensure_directory() {
    if [ ! -d "$COMMAND_DIR" ]; then
        print_info "Creating directory: $COMMAND_DIR"
        mkdir -p "$COMMAND_DIR"
        print_success "Directory created successfully"
    fi
}

# Function to get file name for a command
get_command_file() {
    local cmd_name=$1
    local i
    for i in "${!COMMAND_NAMES[@]}"; do
        if [ "${COMMAND_NAMES[$i]}" = "$cmd_name" ]; then
            echo "${COMMAND_FILES[$i]}"
            return 0
        fi
    done
    return 1
}

# Function to download a specific command
download_command() {
    local cmd_name=$1
    local file_name=$(get_command_file "$cmd_name")

    if [ -z "$file_name" ]; then
        print_error "Unknown command: $cmd_name"
        return 1
    fi

    local url="$BASE_URL/$file_name"
    local dest_path="$COMMAND_DIR/$file_name"

    print_info "Downloading $cmd_name command..."

    # Check if file exists and warn about overwrite
    if [ -f "$dest_path" ]; then
        print_warning "File exists and will be overwritten: $dest_path"
    fi

    # Download the file
    if curl -fsSL "$url" -o "$dest_path" 2>/dev/null; then
        print_success "Successfully downloaded: $file_name"

        # Show file info
        local file_size=$(ls -lh "$dest_path" | awk '{print $5}')
        local line_count=$(wc -l < "$dest_path")
        print_info "  Size: $file_size, Lines: $line_count"
    else
        print_error "Failed to download: $file_name"
        return 1
    fi
}

# Function to download all Claude Code commands
download_claude_commands() {
    print_info "Downloading Claude Code commands..."
    echo ""

    ensure_directory

    local success_count=0
    local fail_count=0

    for cmd in "${COMMAND_NAMES[@]}"; do
        if download_command "$cmd"; then
            ((success_count++))
        else
            ((fail_count++))
        fi
    done

    echo ""
    if [ $success_count -gt 0 ]; then
        print_success "Downloaded $success_count Claude Code commands"
    fi
    if [ $fail_count -gt 0 ]; then
        print_warning "Failed to download $fail_count commands"
    fi
}

# Function to run specify-kit
run_specify_kit() {
    echo ""
    print_info "Running specify-kit with arguments: $*"
    uvx --from git+https://github.com/github/spec-kit.git "$@"
    return $?
}

# Function to show usage
show_usage() {
    cat << EOF
Usage: $0 [OPTIONS] [-- <specify-kit-command> [args...]]

Advanced Specify Kit installer that also downloads Claude Code commands.

OPTIONS:
    --skip-commands     Skip downloading Claude Code commands
    --commands-only     Only download Claude Code commands (skip specify-kit)
    --help             Show this help message

EXAMPLES:
    $0                          Install everything and show usage
    $0 -- specify init myproject   Install everything and run specify init
    $0 -- specify init --here --ai claude --script sh --no-git   Full example
    $0 --skip-commands -- specify init myproject   Skip command download
    $0 --commands-only          Only download Claude Code commands

The script will:
1. Install uv if not present
2. Download enhanced Claude Code commands to $COMMAND_DIR/
3. Run specify-kit if arguments are provided after --

Downloaded commands:
  - specify.md: Create feature specifications with intelligent analysis
  - plan.md: Generate implementation plans with research and design artifacts
  - tasks.md: Create actionable, dependency-ordered development tasks

EOF
}

# Main script logic
main() {
    local skip_commands=false
    local commands_only=false
    local specify_args=()
    local found_separator=false

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --skip-commands)
                skip_commands=true
                shift
                ;;
            --commands-only)
                commands_only=true
                shift
                ;;
            --help|-h)
                show_usage
                exit 0
                ;;
            --)
                found_separator=true
                shift
                specify_args=("$@")
                break
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use -- before specify-kit arguments"
                show_usage
                exit 1
                ;;
        esac
    done

    # Check for curl dependency
    if ! command -v curl &> /dev/null; then
        print_error "curl is not installed. Please install curl to use this script."
        exit 1
    fi

    echo "==================================="
    echo "Advanced Specify Kit Installer"
    echo "==================================="
    echo ""

    # Step 1: Install uv (unless commands-only mode)
    if [ "$commands_only" = false ]; then
        install_uv
        echo ""
    fi

    # Step 2: Download Claude Code commands (unless skipped)
    if [ "$skip_commands" = false ]; then
        download_claude_commands
    fi

    # Step 3: Run specify-kit if arguments provided (unless commands-only mode)
    if [ "$commands_only" = false ]; then
        if [ "$found_separator" = true ] && [ ${#specify_args[@]} -gt 0 ]; then
            run_specify_kit "${specify_args[@]}"
        else
            echo ""
            print_info "No specify-kit command provided"
            echo "To run specify-kit, use: $0 -- <command> [args...]"
            echo "Example: $0 -- specify init myproject"
        fi
    fi

    echo ""
    print_success "Installation complete!"

    if [ "$skip_commands" = false ]; then
        echo ""
        print_info "Claude Code commands installed in: $COMMAND_DIR/"
        echo "You can now use these enhanced commands in Claude Code."
    fi
}

# Run main function
main "$@"