-- global-msg (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "global-msg",
	["Aliases"] = {},
	["Description"] = "Sends a global message.",
	["Group"] = "Admin",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "message",
			["Description"] = "The message you want to send."
		}
	}
}
return v1