-- reset-candy (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "reset-candy",
	["Aliases"] = {},
	["Description"] = "Reset a user\'s candy.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player whose candy is being reset"
		}
	}
}
return v1