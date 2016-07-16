USE [MuOnline]
GO
/****** Object:  StoredProcedure [dbo].[WZ_PeriodItemInsert]    Script Date: 07/30/2014 20:19:05 ******/
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

	IF ( @ItemCode = 6700 OR @ItemCode = 6750 )
		BEGIN
			UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE (ItemCode=@ItemCode-1 OR ItemCode=@ItemCode) AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
			IF ( @ItemCode = 6750 )
				BEGIN
					UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE (ItemCode=6700 OR ItemCode=6699) AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
				END
		END
	
	ELSE IF ( @ItemCode = 6699 OR @ItemCode = 6749 )
		BEGIN
			UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE (ItemCode=@ItemCode+1 OR ItemCode=@ItemCode) AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
			IF ( @ItemCode = 6749 )
				BEGIN
					UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE (ItemCode=6700 OR ItemCode=6699) AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
				END
		END
	ELSE IF ( @ItemCode = 6718 )
		BEGIN
			UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE ItemCode=6719 AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
		END
	ELSE IF ( @ItemCode = 6719 )
		BEGIN
			UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE ItemCode=6718 AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
		END
	ELSE IF ( @ItemCode = 7422 )
		BEGIN
			UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE ItemCode=7422 AND UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
		END
	ELSE
		BEGIN
			UPDATE T_PeriodItemInfo SET UsedInfo = 0 WHERE UserGuid = @UserGuid AND CharacterName = @CharacterName AND OptionType = @OptionType AND UsedInfo = 1
		END


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
