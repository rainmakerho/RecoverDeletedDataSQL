# RecoverDeletedDataSQL
### MSSQL 透過 sys.fn_dblog 來找出被刪除的資料 

| File  | 說明   | 
|---|---|
| Recover_Deleted_Data_Proc.sql  |  取得被刪除的資料 |
| Recover_Deleted_Data_With_UID_Date_Time_Proc.sql  |  取得被刪除的資料(包含使用者) |
| dbo.ufnReverse.sql  |  不會因定序而改變的 Reverse Function |
| DemoTesting.sql  |  測試的Script |

說明請參考: [透過 Transaction Log(fn_dblog) 找回被刪除的資料](https://rainmakerho.github.io/2020/12/21/RecoverDeletedDataSQL/)
