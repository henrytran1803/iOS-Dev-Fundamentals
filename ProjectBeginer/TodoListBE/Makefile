mysql:
	docker run --name mysql_todolist \
	-e MYSQL_ROOT_PASSWORD=18032002 \
	-e MYSQL_DATABASE=todolist \
	-p 3000:3306 \
	-v mysql_data:/var/lib/mysql \
	-d mysql:latest

createdb:
	docker exec -it mysql_todolist mysql -uroot -p18032002 -e "CREATE DATABASE IF NOT EXISTS todolist;"

dropdb:
	docker exec -it mysql_todolist mysql -uroot -p18032002 -e "DROP DATABASE IF EXISTS todolist;"

migrateup:
	migrate -path db/migration -database "mysql://root:18032002@tcp(localhost:3000)/todolist?parseTime=true" -verbose up

migratedown:
	migrate -path db/migration -database "mysql://root:18032002@tcp(localhost:3000)/todolist?parseTime=true" -verbose down
sqlc:
	sqlc generate
.PHONY: mysql createdb dropdb migrateup migratedown