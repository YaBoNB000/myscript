-- print-data (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "print-data",
	["Aliases"] = {},
	["Description"] = "Prints the data of a player.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player-to-print",
			["Description"] = "The player whose data will be printed."
		}
	}
}
return v1