-- teleportServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Admin
-- Original

return function(_, p1, p2)
	local v3 = nil
	if typeof(p2) == "Instance" then
		if not (p2.Character and p2.Character:FindFirstChild("HumanoidRootPart")) then
			return "Target player has no character."
		end
		v3 = p2.Character.HumanoidRootPart.CFrame
	elseif typeof(p2) == "Vector3" then
		v3 = CFrame.new(p2)
	end
	for _, v4 in ipairs(p1) do
		if v4.Character and v4.Character:FindFirstChild("HumanoidRootPart") then
			v4.Character.HumanoidRootPart.CFrame = v3
		end
	end
	return ("Teleported %d players."):format(#p1)
end