-- server-msg (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "server-msg",
	["Aliases"] = {},
	["Description"] = "Sends a server message.",
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