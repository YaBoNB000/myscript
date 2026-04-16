-- print-data-offline (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "print-data-offline",
	["Aliases"] = {},
	["Description"] = "Prints the data of a player offline.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "target-username",
			["Description"] = "The username (not DisplayName) who is being checked"
		}
	}
}
return v1