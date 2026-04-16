-- give-cash (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-cash",
	["Aliases"] = {},
	["Description"] = "Gives a user cash.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player who is being given cash"
		},
		{
			["Type"] = "number",
			["Name"] = "cash",
			["Description"] = "The amount of cash being given."
		}
	}
}
return v1