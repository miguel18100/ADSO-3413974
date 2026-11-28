# A5 – Component View and Interface Specification

## 1. Purpose

This document describes the proposed component view of SIGMAVITAL. It identifies the principal software components, their responsibilities, interfaces, and dependencies.

The component view complements the software architecture and class design by illustrating how functional responsibilities are organized into components and how they interact through defined contracts.

This document represents a design proposal. It does not claim that the components or interfaces have already been implemented.

## 2. Component Overview

The proposed component view is organized into four logical areas:

- Presentation
- Application
- Domain Components
- Infrastructure

## 3. Component Specifications

### 3.1 Web UI

**Layer:** Presentation.

**Responsibilities:**
- Provide user interaction.
- Display operational information.
- Collect and submit user requests.
- Consume application workflow services.

**Interface dependency:** `IServiceWorkflow`.

### 3.2 Application Controller

**Layer:** Application.

**Responsibilities:**
- Receive requests from the presentation layer.
- Coordinate request processing.
- Delegate workflow coordination to the application facade.
- Manage the application-level interaction flow.

**Provided interface:** `IServiceWorkflow`, consumed by Web UI.

### 3.3 GestionServicioFacade

**Layer:** Application.

**Responsibilities:**
- Coordinate service-related workflows.
- Delegate operations to specialized domain components.
- Simplify interactions between application controllers and domain functionality.
- Coordinate service management, assignment, and closure operations.

**Dependencies:** Service Management, Assignment Management, Service Closure Management, and User and Role Management.

### 3.4 Service Management

**Layer:** Domain.

**Responsibilities:**
- Coordinate the domain operations associated with services.
- Manage service-related business rules.
- Coordinate patient-related operations when required.
- Support service lifecycle activities.

**Dependencies:** Patient Management and persistence contracts.

### 3.5 Assignment Management

**Layer:** Domain.

**Responsibilities:**
- Coordinate resource assignment operations.
- Apply the assignment behavior selected for the workflow.
- Support the coordination of ambulance and personnel assignment.

**Interface:** `IAssignment`.

**Dependency:** Assignment Strategy and persistence contract.

### 3.6 Assignment Strategy

**Layer:** Domain.

**Responsibilities:**
- Support interchangeable assignment algorithms.
- Allow assignment criteria to be selected according to operational conditions.
- Reduce the need to modify the assignment management component when assignment behavior changes.

This component is associated with the Strategy design pattern documented in A3.

### 3.7 Patient Management

**Layer:** Domain.

**Responsibilities:**
- Organize patient-related operations.
- Support patient information management within service workflows.
- Provide specialized patient functionality to other domain components.

**Interface:** `IPatientManagement`.

### 3.8 User and Role Management

**Layer:** Domain.

**Responsibilities:**
- Organize user-related functionality.
- Support role-related management responsibilities.
- Provide functionality associated with user and role management.

**Interface:** `IUserManagement`.

### 3.9 Service Closure Management

**Layer:** Domain.

**Responsibilities:**
- Coordinate service closure activities.
- Support the creation and management of closure records.
- Organize service completion information.

**Interface:** `IServiceClosure`.

### 3.10 Repository / Persistence

**Layer:** Infrastructure.

**Responsibilities:**
- Abstract persistence operations.
- Provide a data-access boundary.
- Support data access for domain components.
- Communicate with the relational database.

**Interface:** `IDataPersistence`.

### 3.11 Database

**Layer:** Infrastructure.

**Responsibilities:**
- Persist system information.
- Support relational data storage.
- Enforce database-level integrity constraints as defined in the data model.

## 4. Interface Specification

The table distinguishes the component that provides each contract from the component(s) that consume it. The direction column indicates the dependency direction at the interface boundary.

| Interface | Purpose | Provided by (provider) | Consumed by (consumer) | Dependency direction |
|---|---|---|---|---|
| `IServiceWorkflow` | Provides the application workflow contract for service-related operations. | Application Controller | Web UI | Web UI → Application Controller |
| `IAssignment` | Represents the contract associated with ambulance and personnel assignment operations. | Assignment Management | GestionServicioFacade | GestionServicioFacade → Assignment Management |
| `IPatientManagement` | Represents the contract for patient-related operations. | Patient Management | Service Management | Service Management → Patient Management |
| `IUserManagement` | Represents the contract for user and role-related operations. | User and Role Management | GestionServicioFacade | GestionServicioFacade → User and Role Management |
| `IServiceClosure` | Represents the contract for service closure functionality. | Service Closure Management | GestionServicioFacade | GestionServicioFacade → Service Closure Management |
| `IDataPersistence` | Represents the persistence contract used by domain components. | Repository / Persistence | Service Management, Assignment Management, Patient Management, User and Role Management, and Service Closure Management | Domain components → Repository / Persistence |

`IDataPersistence` is an abstraction provided by the Repository / Persistence component. The Database is the persistence target behind that component, not a direct consumer of the application or domain interfaces.

## 5. Component Dependencies

The proposed dependency relationships are:

1. Web UI interacts with the application workflow contract.
2. Application Controller delegates workflow coordination.
3. GestionServicioFacade coordinates specialized domain components.
4. Service Management coordinates patient-related and service-related functionality.
5. Assignment Management delegates assignment behavior to Assignment Strategy.
6. Domain components depend on the persistence contract.
7. Repository / Persistence implements or provides the persistence functionality.
8. Repository / Persistence communicates with the Database.

These dependencies aim to preserve component separation and reduce unnecessary direct coupling.

## 6. Component Diagram

The component diagram is provided in the following files:

- A5-Component-View-SIGMAVITAL.drawio: editable source diagram created with Draw.io.
- A5-Component-View-SIGMAVITAL.png: graphical representation of the component view.
- A5-Component-View-SIGMAVITAL.svg: vector representation of the component view.

The diagram represents the proposed component organization, interface contracts, and dependencies.

## 7. Design Considerations

- Component boundaries are proposed according to functional responsibilities.
- Interfaces represent conceptual contracts and require implementation-level validation.
- Components are not evidence of completed software implementation.
- Component integration and interface behavior must be validated during subsequent development and testing.
- The component view is aligned with the layered architecture documented in A4 and the class design documented in A2.

## 8. Conclusion

The proposed SIGMAVITAL component view organizes the system into presentation, application, domain, and infrastructure responsibilities.

The component separation, interface contracts, and dependency organization provide a conceptual foundation for modular development, maintainability, testability, and integration.

This view complements the architectural and class design evidence and supports the subsequent implementation and validation of the software solution.

## 9. Component-to-Class and Requirement Mapping

The following mapping connects each component to the A2 classes it groups and the A1 functional requirements it supports. The mapping is at design level; it does not claim implementation completion.

| Component | A2 classes grouped / principally coordinated | Functional requirements supported | Rationale |
|---|---|---|---|
| Web UI | `Usuario`, `Solicitud`, `Servicio`, `Ambulancia`, `Asignacion`, `RegistroCierre` (presentation representations) | RF-01, RF-03, RF-04, RF-05, RF-12, RF-16, RF-17, RF-20, RF-29, RF-30, RF-31 | Screens and interaction entry points for authorized operational users. |
| Application Controller | `Usuario`, `Rol`, `Solicitud`, `Servicio` (request coordination) | RF-01, RF-03, RF-04, RF-12, RF-17, RF-20, RF-31 | Receives requests, applies application-level coordination and delegates to the facade. |
| GestionServicioFacade | `Servicio`, `Solicitud`, `Asignacion`, `AsignacionPersonal`, `RegistroCierre` | RF-03, RF-04, RF-12, RF-17, RF-20, RF-31 | Coordinates multi-step service workflows without moving domain rules into the UI. |
| Service Management | `Solicitud`, `Servicio`, `Paciente`, `Intervencion` | RF-04, RF-12, RF-20, RF-29, RF-30, RF-31 | Manages service lifecycle and coordinates patient/intervention functions; ambulance and personnel master-data registration belong to Assignment Management. |
| Assignment Management | `Ambulancia`, `Personal`, `Asignacion`, `AsignacionPersonal` | RF-04, RF-05, RF-09, RF-16, RF-17, RF-20 | Manages ambulance and personnel records, resource availability, and assignment records. |
| Assignment Strategy | `EstrategiaAsignacion`, `EstrategiaAsignacionUrgente`, `EstrategiaAsignacionGeneral` | RF-16, RF-17 | Encapsulates variable assignment criteria as documented in A3. |
| Patient Management | `Paciente`, `Servicio` | RF-29, RF-30, RF-31 | Organizes basic patient information related to a prehospital service. |
| User and Role Management | `Usuario`, `Rol` | RF-01, RF-03, RF-04 | Supports authentication-related account and role responsibilities. |
| Service Closure Management | `Servicio`, `Intervencion`, `RegistroCierre`, `Paciente` | RF-20, RF-31 | Validates and coordinates the closure record and service state change. |
| Repository / Persistence | All persistent A2 entities: `Usuario`, `Rol`, `Solicitud`, `Servicio`, `Paciente`, `Ambulancia`, `Personal`, `Asignacion`, `AsignacionPersonal`, `Intervencion`, `RegistroCierre` | RF-01, RF-03, RF-05, RF-09, RF-12, RF-16, RF-17, RF-20, RF-29, RF-30, RF-31 | Abstracts persistence for the business components and enforces data contracts. |
| Database | Persistent entities and relations represented in B1/B2 | Data persistence for the requirements above | Implements relational persistence and database constraints when deployed. |

### Mapping and interface consistency

- `IServiceWorkflow` is provided by Application Controller and consumed by Web UI.
- `IAssignment` is provided by Assignment Management and consumed by GestionServicioFacade; `IPatientManagement` is provided by Patient Management and consumed by Service Management; `IUserManagement` and `IServiceClosure` are provided by their respective domain components and consumed by GestionServicioFacade.
- `IDataPersistence` is provided by Repository / Persistence and consumed by the domain components; the Database is accessed behind this persistence boundary.
- Component boundaries align with A4 layers and A2 class responsibilities. Class groupings are conceptual and may be adjusted during implementation while preserving the requirement traceability.
