USE INTERNPROJECTSQL;
GO

CREATE ROLE db_reader;
CREATE ROLE db_writer;

GRANT SELECT ON Users TO db_reader;
GRANT SELECT ON Products TO db_reader;
GRANT SELECT ON Orders TO db_reader;
GRANT SELECT ON SalesSummary TO db_reader;

GRANT INSERT, UPDATE ON Orders TO db_writer;
GRANT INSERT, UPDATE ON OrderItems TO db_writer;
GRANT INSERT ON Payments TO db_writer;