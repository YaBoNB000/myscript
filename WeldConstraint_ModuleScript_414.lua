-- WeldConstraint (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

return function(p1, p2)
	local v3 = Instance.new("WeldConstraint")
	v3.Part0 = p1
	v3.Part1 = p2
	v3.Enabled = true
	v3.Parent = p1
	return v3
end