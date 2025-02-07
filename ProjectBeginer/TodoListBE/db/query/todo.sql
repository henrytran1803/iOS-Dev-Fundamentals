-- name: CreateTodo :execresult
INSERT INTO todos (
    user_id, title, description, priority, deadline
) VALUES (
             ?, ?, ?, ?, ?
         );

-- name: GetTodo :one
SELECT * FROM todos
WHERE id = ? LIMIT 1;

-- name: ListTodos :many
SELECT * FROM todos
ORDER BY created_at DESC;

-- name: ListTodosByUser :many
SELECT * FROM todos
WHERE user_id = ?
ORDER BY created_at DESC;

-- name: ListTodosByStatus :many
SELECT * FROM todos
WHERE user_id = ? AND status = ?
ORDER BY created_at DESC;

-- name: ListTodosByPriority :many
SELECT * FROM todos
WHERE user_id = ? AND priority = ?
ORDER BY created_at DESC;

-- name: UpdateTodo :exec
UPDATE todos
SET
    title = ?,
    description = ?,
    priority = ?,
    deadline = ?
WHERE id = ?;

-- name: UpdateTodoStatus :exec
UPDATE todos
SET status = ?
WHERE id = ?;

-- name: DeleteTodo :exec
DELETE FROM todos
WHERE id = ?;

-- name: DeleteUserTodos :exec
DELETE FROM todos
WHERE user_id = ?;