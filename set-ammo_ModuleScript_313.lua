-- set-ammo (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "set-ammo",
	["Aliases"] = {},
	["Description"] = "Sets a user\'s ammo.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player whose ammo is set"
		},
		{
			["Type"] = "number",
			["Name"] = "ammo",
			["Description"] = "The amount of ammo being set to."
		}
	}
}
return v1