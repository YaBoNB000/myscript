-- view-inventory (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "view-inventory",
	["Aliases"] = {},
	["Description"] = "View a players inventory.",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to view"
		}
	}
}
return v1