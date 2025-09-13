---
description: Generate intelligent, actionable, dependency-ordered tasks with advanced analysis, research, and implementation guidance.
---

Given the context provided as an argument, execute this enhanced workflow:

## Phase 1: Environment Setup and Document Analysis

1. **Validate Environment**: Run `.specify/scripts/bash/check-task-prerequisites.sh --json` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute. Handle script errors gracefully.

2. **Deep Document Analysis**: Load and analyze all available design documents:
   - **Required**: Read plan.md for tech stack, libraries, and architecture decisions
   - **If exists**: data-model.md for entities, relationships, and data flow
   - **If exists**: contracts/ for API endpoints, message formats, and protocols
   - **If exists**: research.md for technical decisions and trade-offs
   - **If exists**: quickstart.md for development setup and test scenarios
   - **If exists**: performance-plan.md for optimization requirements
   - **If exists**: security-plan.md for security requirements
   - **If exists**: testing-strategy.md for testing approaches

   Note: Generate appropriate tasks based on available documents. Missing documents indicate different project types (CLI tools, libraries, microservices).

## Phase 2: Intelligent Task Analysis

3. **Sequential Thinking for Task Breakdown**: Use `mcp__sequential-thinking__sequentialthinking` to:
   - Analyze the feature complexity and identify all required components
   - Break down each component into atomic, testable tasks
   - Identify critical path and task dependencies
   - Determine optimal task sequencing for maximum efficiency
   - Identify tasks that can be parallelized safely
   - Estimate complexity and effort for each task (T-shirt sizes: XS, S, M, L, XL)
   - Identify high-risk tasks that need extra attention
   - Generate alternative implementation approaches for complex tasks

## Phase 3: Modern Development Practices Research

4. **Research Current Best Practices**: Using `mcp__tavily-mcp__tavily-search`:
   - Search "latest agile development task breakdown best practices"
   - Research "modern TDD workflow task organization"
   - Find "continuous integration task dependencies patterns"
   - Investigate "microservices development task sequencing"
   - Search for "parallel development strategies for [tech stack]"
   - Research "task estimation techniques for [feature type]"
   - Find "development velocity optimization strategies"

5. **Technology-Specific Workflow Research**: Using `mcp__tavily-mcp__tavily-search`:
   - Search "[framework] development workflow best practices latest"
   - Research testing patterns for identified technologies
   - Find CI/CD task patterns for the tech stack
   - Investigate deployment task sequences
   - Research rollback and recovery task procedures

## Phase 4: Implementation Examples and Documentation

6. **Retrieve Framework-Specific Examples**: For each identified technology:
   - Use `mcp__context7__resolve-library-id` to find library IDs
   - Use `mcp__context7__get-library-docs` to retrieve:
     * Setup and initialization code examples
     * Testing utilities and patterns
     * Common implementation patterns
     * Configuration examples
     * Build and deployment scripts
     * Performance optimization techniques

7. **Gather Task-Specific Code Snippets**: Using `mcp__context7__get-library-docs`:
   - Retrieve boilerplate code for each task type
   - Find testing examples for each component
   - Get integration patterns for identified services
   - Retrieve error handling patterns
   - Find logging and monitoring setup examples

## Phase 5: Advanced Task Generation

8. **Generate Setup Tasks** (Category: Foundation):
   - Project initialization with specific framework versions
   - Development environment configuration
   - Dependency installation with lock files
   - Linting and formatting setup
   - Git hooks and pre-commit configuration
   - Docker/containerization setup if applicable
   - CI/CD pipeline initialization
   - Include specific commands and configuration snippets from context7

9. **Generate Test Tasks [P]** (Category: Quality Assurance):
   - **Contract Tests**: One test suite per API contract
   - **Unit Test Scaffolding**: Test structure for each component
   - **Integration Test Setup**: Database, API, and service mocks
   - **E2E Test Framework**: User journey test setup
   - **Performance Test Harness**: Load testing setup
   - **Security Test Suite**: Vulnerability scanning setup
   - Mark all as [P] for parallel execution
   - Include test examples from context7 documentation

10. **Generate Core Implementation Tasks** (Category: Development):
    - **Data Layer**: One task per entity/model with migration scripts
    - **Business Logic**: One task per service/use case
    - **API Layer**: One task per endpoint/GraphQL resolver
    - **CLI Commands**: One task per command if applicable
    - **Event Handlers**: One task per event type
    - **Background Jobs**: One task per job type
    - Include implementation patterns from research
    - Mark [P] only if files don't overlap

11. **Generate Integration Tasks** (Category: Connectivity):
    - Database connection pooling and optimization
    - Cache layer integration (Redis, Memcached)
    - Message queue setup (RabbitMQ, Kafka)
    - External API integrations
    - Authentication/authorization middleware
    - Logging and monitoring integration
    - Error tracking service setup
    - Include configuration examples from documentation

12. **Generate Polish Tasks [P]** (Category: Optimization):
    - Unit test completion to target coverage
    - Performance optimization based on benchmarks
    - Security hardening and vulnerability fixes
    - Documentation generation and updates
    - Code refactoring for maintainability
    - Accessibility improvements if applicable
    - Internationalization setup if needed

## Phase 6: Task Optimization and Ordering

13. **Dependency Analysis**: Use `mcp__sequential-thinking__sequentialthinking` to:
    - Create a detailed dependency graph
    - Identify the critical path
    - Find opportunities for parallelization
    - Detect circular dependencies
    - Optimize task sequence for fastest delivery
    - Identify bottlenecks and resource conflicts

14. **Risk-Based Prioritization**:
    - Assign risk scores (1-5) to each task
    - Prioritize high-risk tasks early for risk mitigation
    - Identify tasks that block multiple dependencies
    - Create contingency tasks for high-risk items
    - Add validation checkpoints after critical tasks

15. **Resource Optimization**:
    - Group tasks by required expertise
    - Identify tasks suitable for pair programming
    - Mark tasks that can be automated
    - Identify tasks suitable for junior developers
    - Flag tasks requiring senior review

## Phase 7: Enhanced Task Documentation

16. **Task Enrichment**: For each task, include:
    - **Task ID**: Unique identifier (T001, T002, etc.)
    - **Title**: Clear, action-oriented description
    - **Category**: Foundation/QA/Development/Connectivity/Optimization
    - **Effort**: XS/S/M/L/XL with hour estimates
    - **Risk Level**: Low/Medium/High with mitigation notes
    - **Dependencies**: List of prerequisite task IDs
    - **Parallel Group**: [P-1], [P-2], etc. for batch execution
    - **Files to Modify**: Exact file paths
    - **Implementation Notes**: Specific techniques from research
    - **Code Snippets**: Relevant examples from context7
    - **Testing Requirements**: How to verify completion
    - **Review Checklist**: Items to check before marking complete
    - **Documentation Updates**: Related docs to update

17. **Execution Strategies**: Include sections for:
    - **Solo Development**: Sequential task order for single developer
    - **Team Development**: Parallel tracks for multiple developers
    - **CI/CD Integration**: Tasks to automate in pipeline
    - **Incremental Delivery**: MVP tasks vs. enhancement tasks
    - **Fast Track**: Minimum tasks for rapid prototype

## Phase 8: Advanced Execution Guidance

18. **Generate Parallel Execution Commands**:
    ```bash
    # Example parallel execution groups
    # Group P-1: Independent test scaffolding
    Task agent --parallel "Create unit test structure" "Setup integration tests" "Initialize E2E framework"

    # Group P-2: Independent model creation
    Task agent --parallel "Create User model" "Create Product model" "Create Order model"
    ```

19. **Create Task Automation Scripts**:
    - Shell scripts for repetitive setup tasks
    - Code generation templates for boilerplate
    - Test data generation scripts
    - Database migration runners
    - Deployment automation scripts

20. **Add Progress Tracking**:
    - Burndown chart data structure
    - Velocity tracking metrics
    - Blocker identification system
    - Daily standup checklist
    - Sprint planning guidelines

## Phase 9: Quality Assurance and Validation

21. **Validate Task Completeness**: Use `mcp__sequential-thinking__sequentialthinking` to:
    - Verify all requirements are covered by tasks
    - Check that no functionality is missing
    - Ensure test coverage is adequate
    - Validate that tasks are atomic and testable
    - Confirm dependencies are correctly mapped

22. **Cross-Reference with Best Practices**:
    - Verify tasks follow TDD principles
    - Ensure security tasks are included
    - Confirm performance tasks are present
    - Check documentation tasks are included
    - Validate deployment tasks are complete

## Phase 10: Final Output Generation

23. **Create Enhanced tasks.md**: Generate FEATURE_DIR/tasks.md with:
    - **Executive Summary**: Feature overview and task statistics
    - **Risk Assessment**: High-risk items and mitigation strategies
    - **Timeline Estimate**: Based on effort and dependencies
    - **Team Recommendations**: Optimal team size and skill requirements
    - **Task Sections**: Organized by category with all enriched data
    - **Execution Playbooks**: Different strategies for different scenarios
    - **Automation Opportunities**: Tasks suitable for automation
    - **Success Metrics**: How to measure task completion quality
    - **Appendices**: Code snippets, configuration examples, commands

24. **Generate Supporting Files**:
    - `task-dependencies.mermaid`: Visual dependency graph
    - `parallel-groups.md`: Detailed parallel execution plan
    - `automation-scripts/`: Generated helper scripts
    - `task-templates/`: Boilerplate code for each task type
    - `validation-checklist.md`: Task completion verification

25. **Report Summary**: Provide to user:
    - Total tasks generated with breakdown by category
    - Estimated total effort in hours/days
    - Critical path length and bottlenecks
    - Recommended team size and timeline
    - High-risk items requiring attention
    - Quick wins for early momentum
    - Next immediate actions

## Error Handling

- If MCP servers unavailable, proceed with basic task generation and note limitations
- If prerequisites check fails, diagnose issues and suggest fixes
- If documents are missing, generate appropriate subset of tasks
- If conflicting requirements found, create decision tasks
- If estimation uncertain, provide ranges with assumptions
- Log all decisions and assumptions for transparency

## Execution Notes

- Context for task generation: $ARGUMENTS
- All file paths must be absolute from repository root
- Tasks must be specific enough for LLM execution without additional context
- Each task should be completable in 1-4 hours ideally
- Include rollback procedures for risky tasks
- Consider both development and operational tasks
- Prioritize testability and observability
- Focus on incremental, demonstrable progress
- Tasks should enable continuous integration and deployment
