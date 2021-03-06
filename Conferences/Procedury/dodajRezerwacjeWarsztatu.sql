USE [kkaczmar_a]
GO
/****** Object:  StoredProcedure [dbo].[dodajRezerwacjeWarsztatu]    Script Date: 16.01.2017 19:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dodajRezerwacjeWarsztatu] 
	@ID_warsztatu int,
	@ID_klienta int, 
	@ID_rezerwacjiDniaKonferencji int,
	@IloscUczestnikow int
AS
BEGIN
	SET NOCOUNT ON;

	-- sprawdzanie czy jest wystarczajaco miejsca w dniu konferencji
	declare @IloscMiejscWolnych int
	declare @IloscMiejscOgolem int
	 
	set @IloscMiejscWolnych = dbo.podajIloscMiejsc(@ID_warsztatu,'Warsztat','wolnych')
	set @IloscMiejscOgolem = dbo.podajIloscMiejsc(@ID_warsztatu,'Warsztat','ogolem')

	if @IloscMiejscWolnych + @IloscUczestnikow > @IloscMiejscOgolem
		THROW 50001,'Nie wystarczajaco miejsc na ten warsztat',1

	UPDATE Warsztaty set IloscMiejscWolnych=dbo.podajIloscWolnychMiejscWarsztatu(@ID_warsztatu) where ID_warsztatu=@ID_warsztatu


	INSERT INTO [Rezerwacja warsztatow] VALUES(@ID_warsztatu,@id_klienta,@id_rezerwacjiDniaKonferencji,@IloscUczestnikow,getdate())
END
