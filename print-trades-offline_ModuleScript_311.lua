-- print-trades-offline (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "print-trades-offline",
	["Aliases"] = {},
	["Description"] = "Prints the trades of a player offline.",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "target-username",
			["Description"] = "The username (not DisplayName) who is being checked"
		},
		{
			["Type"] = "string",
			["Name"] = "player",
			["Description"] = "Optionally the other players username.",
			["Optional"] = true
		}
	}
}
return v1