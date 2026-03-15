# 🏠🧪 Homelab

A centralized project to manage the services and tools of my homelab.

## 📋 Architecture

```
homelab/
├── backend/          # NestJS API + TypeScript
│   ├── src/
│   ├── dist/
│   ├── test/
│   ├── Dockerfile
│   ├── nest-cli.json
│   └── tsconfig.json
├── docker-compose.yml
├── .env              # Environment variables
├── .env.example      # Variables template
└── Makefile
```

## 🚀 Quick Start

### Prerequisites

- **Node.js** 24+
- **pnpm** 10.28+
- **Docker**

### Local Installation

```bash
# Install dependencies
make install

# Run backend in watch mode (development)
make dev
```

The server starts by default on `http://localhost:3000`.

### With Docker

```bash
# Start all services (backend + database)
make docker-up

# Start only the database (for local backend development)
make docker-db

# View logs
make docker-logs

# Stop services
make docker-down
```

## 📄 Configuration

Environment files live at the **repo root**.

**Local**: NestJS reads `.env` from the repo root via an absolute path.
**Docker**: docker-compose injects `.env` directly into the container — no files are copied into the image.

## 🛠️ Available Commands

View all shortcuts:

```bash
make help
```

## 📦 Tech Stack

### Backend

- **Runtime** : Node.js 24.13 (Alpine in Docker)
- **Framework** : NestJS 11.x
- **Language** : TypeScript 5.9+
- **Package Manager** : pnpm 10.28+
- **Build** : `nest build` (webpack)
- **Dev Server** : `nest start --watch`
- **Tests** : Jest + Supertest

## 📝 Development

### Build and Test Locally

```bash
# Run unit tests
make test

# Run e2e tests
make test-e2e

# Compile and generate dist/
make build

# Run compiled JavaScript
node backend/dist/main.js
```

### Adding a New Service

1. Create a folder at the root (e.g., `frontend/`, `database/`)
2. Add the necessary scripts in its `package.json`
3. Create a `Dockerfile` (if needed)
4. Add a service in `docker-compose.yml`

## 🐳 Docker

### Multi-stage Build

The [Dockerfile](backend/Dockerfile) uses a **multi-stage build** to optimize image size:

1. **Builder** : compiles TS, installs all dependencies
2. **Runner** : lightweight final image with only compiled JS
