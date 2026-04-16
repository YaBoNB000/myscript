-- kick (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "kick",
	["Aliases"] = { "boot" },
	["Description"] = "Kicks a player or set of players.",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "players",
			["Description"] = "The players to kick."
		}
	}
}
return v1