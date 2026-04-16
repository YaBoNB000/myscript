-- global-trigger-event (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "global-trigger-event",
	["Aliases"] = {},
	["Description"] = "Triggers a global event.",
	["Group"] = "Developer",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "event",
			["Description"] = "The event youw ant to trigger."
		}
	}
}
return v1