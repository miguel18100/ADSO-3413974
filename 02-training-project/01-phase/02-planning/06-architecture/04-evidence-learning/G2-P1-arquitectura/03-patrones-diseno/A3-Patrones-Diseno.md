# A3 - Design Patterns Applied to the Class Design

## 1. Purpose

This document identifies and justifies two GoF design patterns proposed for the SIGMAVITAL system. The patterns are connected to the class design and aim to improve flexibility, separation of responsibilities, maintainability, and extensibility.

The patterns considered are:

- Strategy (Behavioral).
- Facade (Structural).

These patterns represent design decisions. Their inclusion does not imply that the corresponding application logic has already been implemented.

---

## 2. Pattern 1: Strategy

### 2.1 Intent

The Strategy pattern encapsulates interchangeable algorithms or decision criteria behind a common interface. It allows the class that coordinates a process to delegate behavior to a concrete strategy without depending directly on a specific implementation.

### 2.2 Classes involved

| Class or interface | Responsibility |
|---|---|
| `EstrategiaAsignacion` | Defines the contract for evaluating and selecting an ambulance. |
| `EstrategiaAsignacionUrgente` | Represents the selection criteria intended for urgent requests. |
| `EstrategiaAsignacionGeneral` | Represents the selection criteria intended for general requests. |
| `Asignacion` | Uses the strategy abstraction to delegate resource selection or evaluation. |

### 2.3 Structure

- `EstrategiaAsignacionUrgente` implements `EstrategiaAsignacion`.
- `EstrategiaAsignacionGeneral` implements `EstrategiaAsignacion`.
- `Asignacion` depends on the `EstrategiaAsignacion` abstraction rather than directly depending on a concrete strategy.

### 2.4 Application in SIGMAVITAL

The design separates ambulance-selection criteria according to the type or operational classification of the request.

The assignment coordinator can delegate resource evaluation to a strategy, allowing different selection criteria to be represented independently.

The proposed design supports future extension with additional assignment strategies without requiring the assignment coordinator to be rewritten for every new criterion.

### 2.5 Justification

Strategy is appropriate because assignment criteria may vary according to operational requirements. Encapsulating those criteria reduces coupling and allows the design to accommodate additional decision rules.

### 2.6 Maintenance benefits

- Reduces coupling between assignment coordination and selection rules.
- Facilitates extension with additional strategies.
- Supports separation of responsibilities.
- Makes future testing of individual strategies easier.
- Avoids concentrating every selection rule in a single class.

### 2.7 Limitations

The diagram and documentation represent the design of the strategy mechanism. The actual operational rules, selection algorithm, and validation of resource-selection criteria remain pending implementation and testing.

---

## 3. Pattern 2: Facade

### 3.1 Intent

The Facade pattern provides a simplified interface to a group of collaborating classes or subsystems. It reduces the complexity that a client must understand when interacting with several components.

### 3.2 Proposed facade

**Proposed class:** `GestionServicioFacade`

This class is proposed as a centralized interface for coordinating the principal steps associated with managing an emergency service.

### 3.3 Classes involved

| Class | Role in the proposed interaction |
|---|---|
| `GestionServicioFacade` | Provides a simplified entry point for coordinating the service workflow. |
| `Solicitud` | Represents the emergency request that initiates the process. |
| `Asignacion` | Coordinates the assignment of operational resources. |
| `Servicio` | Represents the service lifecycle. |
| `RegistroCierre` | Represents the service closure record. |

### 3.4 Proposed responsibilities

The facade may expose simplified operations such as:

- `gestionarSolicitud(solicitud: Solicitud): Servicio`
- `coordinarAsignacion(servicio: Servicio): Asignacion`
- `finalizarServicio(servicio: Servicio): RegistroCierre`

These operations are proposed interface responsibilities. Their implementation and final signatures must be validated during subsequent development.

### 3.5 Proposed relationships

- `GestionServicioFacade` coordinates interactions among the classes involved in the service workflow.
- `GestionServicioFacade` should not replace the responsibilities of `Asignacion`, `Servicio`, or `RegistroCierre`.
- The facade should delegate operations to the corresponding classes instead of duplicating their business logic.

### 3.6 Justification

The Facade pattern is proposed to simplify the interaction with the service-management workflow.

Instead of requiring a client to coordinate several classes directly, a simplified interface can centralize the orchestration of the process while preserving the responsibilities of the existing domain classes.

### 3.7 Maintenance benefits

- Simplifies interactions with the service-management workflow.
- Reduces direct dependencies between clients and multiple domain classes.
- Centralizes orchestration without duplicating domain logic.
- Facilitates future changes to the internal workflow.
- Provides a clearer entry point for application-level coordination.

### 3.8 Limitations

`GestionServicioFacade` is incorporated into the updated UML class diagram. Its implementation and operational validation remain pending.

The facade does not imply that the service workflow is currently implemented or that the proposed operations are executable.

---

## 4. Comparison of the patterns

| Aspect | Strategy | Facade |
|---|---|---|
| GoF category | Behavioral | Structural |
| Main purpose | Encapsulate interchangeable selection criteria. | Simplify interaction with collaborating classes. |
| Main abstraction | `EstrategiaAsignacion` | `GestionServicioFacade` |
| Main benefit | Flexibility in assignment criteria. | Simplified workflow coordination. |
| Design concern | Selection behavior. | Interaction and orchestration. |
| Implementation status | UML design incorporated. | UML design incorporated. |

---

## 5. Design considerations

The two patterns address different design concerns.

Strategy focuses on encapsulating variations in ambulance-selection criteria, while Facade focuses on simplifying the interaction among classes involved in managing an emergency service.

Their coexistence is intended to avoid concentrating responsibilities in a single class and to facilitate future modifications.

The incorporated facade should coordinate the workflow but should not implement the assignment algorithm itself. The assignment criteria remain delegated to the Strategy abstraction.

---

## 6. Traceability to the class design

| Pattern | Related classes | Design artifact |
|---|---|---|
| Strategy | `Asignacion`, `EstrategiaAsignacion`, `EstrategiaAsignacionUrgente`, `EstrategiaAsignacionGeneral` | A2 class diagram and assignment strategy design. |
| Facade | `GestionServicioFacade`, `Solicitud`, `Asignacion`, `Servicio`, `RegistroCierre` | Updated A2 class diagram. |

Both Strategy and Facade are supported by the updated class design and UML diagram.

---

## 7. Overall status

- Strategy: documented and incorporated into the UML class design.
- Facade: documented, justified, and incorporated into the updated UML class diagram.
- Both patterns: justified according to their respective responsibilities and intended maintenance benefits.

The design documentation does not claim that either pattern has been implemented in executable code.




