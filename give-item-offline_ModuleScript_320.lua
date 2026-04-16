-- give-item-offline (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-item-offline",
	["Aliases"] = {},
	["Description"] = "Gives an item to a user offline.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "target-username",
			["Description"] = "The username (not DisplayName) who is being given"
		},
		{
			["Type"] = "string",
			["Name"] = "item-to-give",
			["Description"] = "The name of the item to give"
		}
	}
}
return v1