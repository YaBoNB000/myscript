-- ban (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "ban",
	["Aliases"] = {},
	["Description"] = "Bans a user from the game.",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "username-to-ban",
			["Description"] = "The username to ban"
		},
		{
			["Type"] = "number",
			["Name"] = "hours",
			["Description"] = "Length of ban (in hours). Capped at 14 days"
		}
	}
}
return v1