USE [Me_MuOnline]
//USE [MuOnline]
GO
/****** Object:  Table [dbo].[ECOINS_HISTORY]    Script Date: 08/30/2012 01:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ECOINS_HISTORY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[memb___id] [varchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[name] [varchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[name2] [varchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[i_group] [tinyint] NULL,
	[i_index] [smallint] NULL,
	[stamp] [int] NULL,
	[type] [tinyint] NULL,
	[note] [varchar](15) COLLATE Chinese_PRC_CI_AS NULL,
	[iscashshop] [tinyint] NOT NULL CONSTRAINT [DF_ECOINS_HISTORY_iscashshop]  DEFAULT ((0)),
	[ecoins] [int] NOT NULL CONSTRAINT [DF_ECOINS_HISTORY_ecoins]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF