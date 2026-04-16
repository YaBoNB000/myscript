-- ParabolicBeamHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
game:GetService("Players").LocalPlayer:GetMouse()
local v_u_2 = require(script.solve)
local v3 = -workspace.Gravity
local v_u_4 = Vector3.new(0, v3, 0)
function v_u_1.new()
	-- upvalues: (copy) v_u_1
	local v5 = {
		["__index"] = v_u_1
	}
	local v6 = setmetatable({}, v5)
	v6._attachment0 = Instance.new("Attachment", workspace.Terrain)
	v6._attachment1 = Instance.new("Attachment", workspace.Terrain)
	v6._beam = Instance.new("Beam")
	v6._beam.Width0 = 0.2
	v6._beam.Width1 = 0.2
	v6._beam.Attachment0 = v6._attachment0
	v6._beam.Attachment1 = v6._attachment1
	v6._beam.Parent = workspace.Terrain
	v6._originPosition = Vector3.new()
	v6._targetPosition = Vector3.new()
	v6._maxDistance = 20
	v6._t = 0.5
	return v6
end
function v_u_1.Toggle(p7, p8)
	if p7._beam then
		p7._beam.Enabled = p8
	end
end
function v_u_1.Step(p9)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v10, _, v11 = p9:GetVelocity()
	local v12, v13, v14, v15 = v_u_2(v_u_4, v10, p9._originPosition, v11)
	p9._beam.CurveSize0 = v12
	p9._beam.CurveSize1 = v13
	p9._attachment0.CFrame = p9._attachment0.Parent.CFrame:Inverse() * v14
	p9._attachment1.CFrame = p9._attachment1.Parent.CFrame:Inverse() * v15
end
function v_u_1.SetOrigin(p16, p17)
	p16._originPosition = p17
end
function v_u_1.SetTarget(p18, p19)
	p18._targetPosition = p19
end
function v_u_1.SetDistance(p20, p21)
	p20._maxDistance = p21
end
function v_u_1.GetVelocity(p22)
	-- upvalues: (copy) v_u_4
	local v23 = p22._originPosition
	local v24 = p22._targetPosition
	local v25 = p22._maxDistance
	local v26 = v23 - v24
	local v27 = v26.Magnitude
	local v28 = math.clamp(v27, 0, v25)
	local v29 = v28 / v25 * 0.5
	local v30 = -(v26.Unit * v28) + v23
	return (v30 - v23 - v_u_4 * 0.5 * v29 ^ 2) / v29, v30, v29
end
function v_u_1.Destroy(p31)
	if p31._beam ~= nil then
		p31._beam:Destroy()
		p31._beam = nil
	end
	if p31._attachment0 ~= nil then
		p31._attachment0:Destroy()
		p31._attachment0 = nil
	end
	if p31._attachment1 ~= nil then
		p31._attachment1:Destroy()
		p31._attachment1 = nil
	end
end
return v_u_1