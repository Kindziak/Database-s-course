USE [kkaczmar_a]
GO

/****** Object:  Table [dbo].[Klienci]    Script Date: 14.01.2017 17:10:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Klienci](
	[ID_klienta] [int] IDENTITY(1,1) NOT NULL,
	[NazwaFirmy] [varchar](255) NOT NULL,
	[ImieKontaktowe] [varchar](255) NOT NULL,
	[NazwiskoKontaktowe] [varchar](255) NOT NULL,
	[Telefon] [int] NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Ulica] [varchar](255) NOT NULL,
	[Miasto] [varchar](255) NOT NULL,
	[Kraj] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[ID_klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


