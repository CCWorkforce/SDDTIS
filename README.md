# SDDTIS

🌾 🥳 🌋 🏰 🌅 🌕 Spec-Driven Development Toolkit Installation Script 🌖 🌔 🌈 🏆 👑

An automated installation script for [GitHub Spec Kit](https://github.com/github/spec-kit) that handles `uv` installation and runs spec-kit commands seamlessly, plus enhanced Claude Code commands with MCP server integrations.

## Quick Start

### 1. Download the Main Installation Script

```bash
curl -o install-specify-kit.sh https://raw.githubusercontent.com/CCWorkforce/SDDTIS/main/install-specify-kit.sh
chmod +x install-specify-kit.sh
./install-specify-kit.sh -- specify init myproject
```

### 2. Download Additional Tools

#### Enhanced Claude Code Commands Downloader

Download enhanced Claude Code commands with MCP server integrations:

```bash
curl -o download-cc-command.sh https://raw.githubusercontent.com/CCWorkforce/SDDTIS/main/download-cc-command.sh
chmod +x download-cc-command.sh

# Download all enhanced commands
./download-cc-command.sh --all

# Or download specific commands
./download-cc-command.sh --command specify
./download-cc-command.sh --command plan
./download-cc-command.sh --command tasks
```

#### Cleanup Script

Download the cleanup script to remove Specify Kit files when needed:

```bash
curl -o clean-up-specify-kit.sh https://raw.githubusercontent.com/CCWorkforce/SDDTIS/main/clean-up-specify-kit.sh
chmod +x clean-up-specify-kit.sh

# Run cleanup when needed
./clean-up-specify-kit.sh
```

## Usage

### Spec Kit Installation

The main script automatically checks for and installs `uv` if needed, then executes spec-kit commands:

```bash
./install-specify-kit.sh -- <spec-kit-command> [arguments...]
```

### Enhanced Commands Usage

After downloading with `download-cc-command.sh`, use in Claude Code:

```bash
# In Claude Code, use the @ prefix
@specify "Create a user authentication system"
@plan "Focus on security and scalability"
@tasks "Optimize for team development"
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

## Enhanced Claude Code Commands

The enhanced commands provide intelligent features through MCP server integrations:

- **`specify`**: Creates feature specifications with clarifications and research
- **`plan`**: Generates implementation plans with technical decision points
- **`tasks`**: Creates detailed task lists with dependencies and estimates

### Features
- Sequential thinking for complex problem breakdown
- Web research for latest best practices (2025)
- Documentation retrieval from official sources
- Interactive clarification process
- Persistent decision tracking

Use `./download-cc-command.sh --list` to see all available commands.

For detailed information, see [ADVANCED-USAGE.md](ADVANCED-USAGE.md).

## Cleanup Script

The cleanup script removes Specify Kit generated files and directories:

### What it does:
- Deletes `.claude/commands/plan.md`, `specify.md`, and `tasks.md` files
- Removes the `.specify` directory and all its contents
- Provides colored output showing the status of each deletion

### When to use:
- Reset your project's Specify Kit configuration
- Start fresh with a new specification
- Clean up after spec-driven development is complete

## About Spec-Driven Development

Spec Kit enables **Spec-Driven Development** - a methodology where specifications become executable, directly generating working implementations. Learn more at the [GitHub Spec Kit repository](https://github.com/github/spec-kit).

Key benefits:

- Intent-driven development focusing on "what" before "how"
- Rich specification creation with guardrails
- Multi-step refinement process
- Heavy reliance on AI for specification interpretation
