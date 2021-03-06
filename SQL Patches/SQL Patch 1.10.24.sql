USE [MuOnline]
GO
/****** Object:  Table [dbo].[GuildExtWare]    Script Date: 10/17/2011 03:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildExtWare](
	[GuildName] [varchar](8) NOT NULL,
	[Idx] [int] NOT NULL CONSTRAINT [DF_GuildExtWare_Idx]  DEFAULT ((0)),
	[Items] [varbinary](1920) NULL,
	[Money] [int] NULL,
	[EndUseDate] [smalldatetime] NULL,
	[DbVersion] [tinyint] NULL,
	[pw] [smallint] NULL,
	[ExtCKNum] [int] NOT NULL CONSTRAINT [DF_GuildExtWare_ExtCKNum]  DEFAULT ((0)),
	[NeedExtCK] [int] NOT NULL CONSTRAINT [DF_GuildExtWare_NeedExtCK]  DEFAULT ((0)),
	[Lock] [tinyint] NOT NULL CONSTRAINT [DF_GuildExtWare_Lock]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF