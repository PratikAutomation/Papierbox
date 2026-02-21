/*
  # Add title column to documents table

  1. Changes
    - Add `title` column to `documents` table to store display name with AI summary
    - Set default value for existing records

  2. Notes
    - This allows storing both original filename and AI-generated summary
    - Existing documents will get a default title based on filename
*/

-- Add title column to documents table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'documents' AND column_name = 'title'
  ) THEN
    ALTER TABLE documents ADD COLUMN title text;
    
    -- Update existing records to use filename as title
    UPDATE documents SET title = filename WHERE title IS NULL;
    
    -- Make title required for new records
    ALTER TABLE documents ALTER COLUMN title SET NOT NULL;
  END IF;
END $$;