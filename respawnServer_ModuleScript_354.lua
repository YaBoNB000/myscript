-- respawnServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Admin
-- Original

return function(_, p1)
	for _, v2 in pairs(p1) do
		if v2.Character then
			v2:LoadCharacter()
		end
	end
	return ("Respawned %d players."):format(#p1)
end