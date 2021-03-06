USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_calculateTranspositions]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_calculateTranspositions](@s1_len INT, @str1 VARCHAR(MAX), @str2 VARCHAR(MAX)) 
RETURNS INT AS 
BEGIN
	DECLARE @transpositions INT
	DECLARE @i INT

	SET	@transpositions = 0
	SET	@i = 0
	WHILE @i < @s1_len
	BEGIN
		IF SUBSTRING(@str1, @i+1, 1) <> SUBSTRING(@str2, @i+1, 1)
		BEGIN
			SET	@transpositions = @transpositions + 1
		END
		SET @i = @i + 1
	END

	SET	@transpositions = @transpositions / 2
	RETURN @transpositions
END
GO
