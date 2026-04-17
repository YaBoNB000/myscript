-- wipe-data (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "wipe-data",
	["Aliases"] = {},
	["Description"] = "DO NOT RUN IN A PUBLIC SERVER! Wipes the data of a player.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player-to-wipe",
			["Description"] = "DO NOT RUN IN A PUBLIC SERVER! The player whose data will be wiped."
		}
	}
}
return v1