USE [MuOnline]
GO
/****** Object:  Table [dbo].[CashShopInventory]    Script Date: 11/05/2011 01:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CashShopInventory](
	[AccountId] [varchar](10) NOT NULL,
	[Key0] [int] NOT NULL,
	[AuthKey] [int] NOT NULL,
	[Key1] [int] NOT NULL,
	[Key2] [int] NOT NULL,
	[Key3] [int] NOT NULL,
	[InvType] [int] NOT NULL,
	[Flag1] [tinyint] NOT NULL,
	[Idx] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF