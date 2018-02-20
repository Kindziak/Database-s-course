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
CREATE FUNCTION [dbo].[podajIloscWolnychMiejscWarsztatu] 
(
	@ID_warsztatu int
)
RETURNS int
AS
BEGIN
	
	declare @IloscMiejscOgolem int
	declare @IloscMiejscZajetych int
	
	set @IloscMiejscOgolem = (select IloscMiejscOgolem from Warsztaty where ID_warsztatu=@ID_warsztatu)
	set @IloscMiejscZajetych = (select sum(IloscUczestnikow) from [Rezerwacja warsztatow] where ID_warsztatu=@ID_warsztatu )

	if @IloscMiejscZajetych is null
		set @IloscMiejscZajetych =0

	return (@IloscMiejscOgolem - @IloscMiejscZajetych )
END
GO

