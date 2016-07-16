-- This patch is only for Season 6 EP3
USE MuOnline
ALTER TABLE [Character] ALTER COLUMN Inventory BINARY(3776)
ALTER TABLE [Character] ADD [ExtInventory] TINYINT NOT NULL DEFAULT 0
ALTER TABLE [Character] ADD [S6EP3_PS_FIX] TINYINT NOT NULL DEFAULT 0
GO
UPDATE [Character] SET S6EP3_PS_FIX = 0
