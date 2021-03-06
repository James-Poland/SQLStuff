USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_StrClean]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Function [dbo].[fn_StrClean](@p_str1 VARCHAR(MAX)) 
RETURNS VARCHAR(MAX) as 
BEGIN 
 DECLARE @ret_value VARCHAR(MAX)
 SET @ret_value = @p_str1
 SET @ret_value = REPLACE(@ret_value, '.', '')
 SET @ret_value = REPLACE(@ret_value, ',', '') 
 SET @ret_value = REPLACE(@ret_value, '-', '') 
 SET @ret_value = REPLACE(@ret_value, ';', '') 
 SET @ret_value = REPLACE(@ret_value, ':', '') 

 RETURN @ret_value
END
GO
