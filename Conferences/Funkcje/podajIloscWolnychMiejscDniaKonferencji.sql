USE [kkaczmar_a]
GO
/****** Object:  UserDefinedFunction [dbo].[podajIloscWolnychMiejscDniaKonferencji]    Script Date: 16.01.2017 19:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[podajIloscWolnychMiejscDniaKonferencji] 
(
	@ID_dnia int
)
RETURNS int
AS
BEGIN
	
	declare @IloscMiejscOgolem int
	declare @IloscMiejscZajetych int
	
	set @IloscMiejscOgolem = (select IloscMiejscOgolem from [Dni konferencji] where ID_dniaKonferencji=@ID_dnia)
	set @IloscMiejscZajetych = (select sum(IloscUczestnikow) from [Rezerwacja dnia konferencji] where ID_dniaKonferencji=@ID_dnia and Anulowana = 1)

	if @IloscMiejscZajetych is null
		set @IloscMiejscZajetych =0

	return (@IloscMiejscOgolem - @IloscMiejscZajetych )
END
