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
CREATE PROCEDURE [dbo].[rozszerzIloscMiejscWarsztatu] 
	@ID_warsztatu int,
	@IloscMiejscOgolem int
AS
BEGIN
	SET NOCOUNT ON;

	if(@IloscMiejscOgolem <= (select IloscMiejscOgolem from Warsztaty where ID_warsztatu=@ID_warsztatu))
		throw 52000, 'Mozna tylko zwiekszyc ilosc miejsc',1

	UPDATE Warsztaty SET IloscMiejscOgolem=@IloscMiejscOgolem WHERE @ID_warsztatu=@ID_warsztatu
END
GO
