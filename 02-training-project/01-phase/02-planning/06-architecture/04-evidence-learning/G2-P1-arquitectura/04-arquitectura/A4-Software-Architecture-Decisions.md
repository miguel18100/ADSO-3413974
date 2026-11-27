# A4 – Software Architecture and Architectural Decisions

## 1. Purpose

This document defines the proposed software architecture for SIGMAVITAL. It describes the architectural layers, their responsibilities, interactions, and the decisions made to address the system requirements and non-functional requirements (NFRs).

The architecture is a design proposal and does not imply that all components have already been implemented.

## 2. Architectural Style

SIGMAVITAL adopts a layered architecture with separation of responsibilities between presentation, application, domain, and infrastructure layers.

The proposed architecture aims to improve maintainability, modularity, testability, data integrity, and the ability to evolve the system without unnecessarily coupling its components.

## 3. Architectural Layers

### 3.1 Presentation Layer

**Component:** Web User Interface.

Responsibilities:
- Provide the interface through which users interact with the system.
- Present operational information and system responses.
- Collect user input.
- Communicate with the application layer.

This layer should not directly implement core business rules or database operations.

### 3.2 Application Layer

**Components:** Application Controllers and GestionServicioFacade.

Responsibilities:
- Coordinate application workflows.
- Receive and process user requests.
- Delegate operations to domain components.
- Coordinate service management, assignment, and service closure.
- Avoid directly implementing complex domain rules.

The `GestionServicioFacade` provides a simplified interface for coordinating service-related operations.

### 3.3 Domain Layer

**Components:** Service Management, Assignment Management, Assignment Strategy, Patient Management, and User and Role Management.

Responsibilities:
- Represent and coordinate the system's main business capabilities.
- Apply domain rules.
- Manage service-related operations.
- Support assignment decisions through the Strategy design pattern.
- Organize user, role, patient, and assignment-related responsibilities.

The Assignment Strategy component supports the use of interchangeable assignment algorithms according to the system's needs.

### 3.4 Infrastructure Layer

**Components:** Persistence / Repository and Relational Database.

Responsibilities:
- Provide persistence mechanisms.
- Manage data access.
- Support communication between domain/application components and persistent storage.
- Maintain stored information according to the defined data model and integrity constraints.

The repository component acts as an abstraction between the application/domain functionality and the database.

## 4. Architectural Interaction Flow

The proposed interaction flow is:

1. The user interacts with the Web User Interface.
2. The interface communicates with Application Controllers.
3. Application Controllers delegate workflow coordination to GestionServicioFacade.
4. GestionServicioFacade coordinates the required domain operations.
5. Domain components execute or coordinate the corresponding business responsibilities.
6. Persistence operations are delegated to the Repository component.
7. The Repository communicates with the Relational Database.
8. The resulting information is returned through the application and presentation layers.

## 5. Architectural Decisions

| ID | Architectural Decision | Justification |
|---|---|---|
| AD-01 | Adopt a layered architecture. | Separates responsibilities and reduces coupling between presentation, business logic, and data access. |
| AD-02 | Introduce GestionServicioFacade in the application layer. | Simplifies workflow coordination and reduces direct dependencies between application entry points and multiple domain components. |
| AD-03 | Separate domain responsibilities into specialized components. | Improves organization, maintainability, and the ability to evolve specific business capabilities. |
| AD-04 | Use the Strategy design pattern for assignment behavior. | Allows assignment criteria to vary without unnecessarily modifying the assignment management component. |
| AD-05 | Introduce a Repository component for persistence. | Abstracts data access and reduces direct coupling between business components and database implementation details. |
| AD-06 | Use a relational database. | Supports structured data, relationships, and integrity constraints required by the system. |

## 6. Non-Functional Requirements and Architectural Responses

| NFR ID | Non-Functional Requirement | Architectural Response | Expected Benefit |
|---|---|---|---|
| RNF-03 | Access control | Application controllers, role-related domain responsibilities, and controlled access to application operations. | Provides a proposed structure for implementing and validating access restrictions. |
| RNF-04 | Information protection | Layer separation and controlled interaction with infrastructure and persistence components. | Provides architectural separation to support protection mechanisms during implementation. |
| RNF-05 | Data integrity | Relational database, repository abstraction, and data integrity constraints. | Supports integrity controls and consistency of persisted information. |
| RNF-06 | Consistency | Domain responsibilities and controlled application workflows. | Supports consistent handling of business operations. |
| RNF-08 | Backup and recovery | Infrastructure layer and database administration mechanisms to be defined during implementation. | Establishes the architectural location for subsequent backup and recovery implementation. |
| RNF-09 | Modularity | Layered architecture and specialized domain components. | Supports separation of responsibilities and modular evolution. |
| RNF-11 | Performance | Separation of responsibilities and infrastructure components that can be evaluated and optimized during implementation. | Provides a basis for subsequent performance evaluation and optimization. |
| RNF-12 | Privacy and legal handling of personal and health data | Controlled access, domain separation, and persistence responsibilities. | Provides a structural basis for implementing and validating privacy controls. |
| RNF-13 | Auditability | Application workflows and domain responsibilities can be extended with audit records and traceability mechanisms. | Provides a proposed architectural basis for audit implementation. |
| RNF-14 | Secure communication and production configuration | Presentation/application communication and infrastructure configuration must be secured during implementation and deployment. | Establishes security considerations for subsequent implementation and deployment validation. |

## 7. Architecture Diagram

The architecture diagram is provided in the following files:

- `A4-Arquitectura-SIGMAVITAL.drawio`: editable Draw.io source of the architecture diagram.
- `A4-Arquitectura-SIGMAVITAL.png`: graphical representation of the architecture diagram.
- `A4-Arquitectura-SIGMAVITAL.svg`: vector representation of the architecture diagram.

The diagram illustrates the architectural layers, their components, dependency relationships, and selected non-functional considerations.
## 8. Architecture Limitations and Implementation Considerations

The architecture represents a proposed design for SIGMAVITAL. Its components, interfaces, persistence mechanisms, and operational behavior must be validated during implementation and testing.

The diagram does not represent evidence of a deployed or fully implemented system.

Implementation should subsequently validate:
- The effectiveness of layer separation.
- The correctness of assignment strategies.
- The integration of persistence mechanisms.
- The achievement of defined non-functional requirements.
- The security and integrity of application data.

## 9. Conclusion

The proposed SIGMAVITAL architecture establishes a structured organization based on presentation, application, domain, and infrastructure responsibilities.

The layered design, domain modularization, Strategy pattern, Facade coordination, and Repository abstraction provide a foundation for maintainability, modularity, testability, extensibility, and data integrity.

This architectural proposal supports the subsequent development, integration, and validation activities of the SIGMAVITAL software solution.

## 9. Rejected Architectural Alternative

### AD-07 – Microservices architecture rejected for the current scope

A microservices architecture was considered as an alternative to the selected layered architecture (modular monolith for the initial delivery).

**Reasons for rejection:**
- The current requirements describe one operational system with closely related workflows for requests, ambulance/personnel assignment, interventions and closure; they do not establish independently deployable business domains.
- Distributed calls would introduce service discovery, network-failure handling, distributed tracing and deployment/monitoring overhead that is not justified by the documented scale or team capacity.
- Transactions spanning assignment, resource availability and closure would require additional consistency mechanisms and would increase the risk of partial updates.
- The selected layered architecture keeps deployment and data integrity simpler while preserving component boundaries and interfaces that can later support service extraction if scale or organizational needs justify it.

**Decision:** retain the layered architecture for the current scope. Revisit microservices only if independently scalable modules, separate release cadences or measured load justify the added operational complexity.

This is an architectural decision, not a claim that performance or scalability has already been measured.
