-- invisible (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local _ = game:GetService("Players").LocalPlayer
game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
require(v1.devv).load("Maid").new()
return {
	["Name"] = "invisible",
	["Aliases"] = {},
	["Description"] = "Toggle invisible mode",
	["Group"] = "Admin",
	["Args"] = {}
}