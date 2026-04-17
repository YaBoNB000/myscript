-- unban (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "unban",
	["Aliases"] = {},
	["Description"] = "Unbans a user from the game.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "username-to-ban",
			["Description"] = "The username to unban"
		}
	}
}
return v1