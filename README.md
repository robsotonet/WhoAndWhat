# WhoAndWhat - Smart Task Management

Smart Task Management with Social & AI Integration - A bilingual platform for individuals and small teams.

## Quick Start

### Prerequisites
- [.NET 9.0 SDK](https://dotnet.microsoft.com/download/dotnet/9.0)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)

### Development Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd WhoAndWhat
   ```

2. **Start development environment**
   ```bash
   # Windows
   scripts\start-dev.bat
   
   # Linux/Mac
   chmod +x scripts/start-dev.sh
   ./scripts/start-dev.sh
   ```

3. **Access the applications**
   - 🌐 **Blazor Web App**: http://localhost:5001
   - 🔌 **API**: http://localhost:5000
   - 🗄️ **PostgreSQL**: localhost:5432
   - 🔴 **Redis**: localhost:6379

### Manual Development Setup

1. **Build the solution**
   ```bash
   dotnet build
   ```

2. **Run tests**
   ```bash
   dotnet test
   ```

3. **Start services manually**
   ```bash
   # Start database and Redis
   docker-compose up postgres redis -d
   
   # Run API
   cd src/WhoAndWhat.API/WhoAndWhat.API
   dotnet run
   
   # Run Blazor app (in another terminal)
   cd src/WhoAndWhat.Blazor/WhoAndWhat.Blazor
   dotnet run
   ```

## Project Structure

```
WhoAndWhat/
├── src/                          # Source code
│   ├── WhoAndWhat.API/           # ASP.NET Core Web API
│   ├── WhoAndWhat.Blazor/        # Blazor Web Application
│   ├── WhoAndWhat.Core/          # Domain Models & Business Logic
│   ├── WhoAndWhat.Application/   # Application Services & DTOs
│   ├── WhoAndWhat.Infrastructure/# Data Access & External Services
│   └── WhoAndWhat.Shared/        # Shared Components & Utilities
├── tests/                        # Test projects
├── docker/                       # Docker configuration
├── scripts/                      # Development scripts
└── tasks/                        # Project planning and todos
```

## Development Commands

```bash
# Build entire solution
dotnet build

# Run all tests
dotnet test

# Run with hot reload
dotnet watch run --project src/WhoAndWhat.API/WhoAndWhat.API

# Database operations (when EF is configured)
dotnet ef migrations add InitialCreate --project src/WhoAndWhat.Infrastructure
dotnet ef database update --project src/WhoAndWhat.Infrastructure

# Docker operations
docker-compose up -d              # Start all services
docker-compose down               # Stop all services
docker-compose logs -f api        # View API logs
docker-compose restart api        # Restart API service
```

## Technology Stack

- **Backend**: ASP.NET Core 9.0, Entity Framework Core
- **Frontend**: Blazor Server
- **Database**: PostgreSQL 16
- **Cache/Messaging**: Redis 7
- **Testing**: xUnit, FluentAssertions, Moq
- **Quality**: SonarAnalyzer
- **Containerization**: Docker & Docker Compose

## Contributing

1. Follow Clean Architecture principles
2. Maintain 80%+ test coverage
3. Use conventional commits
4. Update documentation as needed

## Project Status

**Current Phase**: Development Environment Setup ✅  
**Next Phase**: Core Domain & Architecture

See [tasks/todo.md](tasks/todo.md) for detailed roadmap.
