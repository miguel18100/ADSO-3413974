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

## 5. Communication Protocols, Ports and Security

The ports below are **proposed default configuration values**, not evidence of a running or publicly exposed deployment. They must be confirmed against the selected server, firewall and environment configuration.

| Source node / artifact | Destination node / artifact | Protocol / mechanism | Proposed port | Purpose / constraint |
|---|---|---|---:|---|
| Client Device / Browser | Application Server / Web Application | HTTPS over TCP | 443 | Encrypted browser-to-application communication; TLS certificate and modern TLS configuration required. |
| Application Server / Repository | Database Server / MariaDB or MySQL | MySQL protocol over TCP | 3306 | Database access restricted to the application server network identity; never exposed directly to public clients. |
| Web UI | Application Controllers (same application deployment) | In-process application call | N/A | Internal call within the application runtime; no separate network port is implied. |
| Application Controller | GestionServicioFacade (same application deployment) | In-process application call | N/A | Workflow coordination inside the application process. |
| Facade / Domain components | Repository contract (same application deployment) | In-process interface call | N/A | Dependency inversion; persistence calls use the repository boundary. |

### Port and deployment assumptions

- TCP/443 is the standard proposed HTTPS listener for the browser-facing application. HTTP on TCP/80, if enabled at all, should only redirect to HTTPS and must not carry authenticated or personal data.
- TCP/3306 is the proposed database listener for MariaDB/MySQL, consistent with the SQL scripts in B5. Access must be limited to the application server or an approved administration network.
- The application-to-database connection must use credentials with least privilege, secure transport where supported/configured, and secrets stored outside source control.
- The internal application interactions are not separate network links; assigning ports to them would incorrectly suggest distributed services.

### Deployment decisions mapped to non-functional requirements

| NFR | Deployment decision | Verification to perform during implementation |
|---|---|---|
| RNF-03 / RNF-04 / RNF-12 | Authenticate and authorize at the application boundary; database is not public; least-privilege service account. | Verify role-based access, denied unauthorized requests, database network restriction and personal-data access logs. |
| RNF-05 / RNF-06 | Persist through the application server and relational database with PK/FK/UNIQUE/CHECK constraints. | Execute integration tests for valid and invalid references, uniqueness and state transitions. |
| RNF-08 | Backups are managed at the database/infrastructure layer; restoration occurs in a separate staging environment. | Perform and record a restore drill, compare table/row counts and run integrity checks. |
| RNF-09 | Three-node deployment separation and layered application organization. | Verify components can be changed/tested through defined interfaces without bypassing layers. |
| RNF-11 | Application/database resources sized and monitored independently. | Measure response time, concurrency and resource use under a documented workload. |
| RNF-13 | Application workflow layer is the proposed point for audit events; database retains operational data. | Verify who/what/when audit events for sensitive operations and prevent unauthorized alteration. |
| RNF-14 | Browser communication via HTTPS TCP/443; database port restricted to application server and secured. | Verify TLS certificate, protocol configuration, firewall rules and database connection security. |

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

