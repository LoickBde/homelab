# 🏠🧪 Homelab

A centralized project to manage the services and tools of my homelab.

## 📋 Architecture

```
homelab/
├── backend/          # Express API + TypeScript
│   ├── src/
│   ├── dist/
│   ├── Dockerfile
│   └── tsconfig.json
├── docker-compose
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
# Build and start services
make docker-up

# View logs
make docker-logs

# Stop services
make docker-down
```

## 📄 Configuration

Create a `.env` file at the root (see `.env.example`):

```env
BACKEND_PORT=3000
```

All environment variables are available in Docker services and for local development.

## 🛠️ Available Commands

View all shortcuts:

```bash
make help
```

## 📦 Tech Stack

### Backend

- **Runtime** : Node.js 24.13 (Alpine in Docker)
- **Framework** : Express 5.x
- **Language** : TypeScript 5.9+
- **Package Manager** : pnpm 10.28+
- **Build** : tsc (native compilation)
- **Dev Server** : tsx (watch mode)

## 📝 Development

### Compile and Test Locally

```bash
# Check TypeScript errors (without generating dist/)
cd backend && pnpm tsc --noEmit

# Compile and generate dist/
make build

# Run compiled JavaScript
node backend/dist/index.js
```

### Adding a New Service

1. Create a folder at the root (e.g., `frontend/`, `database/`)
2. Add appropriate scripts in its `package.json`
3. Create a `Dockerfile` (if needed)
4. Add a service in `docker-compose.yml`

## 🐳 Docker

### Multi-stage Build

The [Dockerfile](backend/Dockerfile) uses a **multi-stage build** to optimize image size:

1. **Builder** : compiles TS, installs all dependencies
2. **Runner** : lightweight final image with only compiled JS

### Optimized Image

- Base : `node:24.13-alpine`
- No TypeScript in final image
- Environment variables loaded from `.env` via docker-compose
