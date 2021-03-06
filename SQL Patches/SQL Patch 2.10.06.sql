USE [MuOnline]
GO
/****** Object:  Table [dbo].[GensMap]    Script Date: 03/14/2014 04:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GensMap](
	[svrcode] [int] NOT NULL,
	[genstype] [tinyint] NOT NULL,
 CONSTRAINT [PK_GensMap] PRIMARY KEY CLUSTERED 
(
	[svrcode] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
