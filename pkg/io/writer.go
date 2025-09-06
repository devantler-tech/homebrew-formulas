package io

import (
	"fmt"
	"os"
)

// Writer provides functionality for writing data to files
type Writer struct {
	filename string
}

// NewWriter creates a new Writer instance
func NewWriter(filename string) *Writer {
	return &Writer{
		filename: filename,
	}
}

// WriteData writes the provided data to a file
func (w *Writer) WriteData(data []byte) error {
	// Create or open file for writing
	file, err := os.Create(w.filename)
	if err != nil {
		return fmt.Errorf("failed to create file %s: %w", w.filename, err)
	}

	// Write data to file
	_, err = file.Write(data)
	if err != nil {
		// Ensure file is closed even if write fails, but ignore close error
		// since we're already returning a write error
		_ = file.Close()
		return fmt.Errorf("failed to write data to file %s: %w", w.filename, err)
	}

	// Properly check the error return value of file.Close()
	if err := file.Close(); err != nil {
		return fmt.Errorf("failed to close file %s: %w", w.filename, err)
	}

	return nil
}

// WriteString writes a string to the file
func (w *Writer) WriteString(content string) error {
	return w.WriteData([]byte(content))
}