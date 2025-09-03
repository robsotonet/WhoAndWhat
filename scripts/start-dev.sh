#!/bin/bash

# WhoAndWhat Development Environment Startup Script
# This script starts the entire development environment using Docker Compose

echo "🚀 Starting WhoAndWhat Development Environment..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Error: Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if docker-compose is available
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Error: docker-compose is not installed or not in PATH."
    exit 1
fi

# Stop any existing containers
echo "🛑 Stopping existing containers..."
docker-compose down

# Remove any orphaned containers
echo "🧹 Cleaning up orphaned containers..."
docker-compose down --remove-orphans

# Pull latest images
echo "📥 Pulling latest Docker images..."
docker-compose pull

# Build and start services
echo "🏗️  Building and starting services..."
docker-compose up --build -d

# Wait for services to be healthy
echo "⏳ Waiting for services to be ready..."
sleep 10

# Check service health
echo "🔍 Checking service health..."

# Check PostgreSQL
if docker-compose exec postgres pg_isready -U whoandwhat_user -d whoandwhat_dev > /dev/null 2>&1; then
    echo "✅ PostgreSQL is ready"
else
    echo "❌ PostgreSQL is not ready"
fi

# Check Redis
if docker-compose exec redis redis-cli ping > /dev/null 2>&1; then
    echo "✅ Redis is ready"
else
    echo "❌ Redis is not ready"
fi

# Check API health endpoint
if curl -f http://localhost:5000/health > /dev/null 2>&1; then
    echo "✅ API is ready"
else
    echo "❌ API is not ready"
fi

# Check Blazor app
if curl -f http://localhost:5001 > /dev/null 2>&1; then
    echo "✅ Blazor app is ready"
else
    echo "❌ Blazor app is not ready"
fi

echo ""
echo "🎉 Development environment is running!"
echo ""
echo "📋 Available services:"
echo "   🌐 Blazor Web App:  http://localhost:5001"
echo "   🔌 API:             http://localhost:5000"
echo "   🔌 API Health:      http://localhost:5000/health"
echo "   🗄️  PostgreSQL:     localhost:5432"
echo "   🔴 Redis:           localhost:6379"
echo ""
echo "📊 To view logs:"
echo "   docker-compose logs -f [service-name]"
echo ""
echo "🛑 To stop the environment:"
echo "   docker-compose down"
echo ""
echo "📖 For more commands, see: docker-compose --help"