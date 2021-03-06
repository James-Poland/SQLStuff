USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IsLeapYear]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
create function [dbo].[fn_IsLeapYear] (@year int)
returns bit
as
begin
return(select case datepart(mm, dateadd(dd, 1, cast((cast(@year as varchar(4)) + '0228') as datetime)))
when 2 then 1
else 0 end)
end
GO
