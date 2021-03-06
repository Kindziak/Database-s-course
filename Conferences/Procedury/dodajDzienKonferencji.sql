USE [kkaczmar_a]
GO
/****** Object:  StoredProcedure [dbo].[dodajDzienKonferencji]    Script Date: 15.01.2017 23:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dodajDzienKonferencji] 
	@ID_konferencji int,
	@Data date,
	@IloscMiejscOgolem int -- to jest ilosc miejsc ogolem i przy dodawanu dnia konferencji takze ilosc miejsc wolnych
AS
BEGIN
	SET NOCOUNT ON;

	declare @DataRozpoczecia date 
	declare @DataZakonczenia date

	set @DataRozpoczecia = (select DataRozpoczecia from Konferencje where ID_konferencji=@ID_konferencji)
	set @DataZakonczenia = (select DataZakonczenia from Konferencje where ID_konferencji=@ID_konferencji)

	if (@DataRozpoczecia > @Data) or (@DataZakonczenia < @Data)
		THROW 50001,'Nie zgadza sie data dnia konferencji',1

	INSERT INTO [Dni konferencji] VALUES (@ID_konferencji,@Data,@IloscMiejscOgolem,@IloscMiejscOgolem)
END
