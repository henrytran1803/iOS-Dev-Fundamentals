package api

import (
	db "TodoListBE/db/sqlc"
	"TodoListBE/handler"
	"github.com/gin-gonic/gin"
)

func SetupRouter(store db.Store) *gin.Engine {
	router := gin.Default()

	userHandler := handler.NewUserHandler(store)
	todoHandler := handler.NewTodoHandler(store)

	// User routes
	users := router.Group("/users")
	{
		users.POST("/", userHandler.CreateUser)
		users.GET("/:id", userHandler.GetUser)
		users.GET("/", userHandler.ListUsers)
		users.DELETE("/:id", userHandler.DeleteUser)
	}

	// Todo routes
	todos := router.Group("/todos")
	{
		todos.POST("/", todoHandler.CreateTodo)
		todos.GET("/:id", todoHandler.GetTodo)
		todos.GET("/user/:user_id", todoHandler.ListTodosByUser)
		todos.PATCH("/:id/status", todoHandler.UpdateTodoStatus)
		todos.DELETE("/:id", todoHandler.DeleteTodo)
	}

	return router
}
