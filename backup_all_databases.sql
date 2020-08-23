DECLARE @name VARCHAR(50) -- database name 
DECLARE @path VARCHAR(256) -- path for backup files 
DECLARE @fileName VARCHAR(256) -- filename for backup 
DECLARE @fileDate VARCHAR(20) -- used for file name

--TODO: Change the path
-- specify database backup directory
SET @path = '\Backup' 
 
-- specify filename format
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)
 

SELECT @name   = min (name )
FROM master.dbo.sysdatabases
WHERE name NOT IN ('master','model','msdb','tempdb')  -- exclude these databases
 -- SELECT @name

WHILE @name IS NOT null
BEGIN  
   SET @fileName = @path + @name + '_' + @fileDate + '.BAK' 
  BACKUP DATABASE @name TO DISK = @fileName  WITH STATS = 5

 --SELECT @name
 
 SELECT @name   = min (name )
FROM master.dbo.sysdatabases
WHERE name NOT IN ('master','model','msdb','tempdb')  -- exclude these databases
 AND name > @name 
END  