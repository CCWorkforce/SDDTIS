# SDDTIS

🌾 🥳 🌋 🏰 🌅 🌕 Spec-Driven Development Toolkit Installation Script 🌖 🌔 🌈 🏆 👑

An automated installation script for [GitHub Spec Kit](https://github.com/github/spec-kit) that handles `uv` installation and runs spec-kit commands seamlessly.

## Quick Start

Download and run the installation script:

```bash
curl -o install-specify-kit.sh https://raw.githubusercontent.com/CCWorkforce/SDDTIS/main/install-specify-kit.sh
```

```bash
chmod +x install-specify-kit.sh
```

```bash
./install-specify-kit.sh -- specify init myproject
```

## Usage

The script automatically checks for and installs `uv` if needed, then executes spec-kit commands:

```bash
./install-specify-kit.sh -- <spec-kit-command> [arguments...]
```

## Examples

### Initialize a new project

```bash
./install-specify-kit.sh -- specify init myproject
```

### Initialize in current directory

```bash
./install-specify-kit.sh -- specify init --here
```

### Initialize with specific AI agent

```bash
./install-specify-kit.sh -- specify init myproject --ai claude
```

```bash
./install-specify-kit.sh -- specify init myproject --ai gemini
```

```bash
./install-specify-kit.sh -- specify init myproject --ai copilot
```

### Initialize with agent tools check disabled

```bash
./install-specify-kit.sh -- specify init myproject --ai claude --ignore-agent-tools
```

## Available Spec-Kit Commands

Based on the [GitHub Spec Kit](https://github.com/github/spec-kit), the following commands are available:

- `specify init <project_name>` - Initialize a new project with spec-kit templates
- `specify init --here` - Initialize spec-kit in the current directory
- `--ai <agent>` - Specify AI agent (claude, gemini, copilot)
- `--ignore-agent-tools` - Skip agent tool installation checks

## Prerequisites

The script will automatically install `uv` if not present. Supported platforms:

- macOS (via Homebrew or curl)
- Linux (via curl)

## What the Script Does

1. **Checks for `uv` installation** - Verifies if `uv` is available in PATH
2. **Installs `uv` if needed**:
   - On macOS: Uses Homebrew if available, otherwise curl installer
   - On Linux: Uses official curl installer
   - Updates shell configuration to ensure PATH is updated
3. **Runs spec-kit command** - Executes `uvx --from git+https://github.com/github/spec-kit.git` with your specified arguments

## Cleanup Script

To remove Specify Kit generated files and directories, use the cleanup script:

```bash
./clean-up-specify-kit.sh
```

This script will:
- Delete `.claude/commands/plan.md`, `specify.md`, and `tasks.md` files
- Remove the `.specify` directory and all its contents
- Provide colored output showing the status of each deletion

The cleanup is useful when:
- You want to reset your project's Specify Kit configuration
- You need to start fresh with a new specification
- You're done with spec-driven development and want to clean up

## About Spec-Driven Development

Spec Kit enables **Spec-Driven Development** - a methodology where specifications become executable, directly generating working implementations. Learn more at the [GitHub Spec Kit repository](https://github.com/github/spec-kit).

Key benefits:

- Intent-driven development focusing on "what" before "how"
- Rich specification creation with guardrails
- Multi-step refinement process
- Heavy reliance on AI for specification interpretation
