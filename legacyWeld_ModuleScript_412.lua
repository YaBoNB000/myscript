-- legacyWeld (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

return function(p1, p2)
	local v3 = Instance.new("Weld")
	v3.C0 = p1.CFrame:inverse() * p2.CFrame
	v3.Part0 = p1
	v3.Part1 = p2
	v3.Enabled = true
	v3.Name = p1.Name
	v3.Parent = p1
	return v3
end