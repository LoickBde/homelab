.PHONY: help install dev build clean docker-build docker-up docker-down lint

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
	@echo "  make dev             Run backend in watch mode (local)"
	@echo "  make build           Compile TypeScript → JavaScript"
	@echo "  make clean           Remove dist/ and node_modules/"
	@echo ""
	@echo "$(GREEN)Docker$(NC)"
	@echo "  make docker-build    Build Docker image"
	@echo "  make docker-up       Start services with docker-compose"
	@echo "  make docker-down     Stop services"
	@echo "  make docker-logs     View docker-compose logs"
	@echo ""
	@echo "$(GREEN)Utilities$(NC)"
	@echo "  make lint            Lint code (if eslint configured)"
	@echo "  make format          Format code (if prettier configured)"
	@echo ""

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Development
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
install:
	@echo "$(GREEN)→ Installing dependencies...$(NC)"
	cd backend && pnpm install

dev:
	@echo "$(GREEN)→ Starting backend in watch mode...$(NC)"
	cd backend && pnpm dev

build:
	@echo "$(GREEN)→ Building backend...$(NC)"
	cd backend && pnpm build

clean:
	@echo "$(GREEN)→ Cleaning built artifacts...$(NC)"
	rm -rf backend/dist
	rm -rf backend/node_modules
	docker system prune -f 2>/dev/null || true

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