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
CREATE PROCEDURE [dbo].[przydzielUczestnikaDoRezerwacjiWarszatu]
	@ID_rezerwacjiWarsztatu int,
	@ID_uczestnika int
AS
BEGIN
	SET NOCOUNT ON;

	declare @ID_rezerwacjiDniaKonferencji int = ( select ID_rezerwacjiDniaKonferencji from [Rezerwacja warsztatow] where ID_rezerwacjiWarsztatu = @ID_rezerwacjiWarsztatu)
	declare @ID int = (select ID_uczestnika from [Dni konferencji_Uczestnicy] where (ID_rezerwacjiDniaKonferencji=@ID_rezerwacjiDniaKonferencji) and (ID_uczestnika=@ID_uczestnika))

	if @ID is null
		throw 52000, 'Uczestnik nie zostal przydzielony do odpowiedniego dnia konferencji',1

	INSERT INTO Warsztaty_Uczestnicy VALUES (@ID_rezerwacjiWarsztatu,@ID_uczestnika)
END
GO
