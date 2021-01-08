
CREATE PROCEDURE [dbo].[sp_CheckPermission]  
	@UserId uniqueidentifier,
	@Function int
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @returnval bit
	
	SELECT @returnval = CASE WHEN COUNT(*) = 0 THEN 0 ELSE 1 END FROM tbl_RolePermission RP WHERE RP.idRole IN 
	(
		SELECT R.RoleId FROM aspnet_Membership M, aspnet_Roles R, aspnet_UsersInRoles UR
		WHERE M.UserId = @UserId	
		AND R.RoleId = UR.RoleId AND M.UserId = UR.UserId	
	)
	AND RP.idAppFunction = @Function
	
	RETURN @returnval
END
