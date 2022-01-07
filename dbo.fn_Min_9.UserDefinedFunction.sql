USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Min_9]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_Min_9] (@num1 decimal(12,4),@num2 decimal(12,4))
returns decimal(12,4)
as
begin
return(select case when @num1 < @num2 then @num1 else @num2 end)
end
GO
