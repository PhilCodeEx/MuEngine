USE [Me_MuOnline] -- 2DB
--USE [MuOnline] -- 1DB

GO

-- if you got error in the following script it means you have multiple record of same account id, you need to resolve it first

ALTER TABLE [dbo].[MEMB_INFO] ADD  CONSTRAINT [PK_MEMB_INFO] PRIMARY KEY NONCLUSTERED 
(
	[memb___id] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]