-- give-skin (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-skin",
	["Aliases"] = {},
	["Description"] = "Gives a skin to a user.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player who receives the skin"
		},
		{
			["Type"] = "string",
			["Name"] = "item-name",
			["Description"] = "The name of the item to give the skin for (NO SPACES)"
		},
		{
			["Type"] = "string",
			["Name"] = "skin-name",
			["Description"] = "The name of the skin to give"
		}
	}
}
return v1