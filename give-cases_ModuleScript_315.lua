-- give-cases (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-cases",
	["Aliases"] = {},
	["Description"] = "Gives a user cases.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player who is being given cases"
		},
		{
			["Type"] = "string",
			["Name"] = "case-type",
			["Description"] = "The type of case being given."
		},
		{
			["Type"] = "number",
			["Name"] = "num-cases",
			["Description"] = "The amount of cases being given."
		}
	}
}
return v1