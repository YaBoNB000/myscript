-- globals (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = {
	["BUILD"] = "1.0.4",
	["DATA"] = require(script.data),
	["CHAT"] = {
		["BUBBLE_CHAT_ENABLED"] = true
	}
}
local v2 = {
	["Criminals"] = {
		["COLOR"] = BrickColor.new("Bright red"),
		["AUTOASSIGNABLE"] = true,
		["LIMIT"] = 999
	}
}
v1.TEAMS = v2
v1.CASH = {
	["DROP_PERCENTAGE"] = 0.7,
	["DROP_MINIMUM"] = 100,
	["DROP_LIMIT"] = 20000,
	["DROP_DELAY"] = 20,
	["DROP_LIMIT_RESET_DELAY"] = 3600,
	["SELL_LIMIT"] = 50000,
	["SELL_LIMIT_RESET_DELAY"] = 21600
}
v1.RESPAWN_TIME = 2.5
v1.MAX_SERVER_LIFETIME = 24
v1.BACKPACK_SLOTS = 32
v1.LOCKER_SLOTS = 48
v1.LOCKER_SLOTS_IN_TIER = 4
v1.DEFAULT_LOCKER_SLOTS = 4
v1.NOT_STASHABLE = {
	"Fists",
	"Wallet",
	"Medkit",
	"Boombox",
	"Airstrike Marker",
	"Admin AK-47",
	"Admin Nuke Launcher",
	"Admin RPG",
	"Infinite C4",
	"Infinite Airstrike",
	"Infinite NextBot",
	"Armored Truck Key",
	"Supercar Key",
	"Black Chopper Key",
	"Santa Sleigh Key",
	"Duffel Bag",
	"Briefcase Of Cash",
	"X-Ray Goggles",
	"Dollar Balloon"
}
v1.DEFAULT_HEALTH = 150
v1.FORCE_BREAK_PROTECTION = 600
v1.UPDATE_LOG = 51
v1.LOOT = {
	["GLOBAL_LOOT_MODIFIER_GUNS"] = 0.7,
	["GLOBAL_LOOT_MODIFIER_MELEE"] = 1,
	["GLOBAL_LOOT_MODIFIER_CONSUMABLES"] = 1,
	["GLOBAL_LOOT_MODIFIER_THROWABLES"] = 1.2,
	["GLOBAL_LOOT_MODIFIER_SPECIAL"] = 1,
	["GLOBAL_LOOT_MODIFIER_SAFE"] = 1,
	["GLOBAL_LOOT_MODIFIER_SEWER"] = 0.1
}
v1.STRENGTH_LIMITS = {
	["SKINNY"] = 0.45,
	["STRONG"] = 1.3
}
v1.DEALER_RESTOCK_TIME = 14400
v1.DEALER_DISCOUNT = 0.1
v1.HOUSE = {
	["RENT_COST"] = 300
}
v1.BASE = {
	["RENT_COST"] = 300
}
v1.ROOM = {
	["RENT_COST"] = 100
}
v1.SLOT_MACHINE = {
	["SPINS"] = 5,
	["RESTOCK_TIME"] = 3600
}
v1.INVITES = {
	["MAX_INVITES"] = 5,
	["CASH"] = 1000
}
v1.TRADING = {
	["MIN_ACCOUNT_AGE"] = 14,
	["MAX_SLOTS"] = 8
}
v1.SKIN_SELL_CASH = {
	["Common"] = 500,
	["Rare"] = 3600,
	["Epic"] = 19000,
	["Mythic"] = 48000,
	["Legendary"] = 120000
}
v1.MAX_AMMO_BOXES = 5
v1.TUTORIAL = {
	["MAX_CASH"] = 1500
}
local v3 = {
	["ID"] = 14559645454,
	["STOCK_STRING"] = "3K",
	["ACCESSORY_NAME"] = "Dollar Balloon",
	["QUESTS"] = {
		["playtime"] = 43200,
		["oreMined"] = 200,
		["safesCracked"] = 30
	}
}
v1.LIMITED_UGC = v3
v1.ADMIN_MAX = {
	["cashGiven"] = 500000,
	["candyGiven"] = 500000,
	["gingerbreadGiven"] = 500000,
	["casesGiven"] = 40,
	["skinsGiven"] = 2,
	["paycheckModeratorAmount"] = 250000,
	["paycheckAmount"] = 100000,
	["paycheckInterval"] = 604800,
	["paychecksPerInterval"] = 5
}
v1.ADMIN_RESET_TIME = 28800
local v4 = {
	["TAG_LENGTH"] = NumberRange.new(1, 8),
	["NAME_LENGTH"] = NumberRange.new(1, 20),
	["DESCRIPTION_LENGTH"] = NumberRange.new(0, 100),
	["RANK_LENGTH"] = NumberRange.new(0, 12),
	["CHAT_LENGTH"] = NumberRange.new(1, 140),
	["MIN_ACCOUNT_AGE"] = 14,
	["COST"] = 20000,
	["MAX_MEMBERS"] = 200,
	["NUM_SEASON_CLANS"] = 200,
	["POINTS"] = {
		["PLAYTIME"] = 15,
		["PLAYTIME_INTERVAL"] = 300,
		["SEWER_KILL"] = 45,
		["BANK"] = 250,
		["SEWER_ATM"] = 5
	}
}
v1.CLAN = v4
v1.RESET_KDR_COST = 400000
v1.MANUALLY_REPLICATED = {
	"Items",
	"Houses",
	"Furniture",
	"Clothing",
	"Vehicles",
	"ServerModels"
}
v1.CAMERA_ZOOM = {
	["MIN"] = 0.5,
	["MAX"] = 32
}
v1.PLACE_IDS = {
	["MAIN_PLACE_ID"] = 7239319209,
	["NEW_PLAYER_SERVER_ID"] = 14767933027,
	["VOICE_SERVER_ID"] = 11958318242,
	["TEST_SERVER_ID"] = 15180005553
}
v1.CHRISTMAS_COUNTDOWN_TIME = DateTime.fromUniversalTime(2024, 12, 13, 23, 0, 0).UnixTimestamp
v1.LUNAR_EVENT = {
	["LANTERN_COUNT"] = 25,
	["PLAYTIME_REQUIREMENT"] = 43200
}
v1.EASTER_EVENT = {
	["NUM_EGGS"] = 50,
	["REWARD_1_EGGS"] = 20,
	["REWARD_2_EGGS"] = 50
}
return v1