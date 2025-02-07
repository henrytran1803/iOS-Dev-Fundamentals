package db

import (
	"TodoListBE/util"
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func createRandomTodo(t *testing.T, user User) Todo {

	arg := CreateTodoParams{
		UserID:      user.ID,
		Title:       util.RandomString(20),
		Description: sql.NullString{String: util.RandomString(100), Valid: true},
		Priority:    NullTodosPriority{TodosPriority: TodosPriorityHigh, Valid: true},
		Deadline:    sql.NullTime{Time: time.Now().Add(24 * time.Hour), Valid: true},
	}

	result, err := testQueries.CreateTodo(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, result)

	id, err := result.LastInsertId()
	require.NoError(t, err)
	require.NotZero(t, id)

	todo, err := testQueries.GetTodo(context.Background(), int32(id))
	require.NoError(t, err)
	require.NotEmpty(t, todo)

	require.Equal(t, arg.UserID, todo.UserID)
	require.Equal(t, arg.Title, todo.Title)
	require.Equal(t, arg.Description, todo.Description)
	require.Equal(t, arg.Priority, todo.Priority)
	require.Equal(t, arg.Deadline.Time.Day(), todo.Deadline.Time.Day())
	require.NotZero(t, todo.CreatedAt)

	return todo
}

func TestUpdateTodoStatus(t *testing.T) {
	user := createRandomUser(t)
	todo1 := createRandomTodo(t, user)

	arg := UpdateTodoStatusParams{
		ID:     todo1.ID,
		Status: sql.NullBool{Bool: true, Valid: true},
	}

	err := testQueries.UpdateTodoStatus(context.Background(), arg)
	require.NoError(t, err)

	todo2, err := testQueries.GetTodo(context.Background(), todo1.ID)
	require.NoError(t, err)
	require.NotEmpty(t, todo2)
	require.True(t, todo2.Status.Bool)
	require.True(t, todo2.Status.Valid)
}

func TestListTodosByStatus(t *testing.T) {
	user := createRandomUser(t)

	// Create and update 5 todos to completed status
	for i := 0; i < 5; i++ {
		todo := createRandomTodo(t, user)
		arg := UpdateTodoStatusParams{
			ID:     todo.ID,
			Status: sql.NullBool{Bool: true, Valid: true},
		}
		err := testQueries.UpdateTodoStatus(context.Background(), arg)
		require.NoError(t, err)
	}

	// Create 5 more todos with default false status
	for i := 0; i < 5; i++ {
		createRandomTodo(t, user)
	}

	// Test listing completed todos
	arg := ListTodosByStatusParams{
		UserID: user.ID,
		Status: sql.NullBool{Bool: true, Valid: true},
	}

	completedTodos, err := testQueries.ListTodosByStatus(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, completedTodos)

	for _, todo := range completedTodos {
		require.NotEmpty(t, todo)
		require.Equal(t, user.ID, todo.UserID)
		require.True(t, todo.Status.Bool)
		require.True(t, todo.Status.Valid)
	}

	// Test listing uncompleted todos
	arg.Status = sql.NullBool{Bool: false, Valid: true}
	uncompletedTodos, err := testQueries.ListTodosByStatus(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, uncompletedTodos)

	for _, todo := range uncompletedTodos {
		require.NotEmpty(t, todo)
		require.Equal(t, user.ID, todo.UserID)
		require.False(t, todo.Status.Bool)
		require.True(t, todo.Status.Valid)
	}
}
