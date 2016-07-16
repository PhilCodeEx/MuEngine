USE [MuOnline]
GO
/****** Object:  Table [dbo].[RewardItem]    Script Date: 10/12/2012 21:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RewardItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[iGroup] [tinyint] NOT NULL,
	[iIndex] [int] NOT NULL,
	[iLevel] [tinyint] NOT NULL,
	[iDur] [int] NOT NULL,
	[iLuck] [tinyint] NOT NULL,
	[iSkill] [tinyint] NOT NULL,
	[iExc] [smallint] NOT NULL,
	[iSet] [int] NOT NULL,
	[iSock] [tinyint] NOT NULL,
	[iOpt] [tinyint] NOT NULL,
 CONSTRAINT [PK_RewardItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF