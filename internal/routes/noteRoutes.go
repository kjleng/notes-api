package routes

import (
	"note-api/internal/handlers"

	"github.com/gofiber/fiber/v2"
)

func SetupNoteRoutes(router fiber.Router) {
	note := router.Group("/note")
	note.Get("/", handlers.GetNotes)
}
