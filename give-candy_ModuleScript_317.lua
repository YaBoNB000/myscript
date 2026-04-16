-- give-candy (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-candy",
	["Aliases"] = {},
	["Description"] = "Gives a user candy.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player who is being given candy"
		},
		{
			["Type"] = "number",
			["Name"] = "candy",
			["Description"] = "The amount of candy being given."
		}
	}
}
return v1