USE [MuOnline]

CREATE INDEX I_CashShopInventory ON CashShopInventory(AccountId)
CREATE INDEX I_CireExWare ON CireExWare(AccountId)
CREATE INDEX I_GuildExtWare ON GuildExtWare(GuildName)
CREATE INDEX I_CireGamble1 ON CireGamble1([name])

USE [Me_MuOnline] -- comment this if you are using 1DB
ALTER TABLE MEMB_CREDITS ADD PRIMARY KEY (memb___id) -- comment this if you dont have MEMB_CREDITS
CREATE INDEX I_ItemInsurance ON ItemInsurance([memb___id])
