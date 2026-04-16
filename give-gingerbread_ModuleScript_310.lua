-- give-gingerbread (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-gingerbread",
	["Aliases"] = {},
	["Description"] = "Gives a user gingerbread.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player who is being given gingerbread"
		},
		{
			["Type"] = "number",
			["Name"] = "gingerbread",
			["Description"] = "The amount of gingerbread being given."
		}
	}
}
return v1