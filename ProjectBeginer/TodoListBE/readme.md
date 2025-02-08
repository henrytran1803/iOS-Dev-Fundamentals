# TodoList API 

## Prerequisites
- Docker
- Docker Compose
- Make

## Quick Start

1. Clone project
```bash
git clone <repository-url>
cd TodoListBE
```

2. Run project with Docker
```bash
# Build and start all containers
make docker

# Check if containers are running
docker ps

# Should see 2 containers:
# - todolistbe-api-1
# - mysql_todolist
```

3. Run database migrations
```bash
make migrateup
```

4. The API is now ready at:
```
http://localhost:8080
```

## Docker Commands

### Start Services
```bash
# Start all services
make docker

# Start individual service
docker-compose up api
docker-compose up mysql
```

### Stop Services
```bash
# Stop all
make docker-down
# or
docker-compose down

# Stop individual service
docker-compose stop api
docker-compose stop mysql
```

### View Logs
```bash
# API logs
docker logs -f todolistbe-api-1

# MySQL logs
docker logs -f mysql_todolist
```

### Database Management
```bash
# Create database
make createdb

# Drop database
make dropdb

# Run migrations
make migrateup

# Rollback migrations
make migratedown
```

## Database Connection Info
```
Host: localhost
Port: 3000
Username: root
Password: 18032002
Database: todolist
```

## Container Details

### API Container
- Port: 8080
- Environment variables:
    - DB_SOURCE=root:18032002@tcp(mysql:3306)/todolist?parseTime=true

### MySQL Container
- Port: 3000 (mapped to 3306)
- Environment variables:
    - MYSQL_ROOT_PASSWORD=18032002
    - MYSQL_DATABASE=todolist
- Volume: mysql_data

## Troubleshooting

1. If containers fail to start:
```bash
# Remove containers and volumes
docker-compose down -v

# Rebuild without cache
docker-compose build --no-cache

# Start again
make docker
```

2. If database connection fails:
```bash
# Check MySQL is running
docker ps | grep mysql

# Check MySQL logs
docker logs mysql_todolist

# Try reconnecting
docker-compose restart api
```

3. If migrations fail:
```bash
# Check migration status
migrate -path db/migration -database "mysql://root:18032002@tcp(localhost:3000)/todolist?parseTime=true" version

# Force migration version
migrate -path db/migration -database "mysql://root:18032002@tcp(localhost:3000)/todolist?parseTime=true" force VERSION
```

## Development Notes

- Changes to Go code require rebuilding the API container:
```bash
docker-compose up -d --build api
```

- Changes to SQL queries require regenerating SQLC code:
```bash
make sqlc
```

- New migrations should follow the naming convention:
```
{version}_{description}.up.sql
{version}_{description}.down.sql
```

For more details about the API endpoints, please refer to the [API Documentation](API.md).