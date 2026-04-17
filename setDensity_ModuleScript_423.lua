-- setDensity (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

local function v_u_3(p1, p2)
	if p1:IsA("BasePart") then
		if not p1.CustomPhysicalProperties then
			p1.CustomPhysicalProperties = PhysicalProperties.new(p1.Material)
		end
		p1.CustomPhysicalProperties = PhysicalProperties.new(math.max(p2, 0.01), p1.CustomPhysicalProperties.Friction, p1.CustomPhysicalProperties.Elasticity, p1.CustomPhysicalProperties.FrictionWeight, p1.CustomPhysicalProperties.ElasticityWeight)
	end
end
local function v_u_8(p4, p5, p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_8
	v_u_3(p4, p5)
	if p6 then
		for _, v7 in pairs(p4:GetChildren()) do
			v_u_8(v7, p5, p6)
		end
	end
end
return v_u_8