-- trigger-clan-season (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v1 = {
	["Name"] = "trigger-clan-season",
	["Aliases"] = {},
	["Description"] = "Triggers a new clan season.",
	["Group"] = "Developer",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "password",
			["Description"] = ""
		},
		{
			["Type"] = "number",
			["Name"] = "season-id",
			["Description"] = "The season to give rewards for."
		}
	}
}
return v1