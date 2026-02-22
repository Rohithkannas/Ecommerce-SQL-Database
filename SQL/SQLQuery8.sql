-- Enable remote access
EXEC sp_configure 'remote access', 1;
RECONFIGURE;
GO

-- Verify it worked
SELECT @@SERVERNAME AS ServerName;


SELECT local_net_address, local_tcp_port
FROM sys.dm_exec_connections
WHERE session_id = @@SPID;
