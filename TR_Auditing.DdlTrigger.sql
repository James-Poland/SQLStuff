﻿USE [XSDMI]
GO
/****** Object:  DdlTrigger [TR_Auditing]    Script Date: 07/01/2022 17:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [TR_Auditing]
on database
for create_procedure, alter_procedure, drop_procedure,
create_table, alter_table, drop_table,
create_function, alter_function, drop_function
as

set nocount on

declare @data xml
set @data = EVENTDATA()

insert into [maintanence].[ChangeLog](
   databasename, eventtype, 
    objectname, objecttype, 
   sqlcommand, loginname)
values(
@data.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(256)'),
@data.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)'), 
@data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(256)'), 
@data.value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(25)'), 
@data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(max)'), 
@data.value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)')
) 

GO
ENABLE TRIGGER [TR_Auditing] ON DATABASE
GO
