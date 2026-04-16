-- give-cash-offline (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-cash-offline",
	["Aliases"] = {},
	["Description"] = "Gives a user cash while offline.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "target-username",
			["Description"] = "The username (not DisplayName) who is being given cash"
		},
		{
			["Type"] = "number",
			["Name"] = "cash",
			["Description"] = "The amount of cash being given."
		}
	}
}
return v1