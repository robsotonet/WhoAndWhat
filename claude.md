# WhoAndWhat - Smart Task Management with Social & AI Integration

## Project Overview

**WhoAndWhat** is a bilingual (English/Spanish), AI-powered task management platform designed for individuals and small teams. The application combines productivity tools with social connectivity and intelligent planning features.

### Core Value Proposition
- Manage tasks, ideas, appointments, projects, and shared responsibilities
- AI-powered scheduling and planning assistance
- Social connectivity through contact linking and collaboration
- Bilingual support with seamless language switching
- Cross-platform availability (Web, Desktop, Mobile)

## Architecture & Technology Stack

### Platform Strategy
- **Backend**: ASP.NET Core 9.0 Web API
- **Web/Desktop Frontend**: Blazor
- **Mobile**: .NET MAUI
- **Database**: PostgreSQL
- **Real-time Communication**: SignalR
- **Containerization**: Docker (local development)
- **Cloud Platform**: Azure (production deployment)

### Authentication & Security
- JWT with OAuth 2.0 (Google, Facebook, Apple, Email/Password)
- Encryption at rest and in transit
- PII data handling compliance
- Azure Key Vault for API key management
- Audit logging for sensitive operations

### Code Standards
- Clean Architecture principles
- SOLID principles adherence
- Async/await for all I/O operations
- DTOs for data transfer
- Unit test coverage 80%+
- Comprehensive error handling and logging

## Feature Set - Version 1.0

### Core Features
- [x] **Sign Up & Onboarding**
  - Account creation with language preference (EN/ES)
  - Interactive tutorial for categories, AI features, and contacts
  
- [ ] **Task Management**
  - Create and organize tasks by categories: To-Dos, Ideas, Appointments, Bill Reminders, Projects
  - Task details: due dates, notes, priority levels
  - Convert tasks to projects with subtasks
  
- [ ] **Contact Integration**
  - Add contacts via QR code or unique invite code
  - Link tasks/appointments to contacts
  - Shared visibility and collaboration features
  
- [ ] **Dashboard & Analytics**
  - Task completion rate tracking
  - Productivity streaks
  - Overdue task alerts
  - Motivational banner with quotes/images
  
- [ ] **AI-Powered Planning**
  - "Let AI Plan My Day" feature
  - Smart scheduling with prioritized tasks
  - Suggested time blocks and breaks
  - Learning-based improvements
  
- [ ] **Calendar Integration**
  - Day/week/month view
  - Task and appointment visualization
  - Calendar sync capabilities
  
- [ ] **Event Discovery**
  - Browse public events (conferences, concerts, etc.)
  - Location and interest-based suggestions
  - Event integration with personal calendar
  
- [ ] **Customization**
  - Notification preferences
  - Theme options
  - Language switching
  - Reminder settings

## Project Structure

```
WhoAndWhat/
├── src/
│   ├── WhoAndWhat.API/              # ASP.NET Core Web API
│   ├── WhoAndWhat.Blazor/           # Blazor Web/Desktop App
│   ├── WhoAndWhat.MAUI/             # .NET MAUI Mobile App
│   ├── WhoAndWhat.Core/             # Domain Models & Business Logic
│   ├── WhoAndWhat.Application/      # Application Services & DTOs
│   ├── WhoAndWhat.Infrastructure/   # Data Access & External Services
│   └── WhoAndWhat.Shared/           # Shared Components & Utilities
├── tests/
│   ├── WhoAndWhat.UnitTests/
│   ├── WhoAndWhat.IntegrationTests/
│   └── WhoAndWhat.E2ETests/
├── docker/
│   ├── Dockerfile.api
│   ├── Dockerfile.blazor
│   └── docker-compose.yml
├── docs/
│   ├── api-documentation/
│   ├── architecture-decisions/
│   └── user-guides/
└── scripts/
    ├── setup-dev-environment.sh
    └── deploy-to-azure.sh
```

## Current Progress

### Completed Tasks
- [x] Project requirements analysis
- [x] Technology stack definition
- [x] Architecture planning
- [x] Design system documentation

### In Progress
- [ ] Project structure setup
- [ ] Docker development environment configuration
- [ ] Database schema design
- [ ] Core domain models definition

### Next Sprint Tasks
1. **Development Environment Setup**
   - [ ] Initialize solution structure
   - [ ] Configure Docker development environment
   - [ ] Set up PostgreSQL database
   - [ ] Configure CI/CD pipeline basics

2. **Core Domain Implementation**
   - [ ] Define domain entities (User, Task, Contact, Project, etc.)
   - [ ] Implement repository patterns
   - [ ] Create basic DTOs
   - [ ] Set up unit testing framework

3. **Authentication & Security Foundation**
   - [ ] Implement JWT authentication
   - [ ] Configure OAuth 2.0 providers
   - [ ] Set up Azure Key Vault integration
   - [ ] Implement basic authorization policies

## Daily Workflow Example

1. **User opens app** → View personalized dashboard
2. **Check motivational content** → Daily inspiration and metrics
3. **Review calendar** → Day/week overview with AI planning option
4. **Task management** → Add, edit, prioritize tasks
5. **Contact collaboration** → Link contacts to appointments/tasks
6. **Progress tracking** → Mark completed tasks and view analytics

## Development Workflow

### Standard Process
1. **Task Planning**
   - Review requirements and acceptance criteria
   - Create technical specifications
   - Estimate effort and dependencies

2. **Implementation**
   - Follow Clean Architecture principles
   - Write unit tests first (TDD approach)
   - Implement feature with proper error handling
   - Ensure 80%+ test coverage

3. **Code Review**
   - Peer review for code quality
   - Architecture compliance check
   - Security review for sensitive features
   - Performance considerations

4. **Testing & Deployment**
   - Run full test suite
   - Integration testing
   - Docker containerization
   - Azure deployment (production)

### Quality Gates
- **Code Coverage**: Minimum 80% unit test coverage
- **Code Review**: All changes require peer review
- **Security**: PII compliance and security scanning
- **Performance**: Response time and resource monitoring
- **Documentation**: Keep claude.md updated with progress

## Monitoring & Observability

### Key Metrics
- **Performance**: Response times, throughput, error rates
- **User Engagement**: Task completion rates, feature usage
- **System Health**: Database performance, resource utilization
- **Business Metrics**: User retention, productivity improvements

### Alerting
- API response time > 2 seconds
- Error rate > 5%
- Database connection issues
- High memory/CPU utilization

## Notes & Decisions

### Architecture Decisions
- **Clean Architecture**: Chosen for maintainability and testability
- **SignalR**: Real-time updates for collaborative features
- **PostgreSQL**: Robust relational database with JSON support
- **Azure**: Cloud-first deployment strategy

### Design Considerations
- **Bilingual Support**: Built-in from the start, not retrofitted
- **Mobile-First**: Responsive design with MAUI for native experience
- **AI Integration**: Extensible architecture for future AI enhancements
- **Social Features**: Privacy-conscious contact linking and sharing

---

**Last Updated**: [Current Date]  
**Version**: 1.0.0-dev  
**Status**: Planning & Setup Phase