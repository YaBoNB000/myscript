-- god-mode (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "god-mode",
	["Aliases"] = {},
	["Description"] = "Toggles god mode",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player who becomes god"
		}
	}
}
return v1