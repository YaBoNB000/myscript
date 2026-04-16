-- EventMob (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Halloween
-- Original

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Players").LocalPlayer
local v7 = require(v_u_1.devv).load
local v_u_8 = v7("ScaleParticles")
local v_u_9 = v7("halloweenMobs")
local v_u_10 = v7("getColorDelta")
local v_u_11 = v7("EventCandy")
local v_u_12 = v7("v3sound")
local v_u_13 = v7("Signal")
local v_u_14 = v7("Maid")
local v_u_15 = Random.new()
local v_u_16 = TweenInfo.new(0.16, Enum.EasingStyle.Back)
local v_u_17 = v3.TouchEnabled and 50 or 100
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new(p19, p20, p21)
	-- upvalues: (copy) v_u_18, (copy) v_u_1, (copy) v_u_15, (copy) v_u_2, (copy) v_u_14, (copy) v_u_12
	local v22 = v_u_18
	local v_u_23 = setmetatable({}, v22)
	local v24 = v_u_1.Models.Halloween[p19]:Clone()
	local v25 = p19 == "Pumpkin" and Vector3.new()
	if not v25 then
		local v26 = v24:GetExtentsSize().Y + 1
		v25 = Vector3.new(0, v26, 0)
	end
	v24.Name = p20
	local v27 = CFrame.new(p21)
	local v28 = v24.PrimaryPart.Size.Y * 0.5 - 0.5
	v24:PivotTo((v27 + Vector3.new(0, v28, 0) - v25) * CFrame.fromOrientation(0, 6.283185307179586 * v_u_15:NextNumber(), 0))
	v24:SetAttribute("health", 100)
	v24:SetAttribute("maxHealth", 100)
	v24:SetAttribute("mobName", p19 == "Pumpkin" and "Pumpkin" or "Ghost")
	v_u_2:AddTag(v24, "halloweenMob")
	v24.Parent = workspace.Halloween
	local v29 = v_u_1.Guis.BillboardGuis.HealthBillboard:Clone()
	v29.ExtentsOffset = Vector3.new(0, -0.2, 0)
	v29.Size = UDim2.fromScale(v29.Size.X.Scale * 1.5, v29.Size.Y.Scale * 1.5)
	v29.Parent = v24.PrimaryPart
	v_u_23.mobName = p19
	v_u_23.model = v24
	v_u_23.healthBar = v29
	v_u_23.originalSizes = {}
	v_u_23.t = 0
	v_u_23.maid = v_u_14.new()
	for _, v30 in v24:GetDescendants() do
		if v30:IsA("BasePart") then
			v_u_23.originalSizes[v30] = v30.Size
		end
	end
	v_u_23:_updateHealth(true)
	v_u_23.maid:GiveTask(v24:GetAttributeChangedSignal("health"):Connect(function()
		-- upvalues: (copy) v_u_23
		v_u_23:_updateHealth()
	end))
	v_u_23.maid:GiveTask(v24:GetAttributeChangedSignal("maxHealth"):Connect(function()
		-- upvalues: (copy) v_u_23
		v_u_23:_updateHealth()
	end))
	v_u_23.maid:GiveTask(v24.AncestryChanged:Once(function(_, p31)
		-- upvalues: (copy) v_u_23
		if not p31 then
			v_u_23:Destroy()
		end
	end))
	if p19 ~= "Pumpkin" then
		for _, v32 in v24:GetChildren() do
			if v32 ~= v24.PrimaryPart then
				local v33 = Instance.new("WeldConstraint")
				v33.Part0 = v24.PrimaryPart
				v33.Part1 = v32
				v33.Parent = v32
				v32.Anchored = false
			end
		end
		local v34 = v_u_12.newSound("ghost")
		v34:attachToPart(v24.PrimaryPart)
		v34:play()
		v_u_23:_ghostAnimation()
	end
	return v_u_23
end
function v_u_18.Destroy(p35)
	if p35.maid then
		p35.maid:DoCleaning()
		p35.maid = nil
	end
	if p35:_isValid() then
		p35.model:Destroy()
		p35.model = nil
	end
end
function v_u_18._onDestroyed(p36)
	-- upvalues: (copy) v_u_1, (copy) v_u_15, (copy) v_u_8, (copy) v_u_12, (copy) v_u_13, (copy) v_u_9, (copy) v_u_11
	local v37 = p36.model
	if v37 and v37.Parent then
		local v_u_38 = v_u_1.Models.Particles.PinataSmoke:Clone()
		v_u_38.Size = Vector3.new(8, 8, 8)
		v_u_38.CFrame = v37.PrimaryPart.CFrame * CFrame.fromOrientation(0, 6.283185307179586 * v_u_15:NextNumber(), 0)
		v_u_38.Parent = workspace.Game.Local
		v_u_8(v_u_38, 1.8)
		v_u_38.Smoke:Emit(20 + v_u_15:NextInteger(-2, 4))
		task.delay(2, function()
			-- upvalues: (copy) v_u_38
			v_u_38:Destroy()
		end)
		local v39 = v_u_12.newSound("pinataSmash")
		v39:attachToPart(v37.PrimaryPart)
		v39:play()
		if v_u_13.InvokeServer("attemptCollectMob", p36.mobName, v37.Name) then
			local v40 = v_u_9[p36.mobName]
			v_u_11.Spawn(v40.candyUnits, v37.PrimaryPart.CFrame, v40.candy)
		end
		p36:Destroy()
	end
end
function v_u_18._onHit(p_u_41)
	-- upvalues: (copy) v_u_4, (copy) v_u_16, (copy) v_u_12
	local v_u_42 = p_u_41.model
	if v_u_42 and v_u_42.Parent then
		for _, v43 in v_u_42:GetDescendants() do
			if v43:IsA("BasePart") then
				v_u_4:Create(v43, v_u_16, {
					["Size"] = p_u_41.originalSizes[v43] + p_u_41.originalSizes[v43] * 0.1
				}):Play()
			end
		end
		task.delay(0.135, function()
			-- upvalues: (copy) p_u_41, (copy) v_u_42, (ref) v_u_4, (ref) v_u_16
			if p_u_41:_isValid() then
				for _, v44 in v_u_42:GetDescendants() do
					if v44:IsA("BasePart") then
						v_u_4:Create(v44, v_u_16, {
							["Size"] = p_u_41.originalSizes[v44]
						}):Play()
					end
				end
			end
		end)
		if p_u_41:_isValid() then
			local v45 = v_u_12.newSound("pinataHit")
			v45:attachToPart(v_u_42.PrimaryPart)
			v45:play()
		end
	end
end
function v_u_18._updateHealth(p46, p47)
	-- upvalues: (copy) v_u_10
	local v48 = p46.healthBar
	local v49 = p46.model
	if v48 and v48.Parent then
		local v50 = v48.Frame.Health
		local v51 = v49:GetAttribute("health")
		local v52 = v49:GetAttribute("maxHealth")
		local v53 = v51 / v52
		local v54 = math.clamp(v53, 0, 1)
		local v55 = v54 >= 1 and Color3.new(0, 0.839216, 0) or Color3.new(0.901961, 0, 0)
		local v56 = v_u_10(v55, -150)
		v50.RealBar.BackgroundColor3 = v55
		v50.UIStroke.Color = v56
		v50.HealthLabel.UIStroke.Color = v56
		v50.HealthLabel.Text = v51 .. "/" .. v52
		v50.RealBar.Visible = v54 > 0
		v50.RealBar.Size = UDim2.fromScale(v54, 1)
		if v51 <= 0 then
			p46:_onDestroyed()
		elseif p46:_isValid() and not p47 then
			p46:_onHit()
		end
	else
		return
	end
end
function v_u_18._isValid(p57)
	local v58 = p57.model and p57.model.Parent
	if v58 then
		v58 = p57.model.PrimaryPart
	end
	return v58
end
function v_u_18._ghostAnimation(p_u_59)
	-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_17
	local v_u_60 = p_u_59.model
	if v_u_60 and v_u_60.Parent then
		local v61 = v_u_15:NextInteger(4, 10)
		local v62 = v_u_4
		local v63 = v_u_60.PrimaryPart
		local v64 = TweenInfo.new(v61 * 1.3, Enum.EasingStyle.Sine)
		local v65 = {}
		local v66 = v_u_60:GetPivot()
		local v67 = v_u_60:GetExtentsSize().Y + 1 + v61
		v65.CFrame = v66 + Vector3.new(0, v67, 0)
		local v_u_68 = v62:Create(v63, v64, v65)
		v_u_68:Play()
		p_u_59.maid:GiveTask(v_u_68.Completed:Once(function()
			-- upvalues: (copy) v_u_60, (copy) p_u_59, (ref) v_u_5, (ref) v_u_6, (ref) v_u_17
			if v_u_60 and v_u_60.Parent then
				local v_u_69 = v_u_60:GetPivot()
				p_u_59.maid:GiveTask(v_u_5.Heartbeat:Connect(function(p70)
					-- upvalues: (ref) p_u_59, (ref) v_u_6, (ref) v_u_17, (copy) v_u_69
					local v71 = p_u_59.model
					if v71 and v71.Parent then
						if v_u_17 >= v_u_6:DistanceFromCharacter(v71.PrimaryPart.Position) then
							local v72 = p_u_59
							v72.t = v72.t + p70
							local v73 = p_u_59.t * 3.141592653589793 * 0.45
							local v74 = math.sin(v73) * -1 * 0.8
							v71.PrimaryPart.CFrame = v71.PrimaryPart.CFrame:Lerp(v_u_69 + Vector3.new(0, v74, 0), p70 * 1.5)
						end
					else
						return
					end
				end))
			end
		end))
		p_u_59.maid:GiveTask(function()
			-- upvalues: (ref) v_u_68
			if v_u_68 then
				v_u_68:Cancel()
				v_u_68 = nil
			end
		end)
	end
end
return v_u_18