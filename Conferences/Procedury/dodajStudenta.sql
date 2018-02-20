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
CREATE PROCEDURE [dbo].[dodajStudenta] 
	@ID_uczestnika int,
	@NumerLegitymacjiStudenckiej varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Studenci VALUES (@ID_uczestnika,@NumerLegitymacjiStudenckiej)
END
GO
