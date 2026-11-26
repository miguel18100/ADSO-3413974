# A7 – Requirements Traceability Matrix

## 1. Purpose

This document establishes the traceability relationship between the selected functional requirements from A1, the proposed class design in A2, and the component view in A5.

The matrix supports architectural traceability by identifying the proposed classes and components associated with each functional requirement.

This traceability matrix represents a design-level mapping. It does not constitute evidence of implemented or tested functionality.

## 2. Traceability Matrix

| Requirement ID | Requirement | Related Classes (A2) | Related Components (A5) | Architectural Evidence |
|---|---|---|---|---|
| RF-01 | User login through defined authentication mechanisms. | Usuario, Rol | User and Role Management, Application Controller | A2 Class Diagram; A5 Component View |
| RF-03 | User management including consultation, creation, update and deletion according to permissions. | Usuario, Rol | User and Role Management, GestionServicioFacade | A2 Class Diagram; A5 Component View |
| RF-04 | Operational dashboard displaying the current status of requests, services and resources according to authorized roles. | Usuario, Rol, Solicitud, Servicio, Ambulancia, Asignacion | Web UI, Application Controller, GestionServicioFacade, Service Management, Assignment Management, User and Role Management | A2 Class Diagram; A4 Architecture; A5 Component View |
| RF-05 | Ambulance registration and management. | Ambulancia | Service Management, Repository / Persistence | A2 Class Diagram; A5 Component View |
| RF-09 | Registration of operational personnel. | Personal, AsignacionPersonal | Service Management, Assignment Management, Repository / Persistence | A2 Class Diagram; A5 Component View |
| RF-12 | Registration of service transportation requests. | Solicitud, Servicio | Application Controller, GestionServicioFacade, Service Management | A2 Class Diagram; A5 Component View |
| RF-16 | Consultation of available operational resources. | Ambulancia, Personal, Asignacion, AsignacionPersonal | Assignment Management, Assignment Strategy, Repository / Persistence | A2 Class Diagram; A3 Design Patterns; A5 Component View |
| RF-17 | Assignment of an ambulance to a service request according to operational criteria. | Solicitud, Servicio, Ambulancia, Personal, Asignacion, AsignacionPersonal, EstrategiaAsignacion, EstrategiaAsignacionUrgente, EstrategiaAsignacionGeneral | Assignment Management, Assignment Strategy, GestionServicioFacade | A2 Class Diagram; A3 Design Patterns; A5 Component View |
| RF-20 | Updating a service status during its operational lifecycle. | Servicio, Asignacion, RegistroCierre | Service Management, GestionServicioFacade, Service Closure Management | A2 Class Diagram; A5 Component View |
| RF-29 | Registration and consultation of basic patient information associated with a prehospital service. | Paciente, Servicio | Patient Management, Service Management, Repository / Persistence | A2 Class Diagram; A5 Component View |
| RF-30 | Recording prehospital interventions performed during a service by authorized TAM paramedics. | Paciente, Servicio, Intervencion, Usuario, Rol | Patient Management, Service Management, User and Role Management, Repository / Persistence | A2 Class Diagram; A5 Component View |
| RF-31 | Closing a completed service with its care summary, exit condition, destination, times and authorized observations. | Servicio, Intervencion, RegistroCierre, Paciente | Service Closure Management, Service Management, GestionServicioFacade, Repository / Persistence | A2 Class Diagram; A5 Component View |

## 3. Class Traceability Summary

The proposed class design provides the following conceptual coverage:

| Class / Interface | Related Requirements |
|---|---|
| Usuario | RF-01, RF-03, RF-04, RF-30 |
| Rol | RF-01, RF-03, RF-04, RF-30 |
| Ambulancia | RF-04, RF-05, RF-16, RF-17 |
| Personal | RF-04, RF-09, RF-16, RF-17 |
| Solicitud | RF-04, RF-12, RF-16, RF-17 |
| Servicio | RF-04, RF-12, RF-20, RF-29, RF-30, RF-31 |
| Asignacion | RF-04, RF-16, RF-17, RF-20 |
| AsignacionPersonal | RF-09, RF-16, RF-17 |
| Paciente | RF-29, RF-30, RF-31 |
| Intervencion | RF-30, RF-31 |
| RegistroCierre | RF-20, RF-31 |
| EstrategiaAsignacion | RF-16, RF-17 |
| EstrategiaAsignacionUrgente | RF-17 |
| EstrategiaAsignacionGeneral | RF-17 |
| GestionServicioFacade | RF-03, RF-04, RF-12, RF-17, RF-20, RF-31 |

## 4. Component Traceability Summary

| Component | Related Requirements |
|---|---|
| Web UI | RF-04 |
| Application Controller | RF-01, RF-04, RF-12 |
| GestionServicioFacade | RF-03, RF-04, RF-12, RF-17, RF-20, RF-31 |
| Service Management | RF-04, RF-05, RF-09, RF-12, RF-20, RF-29, RF-30, RF-31 |
| Assignment Management | RF-04, RF-09, RF-16, RF-17, RF-20 |
| Assignment Strategy | RF-16, RF-17 |
| Patient Management | RF-29, RF-30, RF-31 |
| User and Role Management | RF-01, RF-03, RF-04, RF-30 |
| Service Closure Management | RF-20, RF-31 |
| Repository / Persistence | RF-03, RF-05, RF-09, RF-12, RF-16, RF-17, RF-20, RF-29, RF-30, RF-31 |
| Database | Data persistence for the requirements supported by repository and persistence operations |

## 5. Traceability with Non-Functional Requirements

| NFR ID | Architectural Elements | Evidence |
|---|---|---|
| RNF-03 | User and Role Management, Usuario, Rol, Application Controller | A2, A4, A5 |
| RNF-04 | Patient Management, User and Role Management, Repository / Persistence, Database | A2, A4, A5, A6 |
| RNF-05 | Servicio, Solicitud, Asignacion, Ambulancia, Personal, Repository / Persistence, Database | A2, A4, A5, A6 |
| RNF-06 | Service Management, Assignment Management, GestionServicioFacade, Database | A2, A4, A5, A6 |
| RNF-08 | Database, Deployment Architecture | A4, A6 |
| RNF-09 | Layered Architecture, Domain Components, Facade, Strategy | A3, A4, A5 |
| RNF-11 | Web UI, Application Components, Repository / Persistence, Database | A4, A5, A6 |
| RNF-12 | Patient Management, Repository / Persistence, Database, User and Role Management | A2, A4, A5, A6 |
| RNF-13 | User and Role Management, Service Management, Application Architecture | A4, A5; audit implementation remains pending |
| RNF-14 | Client Device, Application Server, HTTPS Communication | A6 |

## 6. Traceability Limitations

- Traceability is based on the selected requirements documented in A1.
- The class and component relationships represent the proposed design.
- Some requirements are mapped to multiple classes and components because their workflows require coordination.
- The architecture does not prove that every mapped requirement is implemented.
- Requirement validation, integration testing, and implementation evidence must be completed in subsequent development activities.
- Audit logging, backup and recovery, performance optimization, secure configuration, and other non-functional implementations remain subject to implementation and validation.

## 7. Conclusion

The traceability matrix establishes a structured relationship between the selected functional requirements, the proposed class design, and the component architecture.

The matrix supports architectural consistency, facilitates future implementation planning, and provides a basis for identifying architectural coverage and validation needs.

The relationships documented here are design-level mappings and must be verified during implementation and testing.

## 8. References

- A1 – Requirements and Technology Decisions.
- A2 – Class Diagram and Class Design.
- A3 – Design Patterns.
- A4 – Software Architecture.
- A5 – Component View and Interface Specification.

---

**Evidence:** G2-P1 – A7 Requirements Traceability Matrix.
