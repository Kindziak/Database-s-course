USE [kkaczmar_a]
GO
/****** Object:  StoredProcedure [dbo].[dodajWplate]    Script Date: 15.01.2017 16:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dodajWplate]
	@ID_rezerwacjiDniaKonferencji int,
	@Wplata money
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Wplaty VALUES(@ID_rezerwacjiDniaKonferencji,@Wplata,getdate())

END
