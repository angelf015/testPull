INSERT INTO dbo.Cusomers(Id, FirstName, LastName) VALUES(1, 'Mohamed', 'Mousavi')
GO 1000

INSERT INTO dbo.Customers
SELECT * FROM dbo.Customers
    GO 10