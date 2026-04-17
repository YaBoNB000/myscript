-- spectate (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "spectate",
	["Aliases"] = {},
	["Description"] = "Spectates a user",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to spectate"
		}
	}
}
return v1