USE [kkaczmar_a]
GO
/****** Object:  StoredProcedure [dbo].[dodajKlienta]    Script Date: 15.01.2017 21:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dodajKlienta] 
	@ImieKontaktowe varchar(255),
	@NazwiskoKontaktowe varchar(255),
	@Telefon int,
	@Email varchar(255),
	@NazwaFirmy varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Klienci VALUES(@ImieKontaktowe,@NazwiskoKontaktowe,@Telefon,@Email,@NazwaFirmy)
END
