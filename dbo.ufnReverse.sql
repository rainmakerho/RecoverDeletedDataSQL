-- Script Name: dbo.ufnReverse
-- Script Type : Custom Reverse Function
-- Release Notes:
-- 1.有些定序會導致 REVERSE 錯誤，所以使用自已用的 Reverse 
-- 錯誤 0x0000000041AC0000 => 0x00AC004100000000
-- 正確 0x0000000041AC0000 => 0x0000AC4100000000
--GO
-- select dbo.ufnReverse(0x0000000041AC0000);
IF OBJECT_ID (N'dbo.ufnReverse', N'FN') IS NOT NULL  
    DROP FUNCTION dbo.ufnReverse;  
GO  
CREATE FUNCTION dbo.ufnReverse(@Value varbinary(8000))  
RETURNS varbinary(8000) 
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @Ret varbinary(8000);
	Declare @Len int;
	SET @Len = DATALENGTH(@Value);
	SET @Ret = 0x;
	WHILE (@Len >0)
	BEGIN
		Set @Ret = @Ret + SUBSTRING(@Value, @Len, 1);
		Set @Len = @Len - 1;
	END
    RETURN @Ret;  
END; 
