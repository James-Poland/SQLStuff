USE [XSDMI]
GO
/****** Object:  UserDefinedFunction [dbo].[FnNetSale]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[FnNetSale]
(
@quantity int,
@pricelist decimal(14,2),
@discount decimal(4,2)
)
returns int
as 
begin
return
@quantity*@pricelist*(1-@discount);
end;
GO
