DROP PROCEDURE IF EXISTS dbo.sp_GetAccountByEmail;
GO
CREATE PROCEDURE dbo.sp_GetAccountByEmail
    @email NVARCHAR(100)
AS
BEGIN
    SELECT a.*, r.roleId, r.roleName FROM Accounts a
    JOIN AccountRoles ar ON a.accountId = ar.accountId
    JOIN Roles r ON ar.roleId = r.roleId
    WHERE email = @email
END
GO

roleId	roleName
1	Customers
2	Admin
3	Seller
4	Marketing Staff
5	Shipper

select GETDATE()

insert into AccountRoles values (9,2, GETDATE(), GETDATE())

update AccountRoles
set roleId = 2
where accountId = 9

customer1433@gmail.com 

