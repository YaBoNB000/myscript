-- print-trades (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "print-trades",
	["Aliases"] = {},
	["Description"] = "Prints the trades of a player.",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player-to-print",
			["Description"] = "The player whose trades will be printed."
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