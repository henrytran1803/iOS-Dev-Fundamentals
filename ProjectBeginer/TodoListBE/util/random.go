package util

import (
	"fmt"
	"math/rand"
	"strings"
	"time"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.Seed(time.Now().UnixNano())
}

// RandomInt generates a random integer between min and max
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

// RandomString generates a random string of length n
func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)

	for i := 0; i < n; i++ {
		c := alphabet[rand.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

// RandomUsername generates a random username
func RandomUsername() string {
	return RandomString(6)
}

// RandomEmail generates a random email
func RandomEmail() string {
	return fmt.Sprintf("%s@email.com", RandomString(6))
}

// RandomPassword generates a random password
func RandomPassword() string {
	return RandomString(12)
}

const (
	PriorityLow    = "low"
	PriorityMedium = "medium"
	PriorityHigh   = "high"
)

func RandomPriority() string {
	priorities := []string{PriorityLow, PriorityMedium, PriorityHigh}
	return priorities[rand.Intn(len(priorities))]
}

// RandomBool generates a random boolean
func RandomBool() bool {
	return rand.Intn(2) == 1
}
