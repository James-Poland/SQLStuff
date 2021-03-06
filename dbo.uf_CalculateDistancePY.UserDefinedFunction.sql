USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[uf_CalculateDistancePY]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[uf_CalculateDistancePY] (@Lat1 decimal(8,4), @Long1 decimal(8,4), @Lat2 decimal(8,4), @Long2 decimal(8,4))
RETURNS decimal (8,4) AS
BEGIN
    DECLARE @d decimal(28,10)

    SET @d = sqrt(square(abs(@Lat1-@Lat2)) + square(abs(@Long1-@Long2)))

    RETURN @d
END
GO
