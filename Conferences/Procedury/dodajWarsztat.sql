USE [kkaczmar_a]
GO
/****** Object:  StoredProcedure [dbo].[dodajWarsztat]    Script Date: 15.01.2017 23:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dodajWarsztat]
	@ID_dniaKonferencji int,
	@Data date,
	@GodzinaRozpoczecia time(7),
	@GodzinaZakonczenia time(7),
	@Oplata money,
	@IloscMiejscOgolem int
AS
BEGIN
	SET NOCOUNT ON;

	declare @DataDniaKonferencji date

	set @DataDniaKonferencji = (select Data from [Dni konferencji] where ID_dniaKonferencji=@ID_dniaKonferencji)

	if @Data <> @DataDniaKonferencji
		THROW 50001,'Nie zgadza sie data warsztatu. Musi byc taka sama jak data dnia konferencji',1

	INSERT INTO Warsztaty VALUES(@ID_dniaKonferencji,@Data,@godzinaRozpoczecia,@godzinaZakonczenia,@Oplata,@IloscMiejscOgolem,@IloscMiejscOgolem)
END

