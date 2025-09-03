-- PostgreSQL initialization script for WhoAndWhat database
-- Creates necessary extensions and initial setup

-- Enable UUID generation for unique identifiers
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Enable full-text search capabilities
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- Enable case-insensitive text comparisons
CREATE EXTENSION IF NOT EXISTS "citext";

-- Create schema for application data
CREATE SCHEMA IF NOT EXISTS whoandwhat;

-- Set default search path
ALTER DATABASE whoandwhat_dev SET search_path TO whoandwhat, public;

-- Create application user with appropriate permissions
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles 
      WHERE rolname = 'whoandwhat_app') THEN
      
      CREATE ROLE whoandwhat_app LOGIN PASSWORD 'app_password_456';
   END IF;
END
$$;

-- Grant permissions to application user
GRANT USAGE ON SCHEMA whoandwhat TO whoandwhat_app;
GRANT CREATE ON SCHEMA whoandwhat TO whoandwhat_app;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA whoandwhat TO whoandwhat_app;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA whoandwhat TO whoandwhat_app;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA whoandwhat TO whoandwhat_app;

-- Set default privileges for future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA whoandwhat GRANT ALL PRIVILEGES ON TABLES TO whoandwhat_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA whoandwhat GRANT ALL PRIVILEGES ON SEQUENCES TO whoandwhat_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA whoandwhat GRANT ALL PRIVILEGES ON FUNCTIONS TO whoandwhat_app;