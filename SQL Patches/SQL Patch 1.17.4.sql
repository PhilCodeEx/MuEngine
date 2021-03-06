USE [MuOnline]
GO
/****** Object:  Table [dbo].[Lottery_Tickets]    Script Date: 12/27/2011 15:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lottery_Tickets](
	[Ticket] [varchar](12) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[SvrCode] [smallint] NOT NULL CONSTRAINT [DF_Lottery_Tickets_SvrCode]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
/****** Object:  Table [dbo].[Lottery_Winners]    Script Date: 12/27/2011 15:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lottery_Winners](
	[Name] [varchar](10) NOT NULL,
	[RewardID] [smallint] NOT NULL CONSTRAINT [DF_Lottery_Winners_RewardID]  DEFAULT ((0)),
	[SvrCode] [smallint] NOT NULL CONSTRAINT [DF_Lottery_Winners_SvrCode]  DEFAULT ((0)),
	[LotteryDate] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
/****** Object:  Index [IX_Lottery_Tickets]    Script Date: 12/27/2011 15:43:03 ******/
CREATE NONCLUSTERED INDEX [IX_Lottery_Tickets] ON [dbo].[Lottery_Tickets] 
(
	[Ticket] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
/****** Object:  Index [IX_Lottery_Winners]    Script Date: 12/27/2011 15:43:53 ******/
CREATE NONCLUSTERED INDEX [IX_Lottery_Winners] ON [dbo].[Lottery_Winners] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

