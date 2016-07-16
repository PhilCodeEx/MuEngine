USE [MuOnline]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[WZ_PeriodItemInsert]
	@UserGuid	int,
	@CharacterName	varchar(10),
	@ItemCode	int,
	@OptionType	tinyint,
	@EffectType1	tinyint,
	@EffectType2	tinyint,
	@TotalUsePeriod	int,
	@ExpireDate	varchar(20)
as
BEGIN
	DECLARE @ErrorCode int
	DECLARE @PeriodItemIndex int

	SET @ErrorCode = 0
	SET @PeriodItemIndex = 0

	SET XACT_ABORT ON
	Set		nocount on 		
	begin transaction

	UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE ItemCode = @ItemCode AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1

	INSERT INTO T_PeriodItemInfo (UserGuid, CharacterName, ItemCode, OptionType, EffectType1, EffectType2, LeftTime, BuyDate, ExpireDate, UsedInfo) VALUES
	( @UserGuid, @CharacterName, @ItemCode, @OptionType, @EffectType1, @EffectType2, @TotalUsePeriod, GETDATE(), @ExpireDate, 1 )
	IF( @@Error <> 0 )
	BEGIN
		SET @ErrorCode = 2
	END

	IF ( @ErrorCode  <> 0 )
		rollback transaction
	ELSE
		commit transaction

	SELECT @ErrorCode

	Set 	nocount off 
	SET XACT_ABORT OFF
END
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

