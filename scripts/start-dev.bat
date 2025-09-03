@echo off
REM WhoAndWhat Development Environment Startup Script for Windows
REM This script starts the entire development environment using Docker Compose

echo 🚀 Starting WhoAndWhat Development Environment...

REM Check if Docker is running
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: Docker is not running. Please start Docker and try again.
    exit /b 1
)

REM Check if docker-compose is available
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: docker-compose is not installed or not in PATH.
    exit /b 1
)

REM Stop any existing containers
echo 🛑 Stopping existing containers...
docker-compose down

REM Remove any orphaned containers
echo 🧹 Cleaning up orphaned containers...
docker-compose down --remove-orphans

REM Pull latest images
echo 📥 Pulling latest Docker images...
docker-compose pull

REM Build and start services
echo 🏗️  Building and starting services...
docker-compose up --build -d

REM Wait for services to be healthy
echo ⏳ Waiting for services to be ready...
timeout /t 10 /nobreak >nul

REM Check service health
echo 🔍 Checking service health...

REM Check PostgreSQL
docker-compose exec postgres pg_isready -U whoandwhat_user -d whoandwhat_dev >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ PostgreSQL is ready
) else (
    echo ❌ PostgreSQL is not ready
)

REM Check Redis
docker-compose exec redis redis-cli ping >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Redis is ready
) else (
    echo ❌ Redis is not ready
)

REM Check API health endpoint (using curl if available, otherwise skip)
curl -f http://localhost:5000/health >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ API is ready
) else (
    echo ❌ API is not ready or curl not available
)

REM Check Blazor app (using curl if available, otherwise skip)
curl -f http://localhost:5001 >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Blazor app is ready
) else (
    echo ❌ Blazor app is not ready or curl not available
)

echo.
echo 🎉 Development environment is running!
echo.
echo 📋 Available services:
echo    🌐 Blazor Web App:  http://localhost:5001
echo    🔌 API:             http://localhost:5000
echo    🔌 API Health:      http://localhost:5000/health
echo    🗄️  PostgreSQL:     localhost:5432
echo    🔴 Redis:           localhost:6379
echo.
echo 📊 To view logs:
echo    docker-compose logs -f [service-name]
echo.
echo 🛑 To stop the environment:
echo    docker-compose down
echo.
echo 📖 For more commands, see: docker-compose --help

pause