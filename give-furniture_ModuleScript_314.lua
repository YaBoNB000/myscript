-- give-furniture (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-furniture",
	["Aliases"] = {},
	["Description"] = "Gives a furniture to a user.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "target-players",
			["Description"] = "The players who receives the furniture"
		},
		{
			["Type"] = "string",
			["Name"] = "furniture-to-give",
			["Description"] = "The name of the furniture to give"
		}
	}
}
return v1