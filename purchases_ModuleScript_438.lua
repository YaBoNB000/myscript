-- purchases (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v_u_1 = {
	["cash"] = {
		{
			["id"] = 1337285519,
			["cash"] = 20000
		},
		{
			["id"] = 1337285595,
			["cash"] = 200000
		},
		{
			["id"] = 1337285652,
			["cash"] = 400000
		},
		{
			["id"] = 1337285726,
			["cash"] = 1000000
		},
		{
			["id"] = 1559788888,
			["cash"] = 2500000
		}
	},
	["candy"] = {
		{
			["id"] = 1666184483,
			["candy"] = 10000
		},
		{
			["id"] = 1666197076,
			["candy"] = 50000
		},
		{
			["id"] = 1666197152,
			["candy"] = 250000
		},
		{
			["id"] = 1666197193,
			["candy"] = 1000000
		}
	},
	["gingerbread"] = {
		{
			["id"] = 1702766072,
			["gingerbread"] = 10000
		},
		{
			["id"] = 1702766172,
			["gingerbread"] = 50000
		},
		{
			["id"] = 1702766272,
			["gingerbread"] = 250000
		},
		{
			["id"] = 1702766337,
			["gingerbread"] = 1000000
		}
	}
}
local v2 = {
	["boombox"] = {
		["displayName"] = "Boombox",
		["id"] = 104013310
	},
	["bat"] = {
		["displayName"] = "Baseball Bat",
		["id"] = 104013339
	},
	["blade"] = {
		["displayName"] = "Knife",
		["id"] = 104013409
	},
	["medkit"] = {
		["displayName"] = "Medkit",
		["id"] = 104013365
	},
	["paycheck"] = {
		["displayName"] = "Paycheck",
		["id"] = 112147656
	},
	["premium"] = {
		["displayName"] = "Premium",
		["id"] = 114320362
	},
	["mobileDealer"] = {
		["displayName"] = "mobileDealer",
		["id"] = 132121050
	},
	["skateboard"] = {
		["displayName"] = "Skateboard",
		["id"] = 132104201
	},
	["advancedBuilding"] = {
		["displayName"] = "advancedBuilding",
		["id"] = 744076957
	}
}
v_u_1.gamepass = v2
local v3 = {
	["suitcaseNuke"] = {
		["displayName"] = "Suitcase Nuke",
		["id"] = 1337288545
	},
	["dailyPrinter"] = {
		["displayName"] = "Daily Printer",
		["id"] = 3261641909
	},
	["moneyPrinter"] = {
		["displayName"] = "Money Printer",
		["id"] = 1337288791
	},
	["moneyPrinter10"] = {
		["displayName"] = "Money Printer (x10)",
		["id"] = 1551373665
	},
	["helicopter"] = {
		["displayName"] = "Helicopter",
		["id"] = 1337288916
	},
	["car"] = {
		["displayName"] = "Car",
		["id"] = 1337289012
	},
	["nextBotNade"] = {
		["displayName"] = "Nextbot Nade",
		["id"] = 1348260623
	},
	["nukeLauncher"] = {
		["displayName"] = "Nuke Launcher",
		["id"] = 1349926569
	},
	["premiumEmotes"] = {
		["displayName"] = "Premium Emotes",
		["id"] = 1411326171
	},
	["giveEveryoneCash"] = {
		["displayName"] = "Give Everyone $2,000",
		["id"] = 1504788403
	},
	["furnitureSpace"] = {
		["displayName"] = "+10 Furniture Space",
		["id"] = 1534531810
	},
	["cruiser"] = {
		["displayName"] = "Cruiser",
		["id"] = 1649412046
	},
	["skipQuest"] = {
		["displayName"] = "Skip Quest",
		["id"] = 1666133254
	},
	["unlockAdventReward"] = {
		["displayName"] = "Unlock Advent Reward",
		["id"] = 1696092494
	}
}
v_u_1.special = v3
local v4 = {
	["saberCrate"] = {
		["id"] = 1534499711
	}
}
v_u_1.limited = v4
local v5 = {
	["tier2Slot"] = {
		["id"] = 1362482019
	},
	["tier3Slot"] = {
		["id"] = 1362482081
	},
	["tier4Slot"] = {
		["id"] = 1362482114
	},
	["tier5Slot"] = {
		["id"] = 1539375178
	},
	["tier6Slot"] = {
		["id"] = 3535771240
	},
	["allPage1"] = {
		["id"] = 1362482775
	},
	["allPage2"] = {
		["id"] = 1539461001
	},
	["allPage3"] = {
		["id"] = 3535771920
	}
}
v_u_1.locker = v5
local v6 = {
	["CyberpunkPack1"] = {
		["displayName"] = "Cyberpunk 1",
		["id"] = 1512922858
	},
	["CyberpunkPack2"] = {
		["displayName"] = "Cyberpunk 2",
		["id"] = 1512924005
	},
	["AtomicAmethystPack"] = {
		["displayName"] = "Atomic Amethyst",
		["id"] = 1560399131
	},
	["AtomicWaterPack"] = {
		["displayName"] = "Atomic Water",
		["id"] = 1560400194
	},
	["AtomicFlamePack"] = {
		["displayName"] = "Atomic Flame",
		["id"] = 1560399587
	},
	["AtomicNaturePack"] = {
		["displayName"] = "Atomic Nature",
		["id"] = 1560399700
	},
	["FutureWhitePack"] = {
		["displayName"] = "Future White",
		["id"] = 1592858426
	},
	["FutureBlackPack"] = {
		["displayName"] = "Future Black",
		["id"] = 1592858569
	},
	["TacticalPack1"] = {
		["displayName"] = "Tactical Pack 1",
		["id"] = 1636615479
	},
	["TacticalPack2"] = {
		["displayName"] = "Tactical Pack 2",
		["id"] = 1636615609
	},
	["ReaperPack"] = {
		["displayName"] = "Reaper Pack",
		["id"] = 1661471746
	},
	["SteampunkPack"] = {
		["displayName"] = "Steampunk Pack",
		["id"] = 1686239247
	},
	["SubzeroPack"] = {
		["displayName"] = "Subzero Pack",
		["id"] = 1697731298
	},
	["ElitePack"] = {
		["displayName"] = "Elite Pack",
		["id"] = 1728477635
	},
	["SakuraPack"] = {
		["displayName"] = "Sakura Pack",
		["id"] = 1750545497
	},
	["RosePack"] = {
		["displayName"] = "Rose Pack",
		["id"] = 2979625451
	},
	["LuckyCloverPack"] = {
		["displayName"] = "Lucky Clover Pack",
		["id"] = 3238529355
	},
	["PixelPack"] = {
		["displayName"] = "Pixel Pack",
		["id"] = 3261637600
	},
	["WastelandPack"] = {
		["displayName"] = "Wasteland Pack",
		["id"] = 1790222348
	},
	["MysticPack"] = {
		["displayName"] = "Mystic Pack",
		["id"] = 1834776796
	},
	["PiratePack"] = {
		["displayName"] = "Pirate Pack",
		["id"] = 1857311088
	},
	["BiohazardPack"] = {
		["displayName"] = "Biohazard Pack",
		["id"] = 1909935699
	},
	["VoidNightmarePack"] = {
		["displayName"] = "Void Nightmare Pack",
		["id"] = 2152588640
	},
	["WW2Pack"] = {
		["displayName"] = "World War 2 Pack",
		["id"] = 2657771325
	},
	["GingerbreadGunPack"] = {
		["displayName"] = "Gingerbread Gun Pack",
		["id"] = 2673335495
	},
	["FreezeRayPack"] = {
		["displayName"] = "Freeze-Ray Pack",
		["id"] = 2673336242
	},
	["HyperlaserPack"] = {
		["displayName"] = "Hyperlaser Pack",
		["id"] = 2697166536
	},
	["TacticalPack3"] = {
		["displayName"] = "Tactical Pack 3",
		["id"] = 3291221814
	},
	["PatriotPack"] = {
		["displayName"] = "Patriot Pack",
		["id"] = 3322964388
	},
	["GoldenDragonPack"] = {
		["displayName"] = "Golden Dragon Pack",
		["id"] = 3535756383
	},
	["SakuraPack2"] = {
		["displayName"] = "Sakura Pack 2",
		["id"] = 3535756748
	},
	["ToonPack"] = {
		["displayName"] = "Toon Pack",
		["id"] = 3570381891
	}
}
v_u_1.skinPacks = v6
local v7 = {
	["premium"] = {
		["displayName"] = "Premium",
		["id"] = 1559928570
	},
	["mobileDealer"] = {
		["displayName"] = "Mobile Dealer",
		["id"] = 1559928693
	},
	["skateboard"] = {
		["displayName"] = "Skateboard",
		["id"] = 1559928786
	}
}
v_u_1.gifts = v7
if game:GetService("RunService"):IsServer() then
	task.defer(function()
		-- upvalues: (copy) v_u_1
		local v8 = game:GetService("ReplicatedStorage")
		local v_u_9 = require(v8.devv).load("GetProductInfo")
		local function v14(p10, p11)
			-- upvalues: (copy) v_u_9
			for _, v12 in pairs(p10) do
				local v13 = v_u_9(v12.id, p11)
				if v13 and v13.IsForSale then
					v12.price = v13.PriceInRobux
				else
					v12.price = -1
				end
			end
		end
		v14(v_u_1.cash, Enum.InfoType.Product)
		v14(v_u_1.gamepass, Enum.InfoType.GamePass)
		v14(v_u_1.special, Enum.InfoType.Product)
		v14(v_u_1.locker, Enum.InfoType.Product)
		v14(v_u_1.skinPacks, Enum.InfoType.Product)
		v14(v_u_1.gifts, Enum.InfoType.Product)
	end)
end
return v_u_1