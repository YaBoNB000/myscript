-- data (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > globals
-- Original

local v1 = {
	["money"] = 100,
	["xp"] = 0,
	["strength"] = 1,
	["inventory"] = {},
	["pastPurchases"] = {},
	["gamepasses"] = {},
	["skinPacks"] = {},
	["equippedSkins"] = {},
	["ownedSkins"] = {},
	["ownedCases"] = {},
	["ownedItems"] = {},
	["skinColors"] = {},
	["atmData"] = {},
	["bankData"] = {
		["bankCash"] = 0,
		["lastRobbed"] = 0
	},
	["uniqueSkins"] = {},
	["rollData"] = {
		["rollsSinceUnique"] = 0,
		["rollsSinceRare"] = 0,
		["rollsSinceEpic"] = 0,
		["rollsSinceMythic"] = 0,
		["rollsSinceLegendary"] = 0
	},
	["wallet"] = "Wallet",
	["phone"] = "rPhone"
}
local v2 = {
	["house"] = {
		["billboardText"] = "",
		["modelName"] = "DefaultHouse",
		["state"] = {}
	},
	["furniture"] = {
		["RedBed"] = 1,
		["RedCouch"] = 1,
		["SideTable"] = 2,
		["Workbench"] = 1
	}
}
local v3 = {
	["DefaultHouse"] = {
		["placedFurniture"] = {},
		["colors"] = {},
		["unlocks"] = {}
	}
}
v2.houseSaves = v3
v2.base = {
	["placedFurniture"] = {},
	["colors"] = {},
	["unlocks"] = {}
}
v2.room = {
	["placedFurniture"] = {},
	["colors"] = {},
	["unlocks"] = {}
}
v1.housing = v2
v1.statistics = {}
v1.dealer = {
	["restockTime"] = -1,
	["stock"] = {}
}
v1.slotMachine = {
	["restockTime"] = -1,
	["spins"] = 5
}
v1.rewards = {
	["currentDay"] = 1,
	["playtimeRewards"] = {},
	["dailyRewards"] = {}
}
v1.playtimeRewards = {}
v1.newbieItemsClaimed = {}
v1.adminMoney = {}
v1.tradeHistory = {}
v1.loginTime = 0
v1.loginStreak = 1
v1.topLoginStreak = 1
v1.atmsRobbed = 0
v1.gunSales = 0
v1.gunCommissions = 0
v1.jobEarnings = 0
v1.airdrops = 0
v1.casesOpened = 0
v1.gemsRobbed = 0
v1.firstPlayed = 0
v1.lastPlayed = 0
v1.playtime = 0
v1.totalMoneyEarned = 0
v1.lastRewardClaimed = 0
v1.lastDroppedCash = 0
v1.alreadyDropped = 0
v1.dropAnchorTime = 0
v1.alreadySold = 0
v1.sellAnchorTime = 0
v1.lastPaycheckGiven = os.clock()
v1.robuxSpent = 0
v1.receivedGroupAward = false
v1.lockerSlots = -1
v1.invites = 0
v1.invitedPlayers = {}
v1.furnitureSpace = 0
v1.updateLog = 0
v1.emotes = {}
v1.codes = {}
v1.settings = {}
v1.tutorialFinished = false
v1.tutorialCash = 0
v1.easter2023 = {
	["hasStarted"] = false,
	["eggs"] = {}
}
v1.pinata2023 = {
	["pinatasBroken"] = {},
	["pinatas"] = {}
}
v1.firework2023 = {}
v1.limitedUGCEvent = {
	["playtime"] = 0,
	["oreMined"] = 0,
	["safesCracked"] = 0,
	["claimedUGC"] = false,
	["claimedSkin"] = false
}
v1.halloween2023 = {
	["candy"] = 0,
	["totalCandy"] = 0,
	["questsComplete"] = {},
	["rewardsClaimed"] = {},
	["candyBowls"] = {},
	["candyBowlReset"] = 0
}
v1.clan = {
	["points"] = {},
	["pointsEarnedSeason"] = -1,
	["seasonLog"] = {},
	["firstTime"] = true,
	["memberSlots"] = 10
}
v1.sewer = {
	["kills"] = 0,
	["deaths"] = 0
}
v1.adventCalendar2023 = {}
v1.christmas2023 = {
	["gingerbread"] = 0,
	["totalGingerbread"] = 0,
	["questsComplete"] = {},
	["rewardsClaimed"] = {},
	["foundElfs"] = {}
}
v1.valentines2024 = {
	["playtime"] = 0,
	["safesCracked"] = 0,
	["gemsRobbed"] = 0,
	["claimedSkin"] = false
}
v1.crafting = {
	["components"] = {},
	["craftCounts"] = {}
}
v1.easter2024 = {
	["eggs"] = {}
}
v1.treasure2024 = {
	["treasureSpawns"] = {
		"TreasureSpawn1",
		"TreasureSpawn12",
		"TreasureSpawn15",
		"TreasureSpawn17",
		"TreasureSpawn18",
		"TreasureSpawn3",
		"TreasureSpawn21",
		"TreasureSpawn23",
		"TreasureSpawn6",
		"TreasureSpawn7",
		"TreasureSpawn25",
		"TreasureSpawn26"
	},
	["numTreasure"] = 12,
	["claimedReward"] = false,
	["isStarted"] = false
}
v1.halloween2024 = {
	["candy"] = 0,
	["totalCandy"] = 0,
	["questsComplete"] = {},
	["rewardsClaimed"] = {},
	["candyBowls"] = {},
	["candyBowlReset"] = 0,
	["mobCount"] = 0,
	["mobRespawnTime"] = 0
}
v1.adventCalendar2024 = {}
v1.christmas2024 = {
	["gingerbread"] = 0,
	["totalGingerbread"] = 0,
	["questsComplete"] = {},
	["rewardsClaimed"] = {},
	["foundElfs"] = {},
	["mobCount"] = 0,
	["mobRespawnTime"] = 0
}
v1.easter2025 = {
	["eggs"] = {}
}
v1.easterSecret2025 = {
	["eggs"] = {}
}
v1.firework2025 = {}
v1.halloween2025 = {
	["candy"] = 0,
	["candyCollected"] = 0,
	["totalCandy"] = 0,
	["questsComplete"] = {},
	["rewardsClaimed"] = {},
	["candyBowls"] = {},
	["candyBowlReset"] = 0,
	["mobCount"] = 0,
	["mobRespawnTime"] = 0
}
v1.adventCalendar2025 = {}
v1.christmas2025 = {
	["gingerbread"] = 0,
	["gingerbreadCollected"] = 0,
	["totalGingerbread"] = 0,
	["questsComplete"] = {},
	["rewardsClaimed"] = {},
	["foundElfs"] = {},
	["mobCount"] = 0,
	["mobRespawnTime"] = 0
}
v1.lunarNewYear2026 = {
	["lanterns"] = {},
	["playtime"] = 0,
	["hasClaimedReward"] = false
}
v1.easter2026 = {
	["eggs"] = {}
}
v1.easterSecret2026 = {
	["eggs"] = {}
}
v1.dailyLimits = {
	["lastReset"] = 0,
	["purchases"] = {}
}
return v1