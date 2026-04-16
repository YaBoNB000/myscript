-- kickServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Admin
-- Original

return function(_, p1)
	for _, v2 in pairs(p1) do
		v2:Kick("Kicked by admin.")
	end
	return ("Kicked %d players."):format(#p1)
end