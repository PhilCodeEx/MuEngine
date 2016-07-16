USE [MuOnline]
GO
/****** Object:  Table [dbo].[Lottery_Info]    Script Date: 12/28/2011 12:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lottery_Info](
	[JackPotMulti] [smallint] NOT NULL,
	[SvrCode] [tinyint] NOT NULL
) ON [PRIMARY]


ALTER TABLE Lottery_Winners ADD JackPotMulti SMALLINT DEFAULT 0
