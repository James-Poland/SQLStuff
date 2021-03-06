USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[ParseValues]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ParseValues]
(@String varchar(8000), @Delimiter varchar(10) )
RETURNS @RESULTS TABLE (ID int identity(1,1), Val varchar(8000))
AS
BEGIN
DECLARE @Value varchar(100)
WHILE @String is not null
BEGIN
SELECT @Value=CASE WHEN PATINDEX('%'+@Delimiter+'%',@String) >0 THEN LEFT(@String,PATINDEX('%'+@Delimiter+'%',@String)-1) ELSE @String END, @String=CASE WHEN PATINDEX('%'+@Delimiter+'%',@String) >0 THEN SUBSTRING(@String,PATINDEX('%'+@Delimiter+'%',@String)+LEN(@Delimiter),LEN(@String)) ELSE NULL END
INSERT INTO @RESULTS (Val)
SELECT @Value
END
RETURN
END
GO
