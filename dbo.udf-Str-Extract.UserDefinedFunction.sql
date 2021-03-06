USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[udf-Str-Extract]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf-Str-Extract] (@String varchar(max),@Delimiter1 varchar(100),@Delimiter2 varchar(100))
Returns Table 
As
Return (  

with   cte1(N)   As (Select 1 From (Values(1),(1),(1),(1),(1),(1),(1),(1),(1),(1)) N(N)),
       cte2(N)   As (Select Top (IsNull(DataLength(@String),0)) Row_Number() over (Order By (Select NULL)) From (Select N=1 From cte1 N1,cte1 N2,cte1 N3,cte1 N4,cte1 N5,cte1 N6) A ),
       cte3(N)   As (Select 1 Union All Select t.N+DataLength(@Delimiter1) From cte2 t Where Substring(@String,t.N,DataLength(@Delimiter1)) = @Delimiter1),
       cte4(N,L) As (Select S.N,IsNull(NullIf(CharIndex(@Delimiter1,@String,s.N),0)-S.N,8000) From cte3 S)

Select RetSeq = Row_Number() over (Order By N)
      ,RetPos = N
      ,RetLen = charindex(@Delimiter2,RetVal)-1
      ,RetVal = left(RetVal,charindex(@Delimiter2,RetVal)-1)
 From (Select A.N,RetVal = ltrim(rtrim(Substring(@String, A.N, A.L))) From cte4 A ) A
 Where charindex(@Delimiter2,RetVal)>1
)
/*
Max Length of String 1MM characters

Declare @String varchar(max) = 'Dear [[FirstName]] [[LastName]], ...'
Select * From [dbo].[udf-Str-Extract] (@String,'[[',']]')
*/
GO
