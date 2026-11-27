# A6 – Deployment View and Deployment Specification

## 1. Purpose

This document describes the proposed deployment architecture of SIGMAVITAL. It identifies deployment nodes, software artifacts, communication channels, and deployment considerations.

The deployment view complements the component and software architecture views by describing how the software is proposed to be distributed across execution environments.

This is a proposed deployment model and does not represent an already deployed or production-tested infrastructure.

## 2. Deployment Overview

The proposed SIGMAVITAL deployment model includes three principal nodes:

1. Client Device.
2. Application Server.
3. Database Server.

This separation supports logical isolation between the user interface, application processing, and persistent storage.

## 3. Deployment Nodes

### 3.1 Client Device

**Purpose:** Provides the user access point to SIGMAVITAL.

**Hardware / execution environment:** User computer or compatible device.

**Software:**
- Web browser.

**Artifact:**
- Web Browser.

**Responsibilities:**
- Display the system interface.
- Allow authorized users to interact with the system.
- Send requests to the application server.
- Display application responses.

**Communication:** HTTPS to the application server.

### 3.2 Application Server

**Purpose:** Hosts and executes the SIGMAVITAL application logic.

**Artifacts:**
- SIGMAVITAL Web Application.
- Application Controllers.
- GestionServicioFacade.
- Domain Components.

**Responsibilities:**
- Process application requests.
- Coordinate application workflows.
- Execute domain operations.
- Coordinate service management and assignment workflows.
- Interact with the database through persistence mechanisms.

**Communication:**
- HTTPS with the client.
- Database connection / SQL communication with the database server.

### 3.3 Database Server

**Purpose:** Provides persistent relational storage for SIGMAVITAL.

**Artifact:**
- SIGMAVITAL Relational Database.

**Responsibilities:**
- Store application data.
- Maintain persistent records.
- Enforce database integrity constraints.
- Support database operations requested by application components.

**Communication:** Database connection using the database protocol.

## 4. Deployment Artifacts

| Artifact | Deployment Node | Purpose |
|---|---|---|
| Web Browser | Client Device | Provides the user interface execution environment. |
| SIGMAVITAL Web Application | Application Server | Hosts the application interface and application functionality. |
| Application Controllers | Application Server | Receives and coordinates application requests. |
| GestionServicioFacade | Application Server | Coordinates service-related application workflows. |
| Domain Components | Application Server | Executes domain responsibilities and business operations. |
| SIGMAVITAL Relational Database | Database Server | Provides persistent storage. |

## 5. Communication Protocols

| Communication | Protocol / Mechanism | Purpose |
|---|---|---|
| Client Device to Application Server | HTTPS | Secure communication between the browser and application. |
| Web Application to Application Controllers | Application interaction | Internal request processing and coordination. |
| Application Controllers to GestionServicioFacade | Internal application interaction | Workflow coordination. |
| Facade to Domain Components | Internal application interaction | Delegation of domain operations. |
| Domain Components to Database Server | SQL / Database connection | Data access and persistence. |

HTTPS is proposed for client-server communication to protect data in transit.

The specific database protocol, port, server configuration, and deployment technology must be defined and validated during implementation.

## 6. Deployment Diagram

The deployment diagram is provided in the following files:

- A6-Deployment-View-SIGMAVITAL.drawio: editable source diagram created with Draw.io.
- A6-Deployment-View-SIGMAVITAL.png: graphical representation of the deployment view.
- A6-Deployment-View-SIGMAVITAL.svg: vector representation of the deployment view.

The diagram represents the proposed client, application, and database deployment nodes and their communication relationships.

## 7. Deployment Decisions

### Decision 1: Separate Client and Application Execution

The client accesses SIGMAVITAL through a browser instead of executing the principal application logic locally.

**Rationale:** Centralizes application processing and simplifies the distribution of application updates.

### Decision 2: Dedicated Application Server Node

Application processing is assigned to an application server node.

**Rationale:** Separates application functionality from the user device and persistent data storage.

### Decision 3: Dedicated Database Server Node

Persistent data storage is assigned to a database server node.

**Rationale:** Supports data organization, persistence, integrity management, and separation of responsibilities.

### Decision 4: HTTPS Communication

HTTPS is proposed for communication between client devices and the application server.

**Rationale:** Protects transmitted information through encrypted communication.

### Decision 5: Database Access Through Application Components

The client does not communicate directly with the database server.

**Rationale:** Keeps database access within the application architecture and avoids exposing database operations directly to clients.

## 8. Deployment Considerations

- Application and database server sizing must be defined according to expected workload.
- HTTPS certificates and configuration must be validated before production deployment.
- Database access credentials must be protected.
- Database access should be restricted to authorized application infrastructure.
- Backup and recovery procedures must be defined.
- Monitoring and logging mechanisms should be established.
- The proposed deployment must be validated through integration and deployment testing.

## 9. Alignment with Other Architecture Evidence

The deployment view is aligned with:

- A2: Class Design.
- A3: Design Patterns.
- A4: Software Architecture.
- A5: Component View and Interface Specification.

The deployment view provides the proposed execution environment for the components described in A5 and the architectural layers documented in A4.

## 10. Conclusion

The proposed deployment architecture separates user access, application processing, and persistent storage into three deployment nodes.

This structure establishes a conceptual deployment foundation for SIGMAVITAL and supports security, separation of responsibilities, maintainability, and future infrastructure validation.

The deployment model remains a proposal until its infrastructure, configuration, communication, and operational behavior are implemented and tested.

