USE [Me_MuOnline] -- for 2 DB
--USE [MuOnline] -- for 1 DB

GO
/****** Object:  Table [dbo].[MuLogEx]    Script Date: 11/16/2011 22:26:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MuLogEx](
	[AccountId] [varchar](10) NOT NULL,
	[IP] [varchar](15) NULL,
	[TimeIn] [datetime] NULL,
	[TimeOut] [datetime] NULL,
	[OnlineDuration] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

---------------------------------------------------------------------------------
DECLARE @vipdays as INT


SET @vipdays = 30	-- Set here your current vip days config from vip.ini


UPDATE MEMB_INFO SET VipStamp=VipStamp+(@vipdays * 86400) WHERE VipStamp > 0