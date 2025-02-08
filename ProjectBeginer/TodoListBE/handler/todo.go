package handler

import (
	db "TodoListBE/db/sqlc"
	"database/sql"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

type TodoHandler struct {
	store db.Store
}

func NewTodoHandler(store db.Store) *TodoHandler {
	return &TodoHandler{store: store}
}

type createTodoRequest struct {
	UserID      int64     `json:"user_id" binding:"required"`
	Title       string    `json:"title" binding:"required"`
	Description string    `json:"description"`
	Priority    string    `json:"priority" binding:"required,oneof=low medium high"`
	Deadline    time.Time `json:"deadline"`
}

// CreateTodo tạo todo mới
func (h *TodoHandler) CreateTodo(c *gin.Context) {
	var req createTodoRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	arg := db.CreateTodoTxParams{
		UserID:      req.UserID,
		Title:       req.Title,
		Description: sql.NullString{String: req.Description, Valid: true},
		Priority:    req.Priority,
		Deadline:    sql.NullTime{Time: req.Deadline, Valid: true},
		Status:      sql.NullBool{Bool: false, Valid: true},
	}

	result, err := h.store.CreateTodoTx(c, arg)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, result)
}

// GetTodo lấy thông tin todo theo ID
func (h *TodoHandler) GetTodo(c *gin.Context) {
	id, err := strconv.ParseInt(c.Param("id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid id"})
		return
	}

	todo, err := h.store.GetTodo(c, int32(id))
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "todo not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, todo)
}

// ListTodosByUser lấy danh sách todos của một user
func (h *TodoHandler) ListTodosByUser(c *gin.Context) {
	userID, err := strconv.ParseInt(c.Param("user_id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid user id"})
		return
	}

	todos, err := h.store.ListTodosByUser(c, int32(userID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, todos)
}

// UpdateTodoStatus cập nhật trạng thái todo
func (h *TodoHandler) UpdateTodoStatus(c *gin.Context) {
	id, err := strconv.ParseInt(c.Param("id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid id"})
		return
	}

	var req struct {
		Status bool `json:"status"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	arg := db.UpdateTodoStatusParams{
		ID:     int32(id),
		Status: sql.NullBool{Bool: req.Status, Valid: true},
	}

	err = h.store.UpdateTodoStatus(c, arg)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "todo not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "todo status updated successfully"})
}

// DeleteTodo xóa todo
func (h *TodoHandler) DeleteTodo(c *gin.Context) {
	id, err := strconv.ParseInt(c.Param("id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid id"})
		return
	}

	err = h.store.DeleteTodo(c, int32(id))
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "todo not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "todo deleted successfully"})
}
