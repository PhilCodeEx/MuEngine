USE [Me_MuOnline] -- 2DB
--USE [MuOnline] -- 1DB

GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MEMB_DETA_MEMB_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[MEMB_DETA]'))
ALTER TABLE [dbo].[MEMB_DETA] DROP CONSTRAINT [FK_MEMB_DETA_MEMB_INFO]

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[MEMB_INFO]') AND name = N'PK_MEMB_INFO_1')
ALTER TABLE [dbo].[MEMB_INFO] DROP CONSTRAINT [PK_MEMB_INFO_1]
