--USE [MuOnline] -- for 1 db
USE [Me_MuOnline] -- for 2 db

GO
/****** Object:  Table [dbo].[ItemInsurance]    Script Date: 10/14/2011 11:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemInsurance](
	[memb___id] [varchar](10) NOT NULL,
	[i_serial] [int] NOT NULL,
	[enddate] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF