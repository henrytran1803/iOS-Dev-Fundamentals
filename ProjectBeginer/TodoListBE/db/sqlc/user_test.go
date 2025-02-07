package db

import (
	"TodoListBE/util"
	"context"
	"database/sql"
	"testing"

	"github.com/stretchr/testify/require"
)

func createRandomUser(t *testing.T) User {
	arg := CreateUserParams{
		Username: util.RandomUsername(),
		Email:    util.RandomEmail(),
		Password: util.RandomPassword(),
	}

	result, err := testQueries.CreateUser(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, result)

	id, err := result.LastInsertId()
	require.NoError(t, err)
	require.NotZero(t, id)

	user, err := testQueries.GetUser(context.Background(), int32(id))
	require.NoError(t, err)
	require.NotEmpty(t, user)

	require.Equal(t, arg.Username, user.Username)
	require.Equal(t, arg.Email, user.Email)
	require.Equal(t, arg.Password, user.Password)
	require.NotZero(t, user.CreatedAt)

	return user
}

func TestCreateUser(t *testing.T) {
	createRandomUser(t)
}

func TestGetUser(t *testing.T) {
	user1 := createRandomUser(t)
	user2, err := testQueries.GetUser(context.Background(), user1.ID)
	require.NoError(t, err)
	require.NotEmpty(t, user2)

	require.Equal(t, user1.ID, user2.ID)
	require.Equal(t, user1.Username, user2.Username)
	require.Equal(t, user1.Email, user2.Email)
	require.Equal(t, user1.Password, user2.Password)
	require.Equal(t, user1.CreatedAt, user2.CreatedAt)
}

func TestGetUserByEmail(t *testing.T) {
	user1 := createRandomUser(t)
	user2, err := testQueries.GetUserByEmail(context.Background(), user1.Email)
	require.NoError(t, err)
	require.NotEmpty(t, user2)

	require.Equal(t, user1.ID, user2.ID)
	require.Equal(t, user1.Username, user2.Username)
	require.Equal(t, user1.Email, user2.Email)
	require.Equal(t, user1.Password, user2.Password)
	require.Equal(t, user1.CreatedAt, user2.CreatedAt)
}

func TestListUsers(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomUser(t)
	}

	users, err := testQueries.ListUsers(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, users)

	for _, user := range users {
		require.NotEmpty(t, user)
		require.NotZero(t, user.ID)
		require.NotEmpty(t, user.Username)
		require.NotEmpty(t, user.Email)
		require.NotEmpty(t, user.Password)
		require.NotZero(t, user.CreatedAt)
	}
}

func TestUpdateUser(t *testing.T) {
	user1 := createRandomUser(t)

	arg := UpdateUserParams{
		ID:       user1.ID,
		Username: util.RandomUsername(),
		Email:    util.RandomEmail(),
	}

	err := testQueries.UpdateUser(context.Background(), arg)
	require.NoError(t, err)

	user2, err := testQueries.GetUser(context.Background(), user1.ID)
	require.NoError(t, err)
	require.NotEmpty(t, user2)

	require.Equal(t, user1.ID, user2.ID)
	require.Equal(t, arg.Username, user2.Username)
	require.Equal(t, arg.Email, user2.Email)
	require.Equal(t, user1.Password, user2.Password)
	require.Equal(t, user1.CreatedAt, user2.CreatedAt)
}

func TestDeleteUser(t *testing.T) {
	user1 := createRandomUser(t)
	err := testQueries.DeleteUser(context.Background(), user1.ID)
	require.NoError(t, err)

	user2, err := testQueries.GetUser(context.Background(), user1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, user2)
}
