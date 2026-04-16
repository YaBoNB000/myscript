-- LightningBolt (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v_u_1 = os.clock
local v2 = game:GetService("Workspace")
local v_u_3 = game:GetService("RunService")
local v4 = v2.Terrain
local v5 = Instance.new("Part")
v5.TopSurface = 0
v5.BottomSurface = 0
v5.Anchored = true
v5.CanCollide = false
v5.Locked = true
v5.CastShadow = false
v5.CanTouch = false
v5.CanQuery = false
v5.Shape = "Cylinder"
v5.Name = "BoltPart"
v5.Material = Enum.Material.Neon
v5.Color = Color3.new(1, 1, 1)
v5.Transparency = 1
local v_u_6 = require(script:WaitForChild("PartCache")).new(v5, 1000)
v_u_6:SetCacheParent(v4)
local function v_u_12(p7, p8, p9, p10, p11)
	return p8 * (1 - p7) ^ 3 + p9 * 3 * p7 * (1 - p7) ^ 2 + p10 * 3 * (1 - p7) * p7 ^ 2 + p11 * p7 ^ 3
end
local function v_u_24(p13, p14, p15, p16, p17, p18, p19)
	local v20 = p16 / (2 * p17)
	local v21 = (p13 - p14 * p15 + 0.5 * p16) / p17
	local v22 = v20 - math.abs(v21)
	local v23 = math.max(p19, p18)
	return math.clamp(v22, p18, v23)
end
local function v_u_27(p25)
	local v26 = -5000 * (p25 - 0.5) ^ 10
	return math.exp(v26)
end
local v_u_28 = CFrame.lookAt(Vector3.new(), Vector3.new(1, 0, 0)):inverse()
local v_u_29 = {}
local v_u_30 = {
	["__type"] = "LightningBolt"
}
v_u_30.__index = v_u_30
function v_u_30.new(p31, p32, p33)
	-- upvalues: (copy) v_u_30, (copy) v_u_12, (copy) v_u_24, (copy) v_u_27, (copy) v_u_6, (copy) v_u_1, (copy) v_u_29
	local v34 = v_u_30
	local v35 = setmetatable({}, v34)
	v35.Enabled = true
	v35.Attachment0 = p31
	v35.Attachment1 = p32
	v35.CurveSize0 = 0
	v35.CurveSize1 = 0
	v35.MinRadius = 0
	v35.MaxRadius = 2.4
	v35.Frequency = 1
	v35.AnimationSpeed = 7
	v35.Thickness = 1
	v35.MinThicknessMultiplier = 0.2
	v35.MaxThicknessMultiplier = 1
	v35.MinTransparency = 0
	v35.MaxTransparency = 1
	v35.PulseSpeed = 2
	v35.PulseLength = 1000000
	v35.FadeLength = 0.2
	v35.ContractFrom = 0.5
	v35.Color = Color3.new(1, 1, 1)
	v35.ColorOffsetSpeed = 3
	v35.SpaceCurveFunction = v_u_12
	v35.OpacityProfileFunction = v_u_24
	v35.RadialProfileFunction = v_u_27
	v35._Parts = {}
	for v36 = 1, p33 or 30 do
		v35._Parts[v36] = v_u_6:GetPart()
	end
	v35._PartsHidden = false
	v35._DisabledTransparency = 1
	v35._StartT = v_u_1()
	v35._RanNum = math.random() * 100
	v35._RefIndex = #v_u_29 + 1
	v_u_29[v35._RefIndex] = v35
	return v35
end
function v_u_30.Destroy(p37)
	-- upvalues: (copy) v_u_29, (copy) v_u_6
	v_u_29[p37._RefIndex] = nil
	for v38 = 1, #p37._Parts do
		v_u_6:ReturnPart(p37._Parts[v38])
	end
end
function v_u_30.DestroyDissipate(p_u_39, p40, p41)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	local v_u_42 = p40 or 0.2
	local v_u_43 = p41 or 0.5
	local v_u_44 = v_u_1()
	local v_u_45 = p_u_39.MinTransparency
	local v_u_46 = p_u_39.ContractFrom
	local v_u_47 = p_u_39.ContractFrom + 1 / (#p_u_39._Parts * p_u_39.FadeLength)
	local v_u_48 = p_u_39.MaxRadius
	local v_u_49 = p_u_39.MinThicknessMultiplier
	local v_u_50 = nil
	v_u_50 = v_u_3.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_1, (copy) v_u_44, (copy) p_u_39, (copy) v_u_49, (ref) v_u_42, (copy) v_u_45, (copy) v_u_46, (copy) v_u_47, (copy) v_u_48, (ref) v_u_43, (ref) v_u_50
		local v51 = v_u_1() - v_u_44
		p_u_39.MinThicknessMultiplier = v_u_49 + (-2 - v_u_49) * v51 / v_u_42
		if v51 < v_u_42 * 0.4 then
			local v52 = v51 / (v_u_42 * 0.4)
			p_u_39.MinTransparency = v_u_45 + (v_u_46 - v_u_45) * v52
			return
		elseif v51 < v_u_42 then
			local v53 = (v51 - v_u_42 * 0.4) / (v_u_42 * 0.6)
			p_u_39.MinTransparency = v_u_46 + (v_u_47 - v_u_46) * v53
			p_u_39.MaxRadius = v_u_48 * (1 + v_u_43 * v53)
			p_u_39.MinRadius = p_u_39.MinRadius + (p_u_39.MaxRadius - p_u_39.MinRadius) * v53
		else
			if v_u_1() - p_u_39._StartT < (p_u_39.PulseLength + 1) / p_u_39.PulseSpeed then
				p_u_39:Destroy()
			end
			v_u_50:Disconnect()
			v_u_50 = nil
		end
	end)
end
function v_u_30._UpdateGeometry(p54, p55, p56, p57, p58, p59, p60)
	-- upvalues: (copy) v_u_28
	local v61 = 1 - p54.MaxTransparency
	local v62 = 1 - p54.MinTransparency
	local v63 = p54.OpacityProfileFunction(p56, p57, p54.PulseSpeed, p54.PulseLength, p54.FadeLength, v61, v62)
	local v64 = p54.Thickness * p58 * v63
	local v65 = v64 > 0 and v63 and v63 or 0
	local v66 = 1 - p54.ContractFrom
	local v67 = #p54._Parts
	if v66 < v65 then
		local v68 = (p60 - p59).Magnitude
		p55.Size = Vector3.new(v68, v64, v64)
		p55.CFrame = CFrame.lookAt((p59 + p60) * 0.5, p60) * v_u_28
		p55.Transparency = 1 - v65
		return
	elseif v66 - 1 / (v67 * p54.FadeLength) < v65 then
		local v69 = (1 - (v65 - (v66 - 1 / (v67 * p54.FadeLength))) * v67 * p54.FadeLength) * (p56 < p57 * p54.PulseSpeed - 0.5 * p54.PulseLength and 1 or -1)
		local v70 = (1 - math.abs(v69)) * (p60 - p59).Magnitude
		p55.Size = Vector3.new(v70, v64, v64)
		p55.CFrame = CFrame.lookAt(p59 + (p60 - p59) * (math.max(0, v69) + (1 - math.abs(v69)) * 0.5), p60) * v_u_28
		p55.Transparency = 1 - v65
	else
		p55.Transparency = 1
	end
end
function v_u_30._UpdateColor(p71, p72, p73, p74)
	local v75 = p71.Color
	if typeof(v75) == "Color3" then
		p72.Color = p71.Color
	else
		local v76 = (p71._RanNum + p73 - p74 * p71.ColorOffsetSpeed) % 1
		local v77 = p71.Color.Keypoints
		for v78 = 1, #v77 - 1 do
			if v77[v78].Time < v76 and v76 < v77[v78 + 1].Time then
				p72.Color = v77[v78].Value:lerp(v77[v78 + 1].Value, (v76 - v77[v78].Time) / (v77[v78 + 1].Time - v77[v78].Time))
				return
			end
		end
	end
end
function v_u_30._Disable(p79)
	p79.Enabled = false
	for _, v80 in ipairs(p79._Parts) do
		v80.Transparency = p79._DisabledTransparency
	end
end
v_u_3.Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_29, (copy) v_u_1
	debug.profilebegin("LightningBolt")
	for _, v81 in pairs(v_u_29) do
		if v81.Enabled == true then
			v81._PartsHidden = false
			local v82 = v81.MinRadius
			local v83 = v81.MaxRadius
			local v84 = v81._Parts
			local v85 = #v84
			local v86 = v81._RanNum
			local v87 = v81.AnimationSpeed
			local v88 = v81.Frequency
			local v89 = v81.MinThicknessMultiplier
			local v90 = v81.MaxThicknessMultiplier
			local v91 = v_u_1() - v81._StartT
			local v92 = v81.SpaceCurveFunction
			local v93 = v81.RadialProfileFunction
			local v94 = (v81.PulseLength + 1) / v81.PulseSpeed
			local v95 = v81.Attachment0
			local v96 = v81.Attachment1
			local v97 = v81.CurveSize0
			local v98 = v81.CurveSize1
			local v99 = v95.WorldPosition
			local v100 = v95.WorldPosition + v95.WorldAxis * v97
			local v101 = v96.WorldPosition - v96.WorldAxis * v98
			local v102 = v96.WorldPosition
			local v103 = v92(0, v99, v100, v101, v102)
			if v91 < v94 then
				local v104 = v103
				for v105 = 1, v85 do
					local v106 = v84[v105]
					local v107 = v105 / v85
					local v108 = v87 * -v91 + v88 * 10 * v107 - 0.2 + v86 * 4
					local v109 = 5 * (v87 * 0.01 * -v91 / 10 + v88 * v107) + v86 * 4
					local v110 = 5 * v108
					local v111 = 1 * v109
					local v112 = 0 + 0.6283185307179586 * (math.noise(v110, 1.5, v111) + 0.5)
					local v113 = 0.5 * v108
					local v114 = 0.1 * v109
					local v115 = v112 + (0 + 5.654866776461628 * (math.noise(v113, 1.5, v114) + 0.5))
					local v116 = (v82 + (v83 - v82) * (math.noise(3.4, v109, v108) + 0.5)) * v93(v107)
					local v117 = v89 + (v90 - v89) * (math.noise(2.3, v109, v108) + 0.5)
					local v118 = v92(v107, v99, v100, v101, v102)
					local v119
					if v105 == v85 then
						v119 = v118
					else
						local v120 = CFrame.new(v104, v118) * CFrame.Angles(0, 0, v115)
						local v121 = CFrame.Angles
						local v122 = 6.123233995736766e-17 + 0.9999999999999999 * (math.noise(v109, v108, 2.7) + 0.5)
						local v123 = math.clamp(v122, -1, 1)
						v119 = (v120 * v121(math.acos(v123), 0, 0) * CFrame.new(0, 0, -v116)).Position or v118
					end
					v81:_UpdateGeometry(v106, v107, v91, v117, v103, v119)
					v81:_UpdateColor(v106, v107, v91)
					v104 = v118
					v103 = v119
				end
			else
				v81:Destroy()
			end
		elseif v81._PartsHidden == false then
			v81._PartsHidden = true
			v81:_Disable()
		end
	end
	debug.profileend()
end)
return v_u_30