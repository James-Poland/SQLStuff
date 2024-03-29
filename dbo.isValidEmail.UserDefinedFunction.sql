﻿USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[isValidEmail]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[isValidEmail] (@EMAIL VARCHAR(100))
RETURNS BIT
AS
BEGIN
	DECLARE @bitEmailVal AS BIT
	DECLARE @EmailText VARCHAR(100)

	SET @EmailText = ltrim(rtrim(isnull(@EMAIL, '')))
	SET @bitEmailVal = CASE 
			WHEN @EmailText = ''
				THEN 0
			WHEN @EmailText LIKE '% %'
				THEN 0
			WHEN @EmailText LIKE ('%["(),:;<>\]%')
				THEN 0
			WHEN substring(@EmailText, charindex('@', @EmailText), len(@EmailText)) LIKE ('%[!#$%&*+/=?^`_{|]%'
					)
				THEN 0
			WHEN (
					left(@EmailText, 1) LIKE ('[-_.+]')
					OR right(@EmailText, 1) LIKE ('[-_.+]')
					)
				THEN 0
			WHEN (
					@EmailText LIKE '%[%'
					OR @EmailText LIKE '%]%'
					)
				THEN 0
			WHEN @EmailText LIKE '%@%@%'
				THEN 0
			WHEN @EmailText NOT LIKE '_%@_%._%'
				THEN 0
			WHEN @EmailText LIKE '%test.com%'
				THEN 0
			WHEN @EmailText LIKE '%@na.ie%'
				THEN 0
			WHEN @EmailText LIKE '%@none.ie%'
				THEN 0
						ELSE 1
			END

	RETURN @bitEmailVal
END
GO
