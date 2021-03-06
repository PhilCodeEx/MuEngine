USE [MuOnline]
GO
/****** Object:  Table [dbo].[Elemental]    Script Date: 10/03/2013 21:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Elemental](
	[Name] [varchar](10) NOT NULL,
	[ErrtelInventory] [varbinary](400) NULL,
 CONSTRAINT [PK_Elemental] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF