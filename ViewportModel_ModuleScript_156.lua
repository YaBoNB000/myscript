-- ViewportModel (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

require(game:GetService("ReplicatedStorage").devv).load("Maid")
local v_u_1 = {
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7
}
local v_u_2 = {
	0,
	1,
	3,
	4,
	5,
	7
}
local v_u_3 = {
	0,
	1,
	4,
	5,
	6
}
local v_u_4 = {}
v_u_4.__index = v_u_4
v_u_4.ClassName = "ViewportModel"
local function v_u_16(p5, p6, p7)
	local v8 = {}
	for v9, v10 in pairs(p7) do
		local v11 = v10 / 4
		local v12 = math.floor(v11) % 2 * 2 - 1
		local v13 = v10 / 2
		local v14 = math.floor(v13) % 2 * 2 - 1
		local v15 = 2 * (v10 % 2) - 1
		v8[v9] = p5 * (p6 * Vector3.new(v12, v14, v15))
	end
	return v8
end
local function v_u_23(p17)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_1, (copy) v_u_16
	local v18 = {}
	for _, v19 in pairs(p17:GetDescendants()) do
		if v19:IsA("BasePart") then
			local v20
			if v19:IsA("WedgePart") then
				v20 = v_u_2
			elseif v19:IsA("CornerWedgePart") then
				v20 = v_u_3
			else
				v20 = v_u_1
			end
			local v21 = v_u_16(v19.CFrame, v19.Size / 2, v20)
			for _, v22 in pairs(v21) do
				table.insert(v18, v22)
			end
		end
	end
	return v18
end
local function v_u_34(p24, p25, p26, p27)
	local v28 = (-1 / 0)
	local v29 = (1 / 0)
	for _, v30 in pairs(p24) do
		local v31 = p27 * (p26 - v30.Z)
		local v32 = v30[p25] + v31
		local v33 = v30[p25] - v31
		v28 = math.max(v28, v32, v33)
		v29 = math.min(v29, v32, v33)
	end
	return v28, v29
end
function v_u_4.new(p35, p36)
	-- upvalues: (copy) v_u_4
	local v37 = v_u_4
	local v38 = setmetatable({}, v37)
	v38.Model = nil
	v38.ViewportFrame = p35
	v38.Camera = p36
	v38._points = {}
	v38._modelCFrame = CFrame.new()
	v38._modelSize = Vector3.new()
	v38._modelRadius = 0
	v38._viewport = {}
	v38:Calibrate()
	return v38
end
function v_u_4.Destroy(p39)
	p39.Model = nil
	p39.ViewportFrame = nil
end
function v_u_4.SetModel(p40, p41)
	-- upvalues: (copy) v_u_23
	p40.Model = p41
	local v42, v43 = p41:GetBoundingBox()
	p40._points = v_u_23(p41)
	p40._modelCFrame = v42
	p40._modelSize = v43
	p40._modelRadius = v43.Magnitude / 2
end
function v_u_4.Calibrate(p44)
	local v45 = {}
	local v46 = p44.ViewportFrame.AbsoluteSize
	v45.aspect = v46.X / v46.Y
	local v47 = p44.Camera.FieldOfView / 2
	v45.yFov2 = math.rad(v47)
	local v48 = v45.yFov2
	v45.tanyFov2 = math.tan(v48)
	local v49 = v45.tanyFov2 * v45.aspect
	v45.xFov2 = math.atan(v49)
	local v50 = v45.xFov2
	v45.tanxFov2 = math.tan(v50)
	local v51 = v45.tanyFov2
	local v52 = v45.aspect
	local v53 = v51 * math.min(1, v52)
	v45.cFov2 = math.atan(v53)
	local v54 = v45.cFov2
	v45.sincFov2 = math.sin(v54)
	p44._viewport = v45
end
function v_u_4.GetFitDistance(p55, p56)
	local v57 = p56 and ((p56 - p55._modelCFrame.Position).Magnitude or 0) or 0
	return (p55._modelRadius + v57) / p55._viewport.sincFov2
end
function v_u_4.GetMinimumFitCFrame(p58, p59)
	-- upvalues: (copy) v_u_34
	if not p58.Model then
		return CFrame.new()
	end
	local v60 = (p59 - p59.Position):Inverse()
	local v61 = p58._points
	local v62 = { v60 * v61[1] }
	local v63 = v62[1].Z
	for v64 = 2, #v61 do
		local v65 = v60 * v61[v64]
		local v66 = v65.Z
		v63 = math.min(v63, v66)
		v62[v64] = v65
	end
	local v67, v68 = v_u_34(v62, "X", v63, p58._viewport.tanxFov2)
	local v69, v70 = v_u_34(v62, "Y", v63, p58._viewport.tanyFov2)
	local v71 = (v67 - v68) / 2 / p58._viewport.tanxFov2
	local v72 = (v69 - v70) / 2 / p58._viewport.tanyFov2
	local v73 = math.max(v71, v72)
	return p59 * CFrame.new((v67 + v68) / 2, (v69 + v70) / 2, v63 + v73)
end
function v_u_4.GetMinimumFitCFrameWithOffset(p74, p75, p76)
	-- upvalues: (copy) v_u_34
	if not p74.Model then
		return CFrame.new()
	end
	local v77 = (p75 - p75.Position):Inverse()
	local v78 = p74._points
	local v79 = { v77 * v78[1] }
	local v80 = v79[1].Z
	for v81 = 2, #v78 do
		local v82 = v77 * v78[v81]
		local v83 = v82.Z
		v80 = math.min(v80, v83)
		v79[v81] = v82
	end
	local v84, v85 = v_u_34(v79, "X", v80, p74._viewport.tanxFov2)
	local v86, v87 = v_u_34(v79, "Y", v80, p74._viewport.tanyFov2)
	local v88 = (v84 - v85) / 2 / p74._viewport.tanxFov2
	local v89 = (v86 - v87) / 2 / p74._viewport.tanyFov2
	local v90 = math.max(v88, v89)
	return p75 * CFrame.new((v84 + v85) / 2, (v86 + v87) / 2, v80 + v90 + p76)
end
return v_u_4