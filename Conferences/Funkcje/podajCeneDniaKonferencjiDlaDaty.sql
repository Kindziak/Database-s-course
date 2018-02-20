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
CREATE FUNCTION [dbo].[podajCeneDniaKonferencjiDlaDaty] 
(
	@Data date,
	@ID_dniaKonferencji int
)
RETURNS money
AS
BEGIN
	declare @Cena money = ( select top 1 Cena from Ceny where (ID_dniaKonferecji=@ID_dniaKonferencji) and (datediff(day,@Data,DataPodwyzszeniaCeny)>=0) order by DataPodwyzszeniaCeny)

	return @Cena
END
GO

