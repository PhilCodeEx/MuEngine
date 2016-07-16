USE MUONLINE

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


/****** dbo.WZ_PeriodItemUpdate ******/
ALTER procedure [dbo].[WZ_PeriodItemUpdate]
	@UserGuid	int,
	@CharacterName varchar(10),
	@ItemCode	int,
	@UsedTime	int,
	@LeftTime	int
as 
BEGIN
	DECLARE @ErrorCode int
	DECLARE @ItemInfoCount int
	DECLARE @RetLeftTime int

	SET @ErrorCode = 0
	SET @ItemInfoCount = 0
	SET @RetLeftTime = 0

	SET XACT_ABORT ON

	Set nocount on

	begin transaction

	SELECT @ItemInfoCount = COUNT(*) FROM T_PeriodItemInfo where ItemCode = @ItemCode AND CharacterName = @CharacterName AND UsedInfo = 1

	IF( @ItemInfoCount <> 1 )
	BEGIN
		SET @ErrorCode = 1
	END
	ELSE
	BEGIN
		UPDATE T_PeriodItemInfo SET UsedTime = UsedTime + @UsedTime, LeftTime = @LeftTime WHERE UserGuid = @UserGuid AND CharacterName = @CharacterName AND ItemCode = @ItemCode AND UsedInfo = 1
		IF( @@Error <> 0 )
		BEGIN
			SET @ErrorCode = 2
		END
	END

	SELECT @RetLeftTime = LeftTime FROM T_PeriodItemInfo where UserGuid = @UserGuid AND CharacterName = @CharacterName AND ItemCode = @ItemCode AND UsedInfo = 1
	IF ( @RetLeftTime <= 0 )
	BEGIN
		DELETE FROM T_PeriodItemInfo WHERE UserGuid = @UserGuid AND CharacterName = @CharacterName AND ItemCode = @ItemCode AND UsedInfo = 1
		SET @ErrorCode = 3
	END

	IF ( @ErrorCode  <> 0  AND @ErrorCode <> 3 )
		rollback transaction
	ELSE
		commit transaction

	select @ErrorCode

	Set 	nocount off 
	SET XACT_ABORT OFF
END