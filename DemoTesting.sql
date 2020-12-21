--先建立測試的資料，並刪除它
-- Drop Table tbl_Sample
Create Table tbl_Sample 
([ID] int identity(1,1) ,
[Name] varchar(50),
[Name2] nvarchar(50),
[T1] int,
[Sdate] Datetime)
GO
Insert into tbl_Sample values ('Rec 1',N'堃 亂馬客 Rec1', 11, '2020/09/25')
Insert into tbl_Sample values ('Rec 2',N'堃 亂馬客 Rec2', 22, '2020/01/13') 
Insert into tbl_Sample values ('Rec 3',N'堃 亂馬客 Rec3', 33, '2020/06/14') 
 
Select * From tbl_Sample
Delete From tbl_Sample

--找出目前被刪除的資料
Select AllocUnitName, Context, Operation
, [RowLog Contents 0]
, [Transaction SID]
, *
From sys.fn_dblog(NULL,NULL)
Where AllocUnitName = 'dbo.tbl_Sample'
AND Operation = 'LOP_DELETE_ROWS'
AND Context in ('LCX_HEAP', 'LCX_MARK_AS_GHOST');


Select * 
From sys.allocation_units allocunits 
INNER JOIN sys.partitions partitions 
ON (allocunits.type IN (1, 3) 
AND partitions.hobt_id = allocunits.container_id) 
OR (allocunits.type = 2 
AND partitions.partition_id = allocunits.container_id) 
INNER JOIN sys.system_internals_partition_columns cols 
ON cols.partition_id = partitions.partition_id 
LEFT OUTER JOIN syscolumns 
ON syscolumns.id = partitions.object_id 
AND syscolumns.colid = cols.partition_column_id



EXEC Recover_Deleted_Data_Proc NULL,'dbo.tbl_Sample'
EXEC Recover_Deleted_Data_With_UID_Date_Time_Proc null,'dbo.tbl_Sample'


