-- give-skin-offline (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "give-skin-offline",
	["Aliases"] = {},
	["Description"] = "Give a skin to a user while offline.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "target-username",
			["Description"] = "The username (not DisplayName) who is being given the skin"
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