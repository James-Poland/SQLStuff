USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[RemoveSpecialCharacters]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[RemoveSpecialCharacters](@Temp VarChar(100))
Returns VarChar(100)
AS
Begin

    Declare @KeepValues as varchar(50) = '%[^a-z0-9 /_()]%'
    While PatIndex(@KeepValues, rtrim(ltrim(@Temp))) > 0 
        Set @Temp = Stuff(@Temp, PatIndex(@KeepValues, @Temp), 1, '')

    Return @Temp
End
GO
