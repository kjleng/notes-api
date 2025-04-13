package handlers

import (
	"note-api/database"
	"note-api/internal/model"

	"github.com/gofiber/fiber/v2"
)

func GetNotes(c *fiber.Ctx) error {
	db := database.DB
	var notes []model.Note

	// find all notes in the database
	db.Find(&notes)

	// If no note is present return an error
	if len(notes) == 0 {
		return c.Status(404).JSON(fiber.Map{"status": "error", "message": "No notes present", "data": nil})
	}

	// Else return notes
	return c.JSON(fiber.Map{"status": "success", "message": "Notes Found", "data": notes})
}
