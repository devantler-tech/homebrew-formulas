package io

import (
	"os"
	"testing"
)

func TestWriter_WriteData(t *testing.T) {
	// Create a temporary file for testing
	tmpfile := "/tmp/test_writer.txt"
	defer os.Remove(tmpfile)

	// Create writer and write test data
	writer := NewWriter(tmpfile)
	testData := []byte("Hello, World!")

	err := writer.WriteData(testData)
	if err != nil {
		t.Fatalf("WriteData failed: %v", err)
	}

	// Verify file was created and contains correct data
	content, err := os.ReadFile(tmpfile)
	if err != nil {
		t.Fatalf("Failed to read test file: %v", err)
	}

	if string(content) != string(testData) {
		t.Errorf("Expected %q, got %q", string(testData), string(content))
	}
}

func TestWriter_WriteString(t *testing.T) {
	// Create a temporary file for testing
	tmpfile := "/tmp/test_writer_string.txt"
	defer os.Remove(tmpfile)

	// Create writer and write test string
	writer := NewWriter(tmpfile)
	testString := "Test string content"

	err := writer.WriteString(testString)
	if err != nil {
		t.Fatalf("WriteString failed: %v", err)
	}

	// Verify file was created and contains correct data
	content, err := os.ReadFile(tmpfile)
	if err != nil {
		t.Fatalf("Failed to read test file: %v", err)
	}

	if string(content) != testString {
		t.Errorf("Expected %q, got %q", testString, string(content))
	}
}