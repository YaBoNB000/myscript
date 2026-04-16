-- permaban (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "permaban",
	["Aliases"] = {},
	["Description"] = "Permabans a user from the game.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "username-to-ban",
			["Description"] = "The username to permaban"
		}
	}
}
return v1