# Advanced Usage Guide

## Enhanced Claude Code Commands

This guide explains how to download and use the enhanced Claude Code commands that integrate with MCP (Model Context Protocol) servers for intelligent feature specification, planning, and task generation.

## Quick Start

### Download the Command Downloader

```bash
# Make the script executable (if not already)
chmod +x download-cc-command.sh

# Download a specific command
./download-cc-command.sh --command specify
```

## Available Commands

The following enhanced Claude Code commands are available:

| Command | Description | File |
|---------|-------------|------|
| `specify` | Creates intelligent feature specifications with research and clarifications | `specify.md` |
| `plan` | Generates comprehensive implementation plans with technical decisions | `plan.md` |
| `tasks` | Creates detailed, actionable task lists with dependencies and estimates | `tasks.md` |

## Using the Download Script

### Basic Usage

```bash
# Show help and usage information
./download-cc-command.sh --help

# List all available commands
./download-cc-command.sh --list

# Download a specific command
./download-cc-command.sh --command specify
./download-cc-command.sh --command plan
./download-cc-command.sh --command tasks

# Download all commands at once
./download-cc-command.sh --all
```

### What Happens During Download

1. **Directory Creation**: The script creates `.claude/commands/` if it doesn't exist
2. **File Download**: Uses `curl` to fetch the latest version from GitHub
3. **Overwrite Protection**: Warns if files will be overwritten
4. **Verification**: Shows file size and line count after download

### Download Examples

```bash
# Download the specify command
$ ./download-cc-command.sh --command specify
ℹ Creating directory: .claude/commands
✓ Directory created successfully
ℹ Downloading specify command...
ℹ Source: https://raw.githubusercontent.com/CCWorkforce/SDDTIS/main/.claude/commands/specify.md
ℹ Destination: .claude/commands/specify.md
✓ Successfully downloaded: specify.md
ℹ File size: 8.2K
ℹ Lines: 190

# Download all commands
$ ./download-cc-command.sh --all
ℹ Downloading all Claude Code commands...

[1/3] Processing specify...
✓ Successfully downloaded: specify.md

[2/3] Processing plan...
✓ Successfully downloaded: plan.md

[3/3] Processing tasks...
✓ Successfully downloaded: tasks.md

Download Summary:
✓ Successfully downloaded: 3 commands
```

## Enhanced Command Features

### 1. Specify Command (`@specify`)

The enhanced `specify` command creates intelligent feature specifications with:

#### Key Enhancements
- **Sequential Thinking Integration**: Breaks down complex features using MCP sequential-thinking server
- **Clarification Phase**: Identifies ambiguities and asks for clarification one by one
- **Latest Research**: Uses Tavily to find 2025 best practices and breaking changes
- **Documentation Retrieval**: Uses Context7 to fetch up-to-date library documentation
- **Persistent Clarifications**: Saves decisions to `.specify/memory/clarifications-log.json`

#### Clarification Process
```markdown
# Example Clarification Output
### CL001: Business Requirements - User Authentication Method
**Context**: The feature description mentions "user login" but doesn't specify the authentication method.
**Question**: Which authentication method should be implemented?
**Options**:
  - Option A: Email/Password with JWT tokens
    - Pros: Simple, well-understood, easy to implement
    - Cons: Requires password management, reset flows
  - Option B: OAuth2 with social providers
    - Pros: No password management, better UX
    - Cons: External dependencies, more complex
**Impact**: Affects user model, API security, and frontend flows
**Default Assumption**: Email/Password with JWT if not specified
```

### 2. Plan Command (`@plan`)

The enhanced `plan` command generates comprehensive implementation plans with:

#### Key Enhancements
- **Technical Decision Points**: Identifies architectural decisions needing stakeholder input
- **Decision Documentation**: Creates structured decision records with pros/cons
- **Load Previous Clarifications**: Reads decisions from specify phase
- **Architecture Research**: Finds modern patterns and case studies
- **Multiple Artifacts**: Generates 10+ planning documents including performance and security plans

#### Technical Decision Example
```markdown
# Example Technical Decision
### TD001: Architecture - Microservices vs Monolithic
**Context**: The feature could be implemented as part of the monolith or as a separate service
**Decision Required**: Choose architectural approach
**Options**:
  - Option A: Add to existing monolith
    - Pros: Simpler deployment, shared code, faster development
    - Cons: Increases monolith complexity, harder to scale independently
    - Cost Impact: Lower initial cost, higher long-term maintenance
  - Option B: Create microservice
    - Pros: Independent scaling, technology flexibility, isolation
    - Cons: Network complexity, data consistency challenges
    - Cost Impact: Higher initial cost, better long-term scalability
**Recommendation**: Option A for MVP, with clear boundaries for future extraction
**Reversibility**: Medium - requires 2-3 sprints to extract later
```

### 3. Tasks Command (`@tasks`)

The enhanced `tasks` command creates actionable task lists with:

#### Key Enhancements
- **Intelligent Task Analysis**: Uses sequential thinking to identify dependencies
- **Effort Estimation**: T-shirt sizes (XS/S/M/L/XL) with hour estimates
- **Risk Assessment**: Identifies high-risk tasks needing extra attention
- **Parallel Execution**: Marks tasks that can run concurrently with [P] tags
- **Code Examples**: Includes relevant snippets from Context7 documentation

#### Task Structure Example
```markdown
### T001: Initialize Project Structure
**Category**: Foundation
**Effort**: S (2-4 hours)
**Risk Level**: Low
**Dependencies**: None
**Parallel Group**: [P-1]
**Files to Modify**:
  - /package.json
  - /tsconfig.json
  - /.eslintrc.js
**Implementation Notes**: Use TypeScript strict mode based on 2025 best practices
**Code Snippet**:
\```json
{
  "compilerOptions": {
    "strict": true,
    "target": "ES2022",
    "module": "commonjs"
  }
}
\```
**Testing Requirements**: Verify build succeeds with no errors
**Review Checklist**:
  - [ ] All dependencies pinned to specific versions
  - [ ] Security audit passes
  - [ ] README updated
```

## MCP Server Dependencies

The enhanced commands leverage these MCP servers:

### Required MCP Servers

1. **sequential-thinking**: For breaking down complex problems
   - Used in all three commands for analysis and validation

2. **tavily-mcp**: For web research and latest information
   - Searches for best practices, breaking changes, case studies

3. **context7**: For documentation retrieval
   - Fetches library docs, code examples, API references

### MCP Server Benefits

- **Current Information**: Always uses 2025 best practices
- **Intelligent Analysis**: Breaks down complexity systematically
- **Research-Backed**: Decisions based on real-world examples
- **Documentation-Driven**: Includes actual code from official docs

## Workflow Integration

### Recommended Workflow

1. **Specification Phase**
   ```bash
   # Create feature specification with clarifications
   @specify "Add user authentication with role-based access control"
   # Answer clarification questions interactively
   ```

2. **Planning Phase**
   ```bash
   # Generate implementation plan with technical decisions
   @plan "Focus on security and scalability"
   # Make technical decisions when prompted
   ```

3. **Task Generation**
   ```bash
   # Create actionable tasks with dependencies
   @tasks "Optimize for parallel development"
   # Review generated tasks and estimates
   ```

### Cross-Command Data Flow

```
specify.md → clarifications-log.json → plan.md
                                     ↓
                          technical-decisions-log.json
                                     ↓
                                  tasks.md
```

## Troubleshooting

### Common Issues

1. **curl not installed**
   ```bash
   # macOS
   brew install curl

   # Ubuntu/Debian
   sudo apt-get install curl

   # RHEL/CentOS
   sudo yum install curl
   ```

2. **Permission denied**
   ```bash
   chmod +x download-cc-command.sh
   ```

3. **Network errors**
   - Check internet connection
   - Verify GitHub is accessible
   - Try again with `--all` to retry all downloads

4. **MCP servers not available**
   - Commands will still work with reduced functionality
   - Manual research may be needed
   - Clarifications become more important

## Advanced Features

### Clarification Persistence

All clarifications and decisions are saved to JSON files for audit and reuse:

```json
// .specify/memory/clarifications-log.json
{
  "feature": "User Authentication",
  "branch": "feature/user-auth",
  "clarifications": [
    {
      "id": "CL001",
      "category": "Business Requirements",
      "question": "Which authentication method?",
      "answer": "JWT with refresh tokens",
      "timestamp": "2025-01-13T10:30:00Z",
      "answered_by": "user",
      "impact": "Affects API security layer"
    }
  ]
}
```

### Parallel Task Execution

Tasks marked with [P] can run concurrently:

```bash
# Execute parallel task groups
Task agent --parallel \
  "Create User model" \
  "Create Product model" \
  "Create Order model"
```

### Decision Reversibility Tracking

Technical decisions include reversibility ratings:
- **Easy**: Can be changed in < 1 day
- **Medium**: Requires 1-5 days to change
- **Hard**: Requires > 5 days or major refactoring

## Best Practices

### When to Use Enhanced Commands

1. **Use `specify` when**:
   - Starting a new feature from scratch
   - Requirements are vague or ambiguous
   - Need to research latest technologies
   - Want comprehensive documentation

2. **Use `plan` when**:
   - Need detailed implementation strategy
   - Technical decisions have trade-offs
   - Multiple architectural options exist
   - Team needs alignment on approach

3. **Use `tasks` when**:
   - Ready to start implementation
   - Need work breakdown structure
   - Want to optimize for parallel development
   - Require effort estimates

### Tips for Effective Usage

1. **Answer all clarifications**: Don't skip - they prevent rework
2. **Document decisions**: Include rationale for future reference
3. **Review generated artifacts**: Validate before starting work
4. **Use parallel execution**: Maximize development velocity
5. **Track progress**: Update task status as you work

## Updates and Contributions

The enhanced commands are maintained at:
https://github.com/CCWorkforce/SDDTIS

To get the latest versions:
```bash
./download-cc-command.sh --all
```

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Review the command source code in `.claude/commands/`
3. Report issues at: https://github.com/CCWorkforce/SDDTIS/issues

## Summary

The enhanced Claude Code commands provide:
- **Intelligent analysis** through MCP servers
- **Interactive clarification** to resolve ambiguities
- **Research-backed decisions** using latest information
- **Comprehensive artifacts** for implementation
- **Cross-command integration** with persistent data

Use the download script to get started and follow the recommended workflow for best results.