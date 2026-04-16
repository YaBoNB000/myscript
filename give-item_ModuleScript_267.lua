-- give-item (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-item",
	["Aliases"] = {},
	["Description"] = "Gives an item to a user.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "target-players",
			["Description"] = "The players who receives the item"
		},
		{
			["Type"] = "string",
			["Name"] = "item-to-give",
			["Description"] = "The name of the item to give"
		}
	}
}
return v1