# Mapping Distributed Systems with C4 Diagrams and Structurizr DSL

See my [blog post](https://blog.glen-thomas.com/architecture/2025/08/27/mapping-complex-distributed-systems-with-c4-diagrams-and-structurizr-dsl2.html) for a full explanation of this repository.

## Repository Structure

This repository demonstrates a modular approach to documenting distributed system architecture using Structurizr DSL. The structure follows a **system-per-folder** pattern with shared configurations and documentation.

```
.
├── README.md                           # This documentation
├── workspace.dsl                       # Main workspace definition and external systems
├── workspace.json                      # Generated Structurizr workspace (auto-generated)
├── styles.dsl                         # Shared styling definitions for all diagrams
│
├── docs/                              # Architecture documentation
│   └── architecture-decision-records/ # ADRs explaining architectural choices
│       ├── 0001-record-architecture-decisions.md
│       ├── 0002-microservices-architecture.md
│       ├── 0003-polyglot-persistence.md
│       ├── 0004-event-driven-architecture.md
│       ├── 0005-api-gateway-pattern.md
│       ├── 0006-technology-diversity-strategy.md
│       ├── 0007-separate-ecommerce-fulfillment.md
│       ├── 0008-external-service-integration.md
│       └── 0009-dedicated-marketing-system.md
│
├── ecommerceSystem/                   # Core e-commerce platform
│   ├── model.dsl                      # System model and containers
│   └── workspace.dsl                  # Views and diagrams
│
├── fulfilmentSystem/                  # Order fulfillment and inventory
│   ├── model.dsl                      # System model and containers  
│   └── workspace.dsl                  # Views and diagrams
│
├── marketingSystem/                   # Marketing automation and campaigns
│   ├── model.dsl                      # System model and containers
│   └── workspace.dsl                  # Views and diagrams
│
├── supportSystem/                     # Customer support and service
│   ├── model.dsl                      # System model and containers
│   └── workspace.dsl                  # Views and diagrams
│
├── searchService/                     # Product search and discovery
│   ├── model.dsl                      # System model and containers
│   └── workspace.dsl                  # Views and diagrams
│
├── recommendationEngine/              # AI-powered recommendations
│   ├── model.dsl                      # System model and containers
│   └── workspace.dsl                  # Views and diagrams
│
└── .structurizr/                      # Structurizr workspace cache (auto-generated)
    ├── index/                         # Search index
    └── 1/images/                      # Generated diagram images
```

### Architecture Overview

This repository models a **distributed e-commerce platform** using a microservices architecture pattern. The system is organized into **six bounded contexts** (systems), each representing a distinct business capability:

#### 🛍️ **Core Business Systems**
- **`ecommerceSystem/`** - Customer-facing platform handling product catalog, orders, and payments
- **`fulfilmentSystem/`** - Order processing, inventory management, and shipping coordination
- **`marketingSystem/`** - Campaign management, customer segmentation, and marketing analytics

#### 🔧 **Supporting Systems** 
- **`supportSystem/`** - Customer service, ticketing, knowledge base, and live chat
- **`searchService/`** - Advanced product search, filtering, and discovery capabilities
- **`recommendationEngine/`** - AI-powered personalized product recommendations

### File Structure Explained

#### **Root Level Files**
- **`workspace.dsl`** - Main workspace definition containing:
  - Global people definitions (Customer, Admin, etc.)
  - External system definitions (Payment Provider, Email Service, etc.)
  - System includes and workspace configuration
- **`styles.dsl`** - Shared styling for consistent diagram appearance across all systems
- **`workspace.json`** - Auto-generated Structurizr workspace file (don't edit manually)

#### **System Folders**
Each system folder follows a consistent pattern:

- **`model.dsl`** - Contains the system definition including:
  - Container definitions (microservices, databases, infrastructure)
  - Relationships between containers
  - Integration points with other systems
  - System-specific people (if any)

- **`workspace.dsl`** - Contains view definitions including:
  - System Context diagrams
  - Container diagrams  
  - Component diagrams (where applicable)
  - Custom styling imports

#### Documentation

- `docs/architecture-decision-records/` - ADRs documenting key architectural decisions

## Viewing with Structurizr Lite

Render and view the diagram with Structurizr Lite, a free version of Structurizr, packaged as a Docker container, and designed for developers who want to quickly author and/or view software architecture diagrams, documentation, and architecture decision records (ADRs).

If you don't have docker/podman installed, I would suggest installing podman with Homebrew:

```shell
brew install podman
```

Then run a container with the structurizr/lite image, exposing port 8080 to the host and mapping the directory containing your workspace.dsl file to the container's `/usr/local/structurizr` directory.

```shell
podman run -it --rm -p 8080:8080 -v /Users/glen.thomas/Mapping-Distributed-Systems-with-C4-Diagrams-and-Structurizr-DSL:/usr/local/structurizr structurizr/lite
```

Load the Structurizr light web page in your browser (http://localhost:8080) and see the diagram rendered in the UI with automatic layout.

To load one of the individual software systems add the STRUCTURIZR_WORKSPACE_PATH environment variable with the directory that you would like to view:

```shell
podman run -it --rm -p 8080:8080 -v /Users/glen.thomas/Mapping-Distributed-Systems-with-C4-Diagrams-and-Structurizr-DSL:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=ecommerceSystem structurizr/lite
```
