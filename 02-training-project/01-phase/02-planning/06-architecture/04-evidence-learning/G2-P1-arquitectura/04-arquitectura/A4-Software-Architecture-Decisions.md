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
| RNF-01 | Maintainability | Layered architecture and separation of responsibilities. | Changes can be isolated more effectively between architectural layers. |
| RNF-02 | Modularity | Specialized domain components and Strategy. | Components can evolve with reduced dependency on unrelated functionality. |
| RNF-03 | Data Integrity | Repository abstraction and relational database constraints. | Supports consistent and controlled persistence of related data. |
| RNF-04 | Usability | Dedicated Presentation Layer. | Supports a user-oriented interface independent of domain implementation. |
| RNF-05 | Testability | Separation between application, domain, and infrastructure responsibilities. | Supports isolated testing of components and business rules. |
| RNF-06 | Extensibility | Strategy pattern and modular domain organization. | New assignment strategies or domain capabilities can be incorporated with reduced impact on existing components. |

## 7. Architecture Diagram

The architecture diagram is provided in the following files:

- `A4-Arquitectura-SIGMAVITAL.puml`: editable PlantUML source.
- `A4-Arquitectura-SIGMAVITAL.png`: diagram image.
- `A4-Arquitectura-SIGMAVITAL.svg`: vector diagram.

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
