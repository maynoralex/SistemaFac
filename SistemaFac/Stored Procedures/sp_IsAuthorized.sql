
CREATE PROCEDURE [dbo].[sp_IsAuthorized]  
	@UserId uniqueidentifier,
	@Function int
AS
BEGIN

	SET NOCOUNT ON;
	

	
	SELECT * FROM tbl_RolePermission RP WHERE RP.idRole IN 
	(
		SELECT R.RoleId FROM aspnet_Membership M, aspnet_Roles R, aspnet_UsersInRoles UR
		WHERE M.UserId = @UserId	
		AND R.RoleId = UR.RoleId AND M.UserId = UR.UserId	
	)
	AND RP.idAppFunction = @Function
	
	
END
