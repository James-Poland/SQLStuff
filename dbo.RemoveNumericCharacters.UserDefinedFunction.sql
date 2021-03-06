USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[RemoveNumericCharacters]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[RemoveNumericCharacters](@Temp VarChar(1000))

/* Removes Numbers from Strings, useful in places
James POland 24082018*/
Returns VarChar(1000)
AS
Begin

    Declare @NumRange as varchar(50) = '%[0-9]%'
    While PatIndex(@NumRange, @Temp) > 0
        Set @Temp = Stuff(@Temp, PatIndex(@NumRange, @Temp), 1, '')

    Return @Temp
End

GO
