-- FerrisWheel (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientCarnival
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("UserInputService")
local v5 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local v6 = require(v5.devv).load
local v_u_7 = v6("LODCheck")
local v_u_8 = v6("tween")
local v_u_9 = v6("trig")
local v_u_10 = v6("Maid")
v_u_1.__index = v_u_1
local v11 = v4.TouchEnabled
local v_u_12 = v11 and 250 or 700
local v_u_13 = v11 and 100 or 250
function v_u_1.new(p14)
	-- upvalues: (copy) v_u_1, (copy) v_u_10, (copy) v_u_2
	local v15 = p14:WaitForChild("Wheel"):WaitForChild("Lights")
	local v_u_16 = {}
	local v17 = v_u_1
	setmetatable(v_u_16, v17)
	local v18 = v_u_10.new()
	v_u_16._model = p14
	v_u_16._lights = {}
	v_u_16._carts = {}
	local v19 = p14:GetAttribute("startCFrame")
	local v20 = p14:GetAttribute("rotFactor")
	for _, v21 in v15:GetChildren() do
		local v22 = v21:GetAttribute("lightNum")
		v_u_16._lights[v22] = v21
	end
	for _, v_u_23 in p14:GetChildren() do
		if v_u_23.Name == "Cart" and (v_u_23:IsA("Model") and not v_u_23:GetAttribute("destroyed")) then
			v_u_16._carts[v_u_23] = v_u_23:GetPivot():toObjectSpace(v19)
			v18:GiveTask(v_u_23:GetAttributeChangedSignal("destroyed"):Connect(function()
				-- upvalues: (copy) v_u_23, (copy) v_u_16
				if v_u_23 and (v_u_16._carts[v_u_23] and v_u_23:GetAttribute("destroyed")) then
					v_u_16._carts[v_u_23] = nil
				end
			end))
		end
	end
	v_u_16:CFrameWheel(v19 * CFrame.Angles(3.141592653589793 * v20 / 4, 0, 0))
	v_u_16._lod = 0
	v_u_16._timer = os.clock()
	v_u_16._hue = 0
	v_u_16._current = 0
	v18:GiveTask(v_u_2.Heartbeat:Connect(function(p24)
		-- upvalues: (copy) v_u_16
		v_u_16:Heartbeat(p24)
	end))
	v_u_16._maid = v18
	return v_u_16
end
function v_u_1.CFrameWheel(p25, p26)
	-- upvalues: (copy) v_u_9
	local v27 = p25._model
	v27.Wheel:PivotTo(p26)
	local v28 = v27:GetAttribute("startCFrame")
	for v29, v30 in p25._carts do
		if not v29:GetAttribute("destroyed") then
			local v31 = CFrame.new((p26 * v30).p)
			local v32 = v_u_9.yaw(v28.LookVector) + 1.5707963267948966
			v29:PivotTo(v31 * CFrame.Angles(0, v32, 0))
		end
	end
end
function v_u_1.SetLight(p33, p34, p35)
	-- upvalues: (copy) v_u_3
	local v36 = p33._model
	if p34 and (v36 and v36:IsDescendantOf(workspace)) then
		local v37 = p35 or (p34:GetAttribute("isYellow") and Color3.fromRGB(255, 213, 0) or Color3.fromRGB(218, 217, 221))
		if p33._lod == 2 then
			v_u_3:Create(p34, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
				["Color"] = v37
			}):Play()
		else
			p34.Color = v37
		end
	else
		return
	end
end
function v_u_1._animStep(p38)
	-- upvalues: (copy) v_u_8
	local v39 = p38._model
	if v39 and v39:GetAttribute("animating") then
		local v40 = v39:GetAttribute("rotFactor")
		local v41 = v39:GetAttribute("rotations")
		local v42 = v39:GetAttribute("animStarted")
		local v43 = 30 * (v41 / 8)
		local v44 = workspace:GetServerTimeNow() - v42
		local v45 = math.clamp(v44, 0, v43)
		local v46 = v_u_8.inOutSine(v45, 0, v43, v43)
		p38:CFrameWheel(v39:GetAttribute("startCFrame") * CFrame.Angles(3.141592653589793 * v40 / 4 + 3.141592653589793 * (v46 / v43) * v41 / 4, 0, 0))
	end
end
function v_u_1._lightStep(p_u_47, p48)
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_13
	local v49 = p_u_47._model.PrimaryPart
	if v49 and p_u_47._timer >= 0.06 then
		p_u_47._timer = 0
		local v50, v51 = v_u_7(v49.Position, v_u_12, v_u_13)
		if v50 then
			p_u_47._lod = v51 and 2 or 1
			p_u_47._current = p_u_47._current + 1
			if p_u_47._current > 36 then
				p_u_47._current = 1
			end
			local v_u_52 = p_u_47._lights[p_u_47._current]
			if v_u_52 then
				p_u_47._hue = p_u_47._hue + p48
				local v53 = Color3.fromHSV
				local v54 = p_u_47._hue
				p_u_47:SetLight(v_u_52, (v53((math.sin(v54) + 1) / 2, 1, 1)))
				task.delay(1, function()
					-- upvalues: (copy) p_u_47, (copy) v_u_52
					p_u_47:SetLight(v_u_52)
				end)
			end
		else
			p_u_47._lod = 0
		end
	else
		return
	end
end
function v_u_1.Heartbeat(p55, p56)
	p55._timer = p55._timer + p56
	p55:_animStep()
	p55:_lightStep(p56)
end
function v_u_1.Destroy(p57)
	p57._maid:DoCleaning()
	for v58, _ in p57._carts do
		p57._carts[v58] = nil
	end
	for v59, _ in p57._lights do
		p57._lights[v59] = nil
	end
	p57._model = nil
end
return v_u_1