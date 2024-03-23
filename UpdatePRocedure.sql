USE SWP391_Project_SQLShoes3
Go
CREATE PROCEDURE sp_GetAllAccountWithRole
AS
BEGIN
    SELECT  	
       *
    FROM [SWP391_Project_SQLShoes3].[dbo].[Accounts]
    INNER JOIN AccountRoles ON Accounts.accountId = AccountRoles.accountId
    INNER JOIN Roles ON AccountRoles.roleId = Roles.roleId;
END;


CREATE PROCEDURE sp_UpdateAccountStatus
    @accountId INT,
    @status INT
AS
BEGIN
    UPDATE Accounts
    SET status = @status
    WHERE accountId = @accountId;
END;
CREATE PROCEDURE sp_UpdateAccountRoles
    @accountId INT,
    @roleId INT
AS
BEGIN
    UPDATE AccountRoles
    SET roleId = @roleId
    WHERE accountId = @accountId;
END;
--Xoa Procedure Delete Account cu di roi chay cai nay
CREATE PROCEDURE [dbo].[sp_DeleteAccount]
    @accountId INT
AS
BEGIN
	Delete From AccountRoles Where accountId = @accountId
    DELETE FROM Accounts WHERE accountId = @accountId
END

GO

