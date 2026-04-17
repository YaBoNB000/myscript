-- trigger-event (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "trigger-event",
	["Aliases"] = {},
	["Description"] = "Triggers an event.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "event-name",
			["Description"] = "Name of the event to trigger."
		}
	}
}
return v1