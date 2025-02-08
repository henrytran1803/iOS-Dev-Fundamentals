package main

import (
	"TodoListBE/api"
	db "TodoListBE/db/sqlc"
	"database/sql"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	dbConn, err := sql.Open("mysql", "root:18032002@tcp(mysql:3306)/todolist?parseTime=true")
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	store := db.NewStore(dbConn)
	router := api.SetupRouter(store)

	err = router.Run(":8080")
	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}
