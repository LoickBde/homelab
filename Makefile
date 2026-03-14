.PHONY: help install dev build clean test test-e2e lint format docker-build docker-up docker-down docker-logs

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
NC := \033[0m

help:
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(BLUE)  Homelab — Makefile Commands$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo ""
	@echo "$(GREEN)Development$(NC)"
	@echo "  make help            Show this help message"
	@echo "  make install         Install all dependencies"
	@echo "  make dev             Run backend in watch mode"
	@echo "  make build           Compile TypeScript → JavaScript"
	@echo "  make clean           Remove dist/ and node_modules/"
	@echo ""
	@echo "$(GREEN)Tests$(NC)"
	@echo "  make test            Run unit tests"
	@echo "  make test-e2e        Run e2e tests"
	@echo ""
	@echo "$(GREEN)Docker$(NC)"
	@echo "  make docker-build    Build Docker image"
	@echo "  make docker-up       Start services with docker-compose"
	@echo "  make docker-down     Stop services"
	@echo "  make docker-logs     View docker-compose logs"
	@echo ""
	@echo "$(GREEN)Quality$(NC)"
	@echo "  make lint            Lint code (ESLint)"
	@echo "  make format          Format code (Prettier)"
	@echo ""

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Development
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
install:
	@echo "$(GREEN)→ Installing dependencies...$(NC)"
	cd backend && pnpm install

dev:
	@echo "$(GREEN)→ Starting backend in watch mode...$(NC)"
	cd backend && pnpm run start:dev

build:
	@echo "$(GREEN)→ Building backend...$(NC)"
	cd backend && pnpm build

clean:
	@echo "$(GREEN)→ Cleaning built artifacts...$(NC)"
	rm -rf backend/dist
	rm -rf backend/node_modules

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Tests
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
test:
	@echo "$(GREEN)→ Running unit tests...$(NC)"
	cd backend && pnpm test

test-e2e:
	@echo "$(GREEN)→ Running e2e tests...$(NC)"
	cd backend && pnpm run test:e2e

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Quality
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
lint:
	@echo "$(GREEN)→ Linting code...$(NC)"
	cd backend && pnpm lint

format:
	@echo "$(GREEN)→ Formatting code...$(NC)"
	cd backend && pnpm format

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Docker
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
docker-build:
	@echo "$(GREEN)→ Building Docker image...$(NC)"
	docker compose build

docker-up:
	@echo "$(GREEN)→ Starting services...$(NC)"
	docker compose up -d

docker-down:
	@echo "$(GREEN)→ Stopping services...$(NC)"
	docker compose down

docker-logs:
	@echo "$(GREEN)→ Following logs...$(NC)"
	docker compose logs -f

docker-clean:
	@echo "$(GREEN)→ Pruning Docker...$(NC)"
	docker system prune -f 2>/dev/null || true