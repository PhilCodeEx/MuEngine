USE [MuOnline]
GO
/****** Object:  Table [dbo].[PeriodPetInfo]    Script Date: 11/02/2012 16:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodPetInfo](
	[serial] [bigint] NOT NULL CONSTRAINT [DF_PetPeriod_serial]  DEFAULT ((0)),
	[stamp] [int] NOT NULL CONSTRAINT [DF_PetPeriod_stamp]  DEFAULT ((0)),
 CONSTRAINT [PK_PeriodPetInfo] PRIMARY KEY CLUSTERED 
(
	[serial] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
