-- set-countdown-time (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "set-countdown-time",
	["Aliases"] = {},
	["Description"] = "Sets the global countdown time.",
	["Group"] = "Developer",
	["Args"] = {
		{
			["Type"] = "number",
			["Name"] = "seconds",
			["Description"] = "The number of seconds to set the countdown. -1 stops the countdown."
		}
	}
}
return v1