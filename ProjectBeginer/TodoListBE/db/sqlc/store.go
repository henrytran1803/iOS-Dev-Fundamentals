package db

import (
	"context"
	"database/sql"
	"fmt"
)

// Store provides all functions to execute db queries and transactions
type Store interface {
	Querier
	CreateTodoTx(ctx context.Context, arg CreateTodoTxParams) (CreateTodoTxResult, error)
	DeleteUserTx(ctx context.Context, userID int64) error
}

// SQLStore provides all functions to execute SQL queries and transactions
type SQLStore struct {
	db *sql.DB
	*Queries
}

// NewStore creates a new store
func NewStore(db *sql.DB) Store {
	queries := New(db)
	return &SQLStore{
		db:      db,
		Queries: queries,
	}
}

// execTx executes a function within a database transaction
func (store *SQLStore) execTx(ctx context.Context, fn func(*Queries) error) error {
	tx, err := store.db.BeginTx(ctx, nil)
	if err != nil {
		return err
	}

	q := New(tx)
	err = fn(q)
	if err != nil {
		if rbErr := tx.Rollback(); rbErr != nil {
			return fmt.Errorf("tx err: %v, rb err: %v", err, rbErr)
		}
		return err
	}

	return tx.Commit()
}

// CreateTodoTxParams contains the input parameters of the transfer transaction
type CreateTodoTxParams struct {
	UserID      int64          `json:"user_id"`
	Title       string         `json:"title"`
	Description sql.NullString `json:"description"`
	Priority    string         `json:"priority"`
	Deadline    sql.NullTime   `json:"deadline"`
	Status      sql.NullBool   `json:"status"`
}

// CreateTodoTxResult is the result of the transfer transaction
type CreateTodoTxResult struct {
	Todo Todo `json:"todo"`
	User User `json:"user"`
}

// CreateTodoTx performs a money transfer from one account to the other
func (store *SQLStore) CreateTodoTx(ctx context.Context, arg CreateTodoTxParams) (CreateTodoTxResult, error) {
	var result CreateTodoTxResult

	err := store.execTx(ctx, func(q *Queries) error {
		var err error

		// 1. Get user
		user, err := q.GetUser(ctx, int32(arg.UserID))
		if err != nil {
			return err
		}

		// 2. Create todo
		todoArg := CreateTodoParams{
			UserID:      int32(arg.UserID),
			Title:       arg.Title,
			Description: arg.Description,
			Priority:    arg.Priority,
			Deadline:    arg.Deadline,
		}

		todoResult, err := q.CreateTodo(ctx, todoArg)
		if err != nil {
			return err
		}

		id, err := todoResult.LastInsertId()
		if err != nil {
			return err
		}

		todo, err := q.GetTodo(ctx, int32(id))
		if err != nil {
			return err
		}

		result.Todo = todo
		result.User = user
		return nil
	})

	return result, err
}

// DeleteUserTx deletes a user and all their todos
func (store *SQLStore) DeleteUserTx(ctx context.Context, userID int64) error {
	return store.execTx(ctx, func(q *Queries) error {
		// 1. Delete all todos for this user
		err := q.DeleteTodosByUser(ctx, int32(userID))
		if err != nil {
			return err
		}

		// 2. Delete the user
		err = q.DeleteUser(ctx, int32(userID))
		if err != nil {
			return err
		}

		return nil
	})
}
