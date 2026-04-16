-- hideModel (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

return function(p1, p2)
	for _, v3 in ipairs(p1:GetDescendants()) do
		if v3:IsA("BasePart") then
			v3.LocalTransparencyModifier = p2 and 1 or 0
		end
	end
end