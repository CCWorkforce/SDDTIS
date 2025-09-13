---
description: Execute an intelligent implementation planning workflow with advanced analysis, research, and design artifact generation.
---

Given the implementation details provided as an argument, execute this enhanced workflow:

## Phase 1: Initial Setup and Context Analysis

1. **Validate Input**: Ensure implementation details are provided with sufficient context. If not, prompt for more specific requirements.

2. **Initialize Planning Environment**: Run `.specify/scripts/bash/setup-plan.sh --json` from the repo root and parse JSON for FEATURE_SPEC, IMPL_PLAN, SPECS_DIR, BRANCH. All future file paths must be absolute. Handle any script errors gracefully.

3. **Deep Feature Analysis**: Read and analyze the feature specification to understand:
   - Core feature requirements and user stories
   - Functional and non-functional requirements
   - Success criteria and acceptance criteria
   - Technical constraints, dependencies, and integration points
   - Performance requirements and scalability needs
   - Security and compliance requirements
   - **Load Previous Clarifications**: Read `.specify/memory/clarifications-log.json` to understand:
     * Business decisions already made
     * Technical constraints clarified
     * Requirements that were disambiguated
     * Assumptions that were validated

4. **Constitutional Alignment**: Read `.specify/memory/constitution.md` to understand:
   - Architectural principles and patterns to follow
   - Technology standards and preferences
   - Code quality and documentation standards
   - Team conventions and best practices

## Phase 2: Intelligent Implementation Analysis

5. **Sequential Thinking Analysis**: Use `mcp__sequential-thinking__sequentialthinking` to:
   - Break down the feature into logical implementation phases
   - Identify critical path and dependencies between components
   - Analyze technical complexity and risk factors
   - Determine optimal implementation sequence
   - Identify potential bottlenecks and optimization opportunities
   - Generate alternative implementation strategies
   - Estimate effort and timeline for each component
   - **CRITICAL**: Identify technical decisions that need stakeholder input
   - Flag implementation choices with significant trade-offs
   - Note any conflicting requirements from the specification

## Phase 3: Technical Clarification and Decision Points

6. **Identify Technical Clarifications**: Create a comprehensive list of decisions needed:
   - **Architecture Decisions**: Monolithic vs microservices, sync vs async
   - **Technology Choices**: Framework selection, database type, caching strategy
   - **Integration Decisions**: API protocols, message formats, auth methods
   - **Performance Trade-offs**: Speed vs resource usage, caching vs consistency
   - **Security Decisions**: Authentication methods, encryption levels, compliance
   - **Scaling Strategy**: Vertical vs horizontal, auto-scaling triggers
   - **Deployment Options**: Cloud provider, container orchestration, CI/CD tools
   - **Data Strategy**: Storage solutions, backup frequency, retention policies

7. **Interactive Technical Clarification**:
   - **Create Technical Decision Document** (`$IMPL_PLAN.decisions.md`):
     ```markdown
     # TECHNICAL DECISIONS REQUIRED for [Feature Name]

     ## Critical Technical Decisions

     ### TD001: [Category] - [Decision Title]
     **Context**: [Technical background and constraints]
     **Decision Required**: [Specific technical choice needed]
     **Options**:
       - Option A: [Technical approach]
         - Pros: [Benefits]
         - Cons: [Drawbacks]
         - Cost Impact: [Resource/time/money implications]
       - Option B: [Alternative approach]
         - Pros: [Benefits]
         - Cons: [Drawbacks]
         - Cost Impact: [Resource/time/money implications]
     **Recommendation**: [Your recommended option with reasoning]
     **Impact on Implementation**: [How this affects other components]
     **Reversibility**: [How hard to change later: Easy/Medium/Hard]

     ### TD002: [Next decision...]
     ```

   - **Present Decisions Sequentially**:
     - Start with highest-impact decisions
     - Show clear pros/cons for each option
     - Provide expert recommendation with reasoning
     - Explain reversibility and future migration paths
     - Wait for stakeholder decision before proceeding
     - Document rationale for future reference

   - **Track Decisions**: Update decision document with:
     - Final decision made
     - Rationale provided by stakeholder
     - Timestamp and decision maker
     - Dependencies on this decision
     - Future review triggers

   - **Persist Technical Decisions**: Save for future reference and audit:
     - Update `$IMPL_PLAN.decisions.md` with formatted decisions
     - Append to `.specify/memory/technical-decisions-log.json`:
       ```json
       {
         "feature": "[Feature Name]",
         "branch": "[Branch Name]",
         "decisions": [
           {
             "id": "TD001",
             "category": "Architecture",
             "decision": "...",
             "rationale": "...",
             "timestamp": "2025-01-13T11:00:00Z",
             "decided_by": "stakeholder_name",
             "reversibility": "Medium",
             "review_trigger": "After MVP launch"
           }
         ]
       }
       ```
     - This ensures decisions are documented and can be referenced by tasks.md command

8. **Implementation Path Validation**:
   - After all decisions collected, use `mcp__sequential-thinking__sequentialthinking` to:
     - Re-evaluate implementation strategy with decisions
     - Check for conflicting technical choices
     - Identify new risks introduced by decisions
     - Adjust timelines based on chosen approaches
   - If new clarifications emerge, iterate the process
   - Continue until implementation path is clear

## Phase 4: Architecture Research and Best Practices

9. **Research Modern Architecture Patterns**: Using `mcp__tavily-mcp__tavily-search`:
   - Search for "2025 [feature type] architecture patterns best practices"
   - Research microservices vs monolithic considerations for the feature
   - Find event-driven architecture patterns if applicable
   - Investigate caching strategies and data consistency patterns
   - Research API design patterns (REST, GraphQL, gRPC) relevant to the feature
   - Look for serverless architecture opportunities
   - Find case studies of similar implementations in production

10. **Technology Stack Research**: Using `mcp__tavily-mcp__tavily-search`:
    - Research latest stable versions of identified frameworks/libraries
    - Find recent breaking changes and migration guides
    - Investigate performance benchmarks and comparisons
    - Search for security vulnerabilities and patches
    - Research container orchestration best practices if applicable
    - Find CI/CD pipeline patterns for the technology stack

## Phase 5: Documentation and Code Examples

11. **Retrieve Framework Documentation**: For each identified technology:
    - Use `mcp__context7__resolve-library-id` to find correct library IDs
    - Use `mcp__context7__get-library-docs` to retrieve:
      * API documentation and usage patterns
      * Code examples and best practices
      * Configuration options and optimization tips
      * Testing utilities and mocking strategies
      * Performance tuning guidelines
      * Migration and upgrade paths

12. **Gather Integration Examples**: Using `mcp__context7__get-library-docs`:
   - Find examples of library integrations
   - Retrieve middleware and plugin documentation
   - Get authentication/authorization patterns
   - Find error handling and logging best practices
   - Retrieve monitoring and observability setup guides

## Phase 6: Enhanced Artifact Generation

13. **Generate Research Artifact** (`$SPECS_DIR/research.md`):
    - Summary of sequential thinking analysis
    - Architecture patterns and recommendations
    - Technology stack evaluation with pros/cons
    - Performance considerations and benchmarks
    - Security analysis and recommendations
    - Integration strategy with existing systems
    - Risk assessment and mitigation strategies
    - Alternative approaches considered

14. **Generate Data Model Artifact** (`$SPECS_DIR/data-model.md`):
    - Entity relationship diagrams (as Mermaid diagrams)
    - Database schema with indexes and constraints
    - Data migration strategies
    - Data validation rules and business logic
    - Caching strategy for each entity
    - API response schemas
    - Event schemas for event-driven components
    - Data privacy and retention policies

15. **Generate Contracts Artifact** (`$SPECS_DIR/contracts/`):
    - OpenAPI/Swagger specifications for REST APIs
    - GraphQL schema definitions if applicable
    - Protocol buffer definitions for gRPC services
    - Message queue contract definitions
    - WebSocket event contracts
    - Service-to-service communication contracts
    - External API integration contracts
    - Error response formats and codes

16. **Generate Implementation Tasks** (`$SPECS_DIR/tasks.md`):
    - Detailed task breakdown with dependencies
    - Story points or effort estimates
    - Technical specifications for each task
    - Testing requirements and acceptance criteria
    - Code review checklist items
    - Documentation requirements
    - Deployment and rollback procedures
    - Monitoring and alerting setup tasks

17. **Generate Quick Start Guide** (`$SPECS_DIR/quickstart.md`):
    - Development environment setup instructions
    - Required tools and versions
    - Configuration file examples
    - Sample code snippets from context7
    - Common development workflows
    - Testing instructions and examples
    - Debugging tips and tools
    - Troubleshooting guide

## Phase 7: Advanced Planning Artifacts

18. **Generate Performance Plan** (`$SPECS_DIR/performance-plan.md`):
    - Load testing strategies and tools
    - Performance benchmarks and targets
    - Optimization opportunities identified
    - Caching and CDN strategies
    - Database query optimization plans
    - Resource scaling strategies

19. **Generate Security Plan** (`$SPECS_DIR/security-plan.md`):
    - Threat model and attack vectors
    - Authentication and authorization strategy
    - Data encryption requirements
    - Security testing checklist
    - Compliance requirements (GDPR, HIPAA, etc.)
    - Security monitoring and incident response

20. **Generate Testing Strategy** (`$SPECS_DIR/testing-strategy.md`):
    - Unit testing approach and coverage targets
    - Integration testing scenarios
    - End-to-end testing workflows
    - Performance testing benchmarks
    - Security testing requirements
    - Test data management strategy
    - CI/CD pipeline testing stages

## Phase 8: Quality Assurance and Validation

21. **Validate Generated Artifacts**: Use `mcp__sequential-thinking__sequentialthinking` to:
    - Review all artifacts for completeness and consistency
    - Ensure technical accuracy of implementation plans
    - Verify alignment with original requirements
    - Check for missing components or gaps
    - Validate feasibility of proposed solutions
    - Ensure all dependencies are addressed
    - **CRITICAL**: Verify all technical decisions are reflected in artifacts
    - Confirm clarifications are properly incorporated throughout

22. **Cross-Reference Documentation**:
    - Verify all code examples are syntactically correct
    - Ensure library versions are compatible
    - Validate API contracts match implementation plans
    - Confirm data models support all use cases
    - Check that security measures cover all risks
    - **Ensure decision rationale is documented for future reference**
    - Validate that chosen approaches align with stakeholder decisions

## Phase 9: Final Reporting

23. **Generate Executive Summary** (`$SPECS_DIR/executive-summary.md`):
    - High-level implementation approach
    - Technology decisions and justifications
    - Timeline and milestone estimates
    - Resource requirements
    - Risk summary and mitigation plans
    - Success metrics and KPIs
    - Go/No-go recommendations

24. **Create Dependency Graph** (`$SPECS_DIR/dependencies.md`):
    - Visual dependency graph (Mermaid diagram)
    - External service dependencies
    - Library and framework dependencies
    - Infrastructure requirements
    - Team and skill dependencies

25. **Report Results**:
    - Branch name and all generated file paths
    - Summary of key decisions and recommendations
    - Critical risks and blockers identified
    - Next steps and immediate actions required
    - Stakeholder review items
    - Questions requiring business input

## Error Handling

- If MCP servers are unavailable, proceed with reduced functionality and note limitations
- If setup script fails, provide detailed error diagnosis and recovery steps
- If specification is incomplete, identify gaps and request additional information
- If conflicting requirements are found, present options with trade-offs
- If performance/security risks are identified, escalate with clear warnings
- Maintain detailed error logs for debugging and audit purposes
- **CRITICAL**: If technical decisions are needed but stakeholder doesn't respond:
  * Document the recommended option as provisional
  * Mark it as "PROVISIONAL DECISION" in all artifacts
  * Create a decision review checkpoint in tasks
  * Proceed with the most flexible/reversible option
  * Add migration tasks in case decision changes
- If decisions reveal architectural conflicts, propose alternative approaches
- If clarifications from specify phase are missing, check `.specify/memory/clarifications-log.json`

## Execution Notes

- All file operations use absolute paths from repository root
- Template execution follows `.specify/templates/plan-template.md` structure
- Progress tracking is updated in real-time
- User-provided arguments are incorporated as Technical Context: $ARGUMENTS
- All artifacts are version-controlled and timestamped
- Research prioritizes information from 2024-2025
- Generated artifacts are immediately actionable by development teams
- Consider both technical excellence and business value in all recommendations
