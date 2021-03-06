USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[RemoveNonAlphaCharacters]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE Function [dbo].[RemoveNonAlphaCharacters](@Temp VarChar(1000))
Returns VarChar(1000)
AS
Begin
  While PatIndex('%[^a-z - '']%', @Temp) > 0 
        Set @Temp = Stuff(@Temp, PatIndex('%[^a-z - '']%', @Temp), 1, '') 
 
    Return @Temp
End
GO
