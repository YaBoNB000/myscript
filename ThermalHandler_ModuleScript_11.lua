-- ThermalHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Lighting")
local v_u_6 = game:GetService("Players")
local v_u_7 = v_u_6.LocalPlayer
local v8 = require(v2.devv).load
local v_u_9 = v8("HumanoidReadyUtil")
local v_u_10 = v8("v3sound")
local v_u_11 = v8("tween")
local v_u_12 = v8("Maid")
local v_u_13 = nil
local v_u_14 = v_u_12.new()
local v_u_15 = workspace.CurrentCamera
function v_u_1.EnterScope(p16)
	-- upvalues: (ref) v_u_13, (copy) v_u_14, (copy) v_u_4, (copy) v_u_1, (copy) v_u_5
	v_u_13 = nil
	v_u_14:DoCleaning()
	v_u_14:GiveTask(v_u_4.Heartbeat:Connect(v_u_1.ThermalStep))
	local v_u_17 = Instance.new("ColorCorrectionEffect")
	v_u_17.Name = "ThermalColorCorrection"
	v_u_17.Brightness = 0.15
	v_u_17.Saturation = -0.9
	v_u_17.Contrast = -0.3
	v_u_17.TintColor = p16 or Color3.fromRGB(255, 190, 190)
	v_u_17.Enabled = true
	v_u_17.Parent = v_u_5
	v_u_14:GiveTask(function()
		-- upvalues: (copy) v_u_17
		v_u_17:Destroy()
	end)
end
function v_u_1.ExitScope()
	-- upvalues: (ref) v_u_13, (copy) v_u_14
	v_u_13 = nil
	v_u_14:DoCleaning()
end
function v_u_1.UpdateGoggles(p18)
	-- upvalues: (copy) v_u_7, (copy) v_u_15, (ref) v_u_13, (copy) v_u_14, (copy) v_u_5, (copy) v_u_3, (copy) v_u_10, (copy) v_u_4, (copy) v_u_1
	local v_u_19 = v_u_7.Character
	local v20
	if v_u_19 then
		v20 = v_u_19:FindFirstChild("Humanoid")
	else
		v20 = v_u_19
	end
	if v20 then
		if v_u_15.CameraSubject ~= v20 then
			p18 = nil
		end
		if v_u_13 == p18 then
			return
		else
			v_u_13 = p18
			v_u_14:DoCleaning()
			local function v25(p21)
				-- upvalues: (ref) v_u_5, (ref) v_u_3, (ref) v_u_14, (copy) v_u_19, (ref) v_u_10
				local v_u_22 = Instance.new("ColorCorrectionEffect")
				v_u_22.Name = "GogglesColorCorrection"
				v_u_22.Brightness = 0
				v_u_22.Saturation = 0
				v_u_22.Contrast = 0
				v_u_22.TintColor = Color3.new(1, 1, 1)
				v_u_22.Enabled = true
				v_u_22.Parent = v_u_5
				local v_u_23 = v_u_3:Create(v_u_22, TweenInfo.new(0.5), {
					["TintColor"] = p21,
					["Brightness"] = 0.75,
					["Saturation"] = -0.15,
					["Contrast"] = 1.2
				})
				v_u_23:Play()
				v_u_14:GiveTask(function()
					-- upvalues: (copy) v_u_23, (copy) v_u_22
					if v_u_23 then
						v_u_23:Pause()
					end
					v_u_22:Destroy()
				end)
				if v_u_19.PrimaryPart then
					local v24 = v_u_10.newSound("NVGs")
					v24:attachToPart(v_u_19.PrimaryPart)
					v24:play()
				end
			end
			if p18 == "Night Vision Goggles" then
				v25(Color3.fromRGB(80, 255, 80))
			elseif p18 == "X-Ray Goggles" then
				v25(Color3.fromRGB(255, 80, 80))
				v_u_14:GiveTask(v_u_4.Heartbeat:Connect(v_u_1.XRayStep))
			end
		end
	else
		return
	end
end
local v_u_26 = os.clock()
local v_u_27 = Instance.new("Highlight")
v_u_27.Name = "XRayHighlight"
v_u_27.Enabled = false
v_u_27.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
v_u_27.OutlineTransparency = 1
v_u_27.FillTransparency = 1
v_u_27.FillColor = Color3.new(1, 1, 1)
local v_u_28 = Instance.new("Highlight")
v_u_28.Name = "ThermalHighlight"
v_u_28.Enabled = false
v_u_28.DepthMode = Enum.HighlightDepthMode.Occluded
v_u_28.OutlineTransparency = 1
v_u_28.FillTransparency = 1
v_u_28.FillColor = Color3.new(1, 1, 1)
function v_u_1.XRayStep()
	-- upvalues: (ref) v_u_26, (copy) v_u_6, (copy) v_u_7, (copy) v_u_27, (copy) v_u_14, (copy) v_u_11
	if os.clock() - v_u_26 >= 0.5 then
		v_u_26 = os.clock()
		for _, v29 in v_u_6:GetPlayers() do
			if v29 ~= v_u_7 then
				local v30 = v29.Character
				if v30 and v30.PrimaryPart then
					local v31 = v_u_7:DistanceFromCharacter(v30.PrimaryPart.Position)
					local v32 = v30:FindFirstChild("XRayHighlight")
					if not v32 then
						local v_u_33 = v_u_27:Clone()
						v_u_33.Parent = v30
						v_u_14:GiveTask(function()
							-- upvalues: (ref) v_u_33
							v_u_33:Destroy()
						end)
						v32 = v_u_33
					end
					v32.FillTransparency = v_u_11.inQuad(v31 / 50, 0, 1, 1)
					v32.Enabled = v31 <= 50
				end
			end
		end
	end
end
function v_u_1.ThermalStep()
	-- upvalues: (ref) v_u_26, (copy) v_u_6, (copy) v_u_7, (copy) v_u_28, (copy) v_u_14, (copy) v_u_11
	if os.clock() - v_u_26 >= 0.5 then
		v_u_26 = os.clock()
		for _, v34 in v_u_6:GetPlayers() do
			if v34 ~= v_u_7 then
				local v35 = v34.Character
				if v35 and v35.PrimaryPart then
					local v36 = v_u_7:DistanceFromCharacter(v35.PrimaryPart.Position)
					local v37 = v35:FindFirstChild("ThermalHighlight")
					if not v37 then
						local v_u_38 = v_u_28:Clone()
						v_u_38.Parent = v35
						v_u_14:GiveTask(function()
							-- upvalues: (ref) v_u_38
							v_u_38:Destroy()
						end)
						v37 = v_u_38
					end
					v37.FillTransparency = v_u_11.inQuad(v36 / 2000, 0, 1, 1)
					v37.Enabled = v36 <= 2000
				end
			end
		end
	end
end
function v_u_1.CharacterAdded(p39, p_u_40, p_u_41)
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_14, (copy) v_u_1, (copy) v_u_15
	if p39 == v_u_7 then
		local v_u_42 = v_u_12.new()
		v_u_42:GiveTask(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_1
			v_u_14:DoCleaning()
			v_u_1.UpdateGoggles(nil)
		end)
		v_u_42:GiveTask(v_u_15:GetPropertyChangedSignal("CameraSubject"):Connect(function()
			-- upvalues: (ref) v_u_15, (copy) p_u_41, (ref) v_u_1, (copy) p_u_40
			if v_u_15.CameraSubject == p_u_41 then
				local v43 = p_u_40:GetAttribute("Eyewear")
				v_u_1.UpdateGoggles(v43)
			else
				v_u_1.UpdateGoggles(nil)
			end
		end))
		v_u_42:GiveTask(p_u_40:GetAttributeChangedSignal("Eyewear"):Connect(function()
			-- upvalues: (copy) p_u_40, (ref) v_u_1
			local v44 = p_u_40:GetAttribute("Eyewear")
			v_u_1.UpdateGoggles(v44)
		end))
		v_u_42:GiveTask(p_u_41.Died:Connect(function()
			-- upvalues: (copy) v_u_42
			v_u_42:DoCleaning()
		end))
		v_u_42:GiveTask(p_u_41.AncestryChanged:Connect(function(_, p45)
			-- upvalues: (copy) v_u_42
			if not game:IsAncestorOf(p45) then
				v_u_42:DoCleaning()
			end
		end))
	end
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_9, (copy) v_u_1
	v_u_9.registerHumanoidReady(v_u_1.CharacterAdded)
end
return v_u_1