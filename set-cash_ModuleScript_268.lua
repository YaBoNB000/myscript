-- set-cash (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "set-cash",
	["Aliases"] = {},
	["Description"] = "Sets a user\'s cash.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player whose cash is set"
		},
		{
			["Type"] = "number",
			["Name"] = "cash",
			["Description"] = "The amount of cash being set to."
		}
	}
}
return v1