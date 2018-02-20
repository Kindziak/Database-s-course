-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[podajIloscMiejsc] 
(
	@ID int,
	@Rodzaj varchar(255),
	@WolneCzyOgolem varchar(255)
)
RETURNS int
AS
BEGIN
	
	declare @IloscMiejsc int
	
	if @Rodzaj = 'DzienKonferencji'
		if @WolneCzyOgolem = 'wolne'
			set @IloscMiejsc = (select sum(IloscMiejscWolnych) from [Dni konferencji] where ID_dniaKonferencji=@ID)
		else
			set @IloscMiejsc = (select sum(IloscMiejscOgolem) from [Dni konferencji] where ID_dniaKonferencji=@ID)
	else
		if @WolneCzyOgolem = 'wolne'
			set @IloscMiejsc = (select sum(IloscMiejscWolnych) from Warsztaty where ID_warsztatu=@ID)
		else
			set @IloscMiejsc = (select sum(IloscMiejscOgolem) from Warsztaty where ID_warsztatu=@ID)
	
	return @IloscMiejsc
END
GO

