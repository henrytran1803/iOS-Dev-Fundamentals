package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/go-sql-driver/mysql"
)

var testQueries *Queries
var testDB *sql.DB

const (
	dbDriver = "mysql"
	dbSource = "root:18032002@tcp(localhost:3000)/todolist?parseTime=true"
)

func TestMain(m *testing.M) {
	var err error
	testDB, err = sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	// Test connection
	err = testDB.Ping()
	if err != nil {
		log.Fatal("cannot ping db:", err)
	}

	testQueries = New(testDB)

	os.Exit(m.Run())
}
