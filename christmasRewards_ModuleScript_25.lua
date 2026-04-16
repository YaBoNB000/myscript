-- christmasRewards (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > Christmas
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v3 = v2("houses")
local v4 = v2("skins")
local v5 = {
	["GingerbreadHouse"] = {
		["displayName"] = "Gingerbread House + Santa Sleigh",
		["cash"] = 0,
		["gingerbread"] = v3.models.GingerbreadHouse.gingerbreadPrice
	},
	["ChristmasCase"] = {
		["displayName"] = "Christmas Case",
		["gingerbread"] = v4.cases.Christmas.gingerbreadPrice
	},
	["SubzeroSkins"] = {
		["displayName"] = "Subzero AWP + FN FAL",
		["gingerbread"] = 250000
	},
	["SnowflakeBalloon"] = {
		["displayName"] = "Snowflake Balloon",
		["gingerbread"] = 50000
	}
}
return v5