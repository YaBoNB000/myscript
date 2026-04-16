-- killServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Admin
-- Original

return function(_, p1)
	for _, v2 in pairs(p1) do
		if v2.Character and v2.Character:FindFirstChild("Humanoid") then
			v2.Character.Humanoid.Health = 0
		end
	end
	return ("Killed %d players."):format(#p1)
end