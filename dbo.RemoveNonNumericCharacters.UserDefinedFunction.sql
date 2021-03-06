GO
/****** Object:  UserDefinedFunction [dbo].[RemoveNonNumericCharacters]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE Function [dbo].[RemoveNonNumericCharacters](@Temp VarChar(1000))
    Returns VarChar(1000)
    AS
    Begin

        While PatIndex('%[^0-9.-]%', @Temp) > 0
            Set @Temp = Stuff(@Temp, PatIndex('%[^0-9.-]%', @Temp), 1, '')

        Return @TEmp
    End
GO
