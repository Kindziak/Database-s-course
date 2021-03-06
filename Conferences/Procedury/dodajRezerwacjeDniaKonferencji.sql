USE [kkaczmar_a]
GO
/****** Object:  StoredProcedure [dbo].[dodajRezerwacjeDniaKonferencji]    Script Date: 16.01.2017 19:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dodajRezerwacjeDniaKonferencji]
	@ID_klienta int,
	@ID_dniaKonferencji int,
	@IloscUczestnikow int
AS
BEGIN
	SET NOCOUNT ON;

	-- sprawdzanie czy jest wystarczajaco miejsca w dniu konferencji
	declare @IloscMiejscWolnych int
	declare @IloscMiejscOgolem int
	 
	set @IloscMiejscWolnych = dbo.podajIloscMiejsc(@ID_dniaKonferencji,'DzienKonferencji','wolnych')
	set @IloscMiejscOgolem = dbo.podajIloscMiejsc(@ID_dniaKonferencji,'DzienKonferencji','ogolem')

	if @IloscMiejscWolnych + @IloscUczestnikow > @IloscMiejscOgolem
		THROW 50001,'Nie wystarczajaco miejsc na ten dzien konferencji',1

	UPDATE [Dni konferencji] set IloscMiejscWolnych=dbo.podajIloscWolnychMiejscDniaKonferencji(@ID_dniaKonferencji) where ID_dniaKonferencji=@ID_dniaKonferencji

	INSERT INTO [Rezerwacja dnia konferencji] VALUES (@ID_klienta,@ID_dniaKonferencji,@IloscUczestnikow,getdate(),1) -- 1 oznacza ze nie anulowana
END
