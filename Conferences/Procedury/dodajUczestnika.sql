USE [kkaczmar_a]
GO
/****** Object:  StoredProcedure [dbo].[dodajUczestnika]    Script Date: 15.01.2017 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[dodajUczestnika] 
	@ID_klienta int,
	@Imie varchar(255),
	@Nazwisko varchar(255),
	@Telefon int,
	@Email varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Uczestnicy VALUES (@ID_klienta,@Imie,@Nazwisko,@Telefon,@Email)
END
