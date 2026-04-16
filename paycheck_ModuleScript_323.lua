-- paycheck (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "paycheck",
	["Aliases"] = {},
	["Description"] = "Gives a user 250k cash (can only be used once a week).",
	["Group"] = "Hero",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "target-player",
			["Description"] = "The player who is being given cash"
		}
	}
}
return v1