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

## Phase 3: Research Latest Best Practices

4. **Research Current Technologies**: Using `mcp__tavily-mcp__tavily-search` tool:
   - Search for latest best practices related to the feature type (e.g., "2025 best practices for [feature type]")
   - Find recent breaking changes in relevant frameworks/libraries
   - Identify modern implementation patterns and architectures
   - Look for security considerations and performance optimizations
   - Research similar features in popular applications for inspiration

## Phase 4: Documentation Retrieval

5. **Fetch Relevant Documentation**: For each identified technology/library:
   - Use `mcp__context7__resolve-library-id` to find the correct library ID
   - Use `mcp__context7__get-library-docs` to retrieve up-to-date documentation
   - Extract relevant code examples and API references
   - Gather version-specific information and compatibility notes

## Phase 5: Specification Generation

6. **Load Template**: Read `.specify/templates/spec-template.md` to understand required sections and structure.

7. **Generate Enhanced Specification**: Create a comprehensive specification that includes:
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

## Phase 6: Quality Assurance

8. **Validate Specification**:
   - Ensure all template sections are filled with meaningful content
   - Check that technical details are current (using 2025 best practices)
   - Verify that code examples are syntactically correct
   - Confirm that all referenced libraries/frameworks are compatible
   - Validate that the specification is actionable and unambiguous

9. **Refine Using Sequential Thinking**: Use `mcp__sequential-thinking__sequentialthinking` again to:
   - Review the generated specification for completeness
   - Identify any gaps or inconsistencies
   - Suggest improvements or additional considerations
   - Ensure the specification aligns with the original feature description

## Phase 7: Final Output

10. **Write Specification**: Save the enhanced specification to SPEC_FILE with:
    - Proper markdown formatting
    - Clear section headers
    - Code blocks with syntax highlighting
    - Links to relevant documentation
    - Diagrams or flowcharts if applicable (as markdown/mermaid)

11. **Generate Summary Report**: Provide the user with:
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

## Notes

- The script creates and checks out the new branch before specification writing
- All research should prioritize recent information (2024-2025)
- Specification should be developer-friendly and immediately actionable
- Consider both technical and business perspectives in the specification
- Include fallback strategies for critical components
