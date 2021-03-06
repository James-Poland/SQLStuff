USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsValidCard]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsValidCard]
(
	@Card NVARCHAR(16)
)
RETURNS TINYINT
AS
BEGIN
	RETURN	CASE
			WHEN @Card LIKE '%[^0-9]%' THEN 0
			WHEN @Card IS NULL THEN 0
			WHEN	(
					+ 2 * CAST(SUBSTRING(@Card, 1, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 1, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 2, 1) AS TINYINT)
					+ 2 * CAST(SUBSTRING(@Card, 3, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 3, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 4, 1) AS TINYINT)
					+ 2 * CAST(SUBSTRING(@Card, 5, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 5, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 6, 1) AS TINYINT)
					+ 2 * CAST(SUBSTRING(@Card, 7, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 7, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 8, 1) AS TINYINT)
					+ 2 * CAST(SUBSTRING(@Card, 9, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 9, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 10, 1) AS TINYINT)
					+ 2 * CAST(SUBSTRING(@Card, 11, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 11, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 12, 1) AS TINYINT)
					+ 2 * CAST(SUBSTRING(@Card, 13, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 13, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 14, 1) AS TINYINT)
					+ 2 * CAST(SUBSTRING(@Card, 15, 1) AS TINYINT) / 10
					+ 2 * CAST(SUBSTRING(@Card, 15, 1) AS TINYINT) % 10
					+ CAST(SUBSTRING(@Card, 16, 1) AS TINYINT)
				) % 10 = 0 THEN 1
			ELSE 0
		END
END
GO
