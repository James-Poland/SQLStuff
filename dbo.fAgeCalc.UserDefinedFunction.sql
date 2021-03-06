USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[fAgeCalc]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fAgeCalc](@DOB datetime,@Date datetime) 
returns smallint 
as
begin
return (
      select case when month(@DOB)>month(@Date) then datediff(yyyy,@DOB,@Date)-1 
                  when month(@DOB)<month(@Date) then datediff(yyyy,@DOB,@Date) 
                  when month(@DOB)=month(@Date) then 
                        case when day(@DOB)>day(@Date)
                              then datediff(yyyy,@DOB,@Date)-1 
                        else datediff(yyyy,@DOB,@Date) end 
                  end) 
end
GO
