USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitStrings_CLR]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[SplitStrings_CLR](@List [nvarchar](max), @Delimiter [nvarchar](255))
RETURNS  TABLE (
	[Item] [nvarchar](4000) NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CLRUtilities].[UserDefinedFunctions].[SplitString_Multi]
GO
