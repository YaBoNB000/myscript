-- halloweenRewards (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > Halloween
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v3 = v2("houses")
local v4 = v2("skins")
local v5 = {
	["PumpkinCottage"] = {
		["displayName"] = "Pumpkin Cottage + Hot Rod",
		["cash"] = v3.models.PumpkinCottage.price,
		["candy"] = v3.models.PumpkinCottage.candyPrice
	},
	["HalloweenCase"] = {
		["displayName"] = "Halloween Case",
		["candy"] = v4.cases.Halloween.candyPrice
	},
	["EtherealSkins"] = {
		["displayName"] = "Ethereal AUG + AS Val",
		["candy"] = 250000
	},
	["SkullBalloon"] = {
		["displayName"] = "Skull Balloon",
		["candy"] = 50000
	}
}
return v5