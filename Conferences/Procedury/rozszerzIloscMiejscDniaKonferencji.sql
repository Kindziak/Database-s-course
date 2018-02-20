-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rozszerzIloscMiejscDniaKonferencji]
	@ID_dniaKonferencji int,
	@IloscMiejscOgolem int
AS
BEGIN
	SET NOCOUNT ON;

	if(@IloscMiejscOgolem <= (select IloscMiejscOgolem from [Dni konferencji] where ID_dniaKonferencji=@ID_dniaKonferencji))
		throw 52000, 'Mozna tylko zwiekszyc ilosc miejsc',1

	UPDATE [Dni konferencji] SET IloscMiejscOgolem=@IloscMiejscOgolem WHERE ID_dniaKonferencji=@ID_dniaKonferencji
END
GO
