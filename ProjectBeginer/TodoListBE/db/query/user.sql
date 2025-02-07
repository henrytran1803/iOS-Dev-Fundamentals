-- name: CreateUser :execresult
INSERT INTO users (
    username, email, password
) VALUES (
             ?, ?, ?
         );

-- name: GetUser :one
SELECT * FROM users
WHERE id = ? LIMIT 1;

-- name: GetUserByEmail :one
SELECT * FROM users
WHERE email = ? LIMIT 1;

-- name: ListUsers :many
SELECT * FROM users
ORDER BY id;

-- name: UpdateUser :exec
UPDATE users
SET
    username = ?,
    email = ?
WHERE id = ?;

-- name: UpdateUserPassword :exec
UPDATE users
SET password = ?
WHERE id = ?;

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = ?;