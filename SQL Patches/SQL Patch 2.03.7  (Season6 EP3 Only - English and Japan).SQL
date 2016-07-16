-- This patch is only for Season 6 EP3 - Both English and Japan
USE MuOnline
DECLARE @cname nvarchar(32)
SELECT @cname=object_name(default_object_id)
FROM sys.columns
WHERE object_id = object_id('dbo.Character')
AND object_name(default_object_id) IS NOT NULL
AND name='S6EP3_PS_FIX'
EXEC('ALTER TABLE [Character] DROP CONSTRAINT '+@cname)
GO
ALTER TABLE [Character] ADD CONSTRAINT [DF__Character__S6EP3_PS_FIX] DEFAULT(0) FOR S6EP3_PS_FIX

