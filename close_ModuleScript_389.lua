-- close (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

return {
	["Name"] = "close",
	["Description"] = "Closes the Cmdr menu.",
	["Group"] = "Help",
	["Args"] = {},
	["ClientRun"] = function(p1, _)
		if p1.Cmdr and p1.Cmdr.Hide then
			p1.Cmdr:Hide()
		end
		return ""
	end
}