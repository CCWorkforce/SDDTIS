---
description: Create or update the feature specification from a natural language feature description with intelligent analysis and research.
---

Given the feature description provided as an argument, execute this enhanced workflow:

## Phase 1: Initial Setup and Validation

1. **Validate Input**: Ensure the feature description is provided and is at least 10 characters long. If not, prompt for a more detailed description.

2. **Create Feature Branch**: Run the script `.specify/scripts/bash/create-new-feature.sh --json "$ARGUMENTS"` from repo root and parse its JSON output for BRANCH_NAME and SPEC_FILE. All file paths must be absolute. Handle any script errors gracefully.

## Phase 2: Intelligent Analysis Using Sequential Thinking

3. **Break Down Feature Complexity**: Use the `mcp__sequential-thinking__sequentialthinking` tool to:
   - Analyze the feature description and identify key components
   - Break down the feature into logical implementation steps
   - Identify potential technical challenges and dependencies
   - Generate a comprehensive understanding of the feature scope
   - Determine what technologies, frameworks, or libraries might be needed
   - **CRITICAL**: Identify any ambiguous requirements or missing information
   - Flag areas that need business or technical clarification
   - Note conflicting requirements or unclear acceptance criteria

## Phase 3: Clarification and Requirements Validation

4. **Identify Clarification Needs**: Create a structured list of all unclear points:
   - **Business Requirements**: Ambiguous user stories or acceptance criteria
   - **Technical Decisions**: Architecture choices that need stakeholder input
   - **Integration Points**: Unclear external system dependencies
   - **Performance Requirements**: Missing benchmarks or SLAs
   - **Security Requirements**: Undefined compliance or security needs
   - **Data Requirements**: Unclear data formats, retention, or privacy needs
   - **User Experience**: Ambiguous UI/UX requirements
   - **Deployment**: Unclear deployment environments or constraints

5. **Interactive Clarification Process**:
   - **Create Clarification Document** (`SPEC_FILE.clarifications.md` and `.specify/memory/clarifications-log.json`):
     ```markdown
     # NEEDS CLARIFICATION for [Feature Name]

     ## Critical Clarifications Required

     ### CL001: [Topic] - [Brief Description]
     **Context**: [Why this needs clarification]
     **Question**: [Specific question for the user]
     **Options** (if applicable):
       - Option A: [Description with pros/cons]
       - Option B: [Description with pros/cons]
     **Impact**: [How this affects implementation]
     **Default Assumption**: [What we'll assume if not clarified]

     ### CL002: [Next clarification...]
     ```

   - **Present Each Clarification**: One by one, ask the user:
     - Display the context and question clearly
     - Provide options when there are clear alternatives
     - Explain the impact of the decision
     - Note what will be assumed if not clarified
     - Wait for user response before proceeding to next

   - **Track Responses**: Update the clarification document with:
     - User's answer
     - Timestamp of clarification
     - Any follow-up clarifications needed
     - Impact on other requirements

   - **Persist Clarifications**: Save to multiple locations for cross-command access:
     - Update `SPEC_FILE.clarifications.md` with formatted responses
     - Append to `.specify/memory/clarifications-log.json`:
       ```json
       {
         "feature": "[Feature Name]",
         "branch": "[Branch Name]",
         "clarifications": [
           {
             "id": "CL001",
             "category": "Business Requirements",
             "question": "...",
             "answer": "...",
             "timestamp": "2025-01-13T10:30:00Z",
             "answered_by": "user",
             "impact": "..."
           }
         ]
       }
       ```
     - This JSON log ensures clarifications are available to subsequent commands

6. **Validation Loop**:
   - After collecting all clarifications, use `mcp__sequential-thinking__sequentialthinking` to:
     - Re-analyze requirements with clarifications
     - Check for new conflicts or ambiguities
     - Identify any follow-up questions
   - If new clarifications needed, repeat the process
   - Continue until all requirements are unambiguous

## Phase 4: Research Latest Best Practices

7. **Research Current Technologies**: Using `mcp__tavily-mcp__tavily-search` tool:
   - Search for latest best practices related to the feature type (e.g., "latest best practices for [feature type]")
   - Find recent breaking changes in relevant frameworks/libraries
   - Identify modern implementation patterns and architectures
   - Look for security considerations and performance optimizations
   - Research similar features in popular applications for inspiration

## Phase 5: Documentation Retrieval

8. **Fetch Relevant Documentation**: For each identified technology/library:
   - Use `mcp__context7__resolve-library-id` to find the correct library ID
   - Use `mcp__context7__get-library-docs` to retrieve up-to-date documentation
   - Extract relevant code examples and API references
   - Gather version-specific information and compatibility notes

## Phase 6: Specification Generation

9. **Load Template**: Read `.specify/templates/spec-template.md` to understand required sections and structure.

10. **Generate Enhanced Specification**: Create a comprehensive specification that includes:
   - **Executive Summary**: Clear, concise description of the feature
   - **Technical Architecture**: Based on researched best practices
   - **Implementation Plan**: Detailed steps from sequential thinking analysis
   - **Technology Stack**: Specific versions and libraries with justification
   - **Code Examples**: Relevant snippets from context7 documentation
   - **Testing Strategy**: Modern testing approaches from research
   - **Security Considerations**: Based on latest security best practices
   - **Performance Metrics**: Expected benchmarks and optimization strategies
   - **Deployment Strategy**: CI/CD considerations and rollout plan
   - **Risk Analysis**: Potential issues identified during analysis
   - **Timeline Estimation**: Based on complexity breakdown
   - **Dependencies**: External libraries, APIs, or services required
   - **Acceptance Criteria**: Clear, measurable success metrics

## Phase 7: Quality Assurance

11. **Validate Specification**:
   - Ensure all template sections are filled with meaningful content
   - Check that technical details are current (using latest best practices gathered from MCP servers)
   - Verify that code examples are syntactically correct and current
   - Confirm that all referenced libraries/frameworks are compatible
   - Validate that the specification is actionable and unambiguous
   - **IMPORTANT**: Verify all clarifications have been incorporated

12. **Refine Using Sequential Thinking**: Use `mcp__sequential-thinking__sequentialthinking` again to:
   - Review the generated specification for completeness
   - Identify any gaps or inconsistencies
   - Suggest improvements or additional considerations
   - Ensure the specification aligns with the original feature description
   - Confirm all clarified requirements are properly documented

## Phase 8: Final Output

13. **Write Specification**: Save the enhanced specification to SPEC_FILE with:
    - Proper markdown formatting
    - Clear section headers
    - Code blocks with syntax highlighting
    - Links to relevant documentation
    - Diagrams or flowcharts if applicable (as markdown/mermaid)
    - **Include Clarifications Section**: Document all clarifications received

14. **Generate Summary Report**: Provide the user with:
    - Branch name and spec file path
    - Key technologies and libraries identified
    - Estimated complexity and timeline
    - Critical decisions that need stakeholder input
    - Next recommended actions
    - Any warnings or concerns identified during research

## Error Handling

- If any MCP server is unavailable, proceed with available tools and note limitations
- If the branch creation script fails, provide clear error messages and recovery steps
- If research yields conflicting information, present options with pros/cons
- If documentation is unavailable for a library, suggest alternatives
- **CRITICAL**: If clarifications are needed but user doesn't respond:
  * Document the assumption being made
  * Mark it as "ASSUMED" in the specification
  * Create a risk item for review
  * Continue with the most conservative/safe option
- If clarifications reveal fundamental issues, suggest re-scoping the feature

## Notes

- The script creates and checks out the new branch before specification writing
- All research should prioritize the most recent information available through MCP servers
- Specification should be developer-friendly and immediately actionable
- Consider both technical and business perspectives in the specification
- Include fallback strategies for critical components
