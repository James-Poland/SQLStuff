USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_nocharactersinstring]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================
-- Author:		<Rashmi Sahoo>
-- Create date: <03/01/2019>
-- Description:	<RemoveCharactersfromString>
--===============================================
Create FUNCTION [dbo].[fn_nocharactersinstring]
(
	@string nvarchar(max) 
	 
)
RETURNS nvarchar(max)
AS
BEGIN
	-- loop untill all characters are replaced
	WHILE PATINDEX('%[^0-9]%',@string) <> 0
	BEGIN
    -- remove characters with empty space
    SET @string = STUFF(@string,PATINDEX('%[^0-9]%',@string),1,'')
	END
	
	RETURN @string
END
GO
