-- ChristmasEventMob (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Christmas
-- Original

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local _ = game:GetService("Players").LocalPlayer
local v4 = require(v_u_1.devv).load
local v_u_5 = v4("EventGingerbread")
local v_u_6 = v4("ScaleParticles")
local v_u_7 = v4("christmasMobs")
local v_u_8 = v4("getColorDelta")
local v_u_9 = v4("v3sound")
local v_u_10 = v4("Signal")
local v_u_11 = v4("Maid")
local v_u_12 = Random.new()
local v_u_13 = TweenInfo.new(0.16, Enum.EasingStyle.Back)
local _ = v2.TouchEnabled
local v_u_14 = {
	Color3.fromRGB(180, 0, 0),
	Color3.fromRGB(0, 170, 0),
	Color3.fromRGB(170, 170, 255),
	Color3.fromRGB(255, 170, 255),
	Color3.fromRGB(85, 85, 255)
}
local v_u_15 = {}
v_u_15.__index = v_u_15
function v_u_15.new(p16, p17, p18)
	-- upvalues: (copy) v_u_15, (copy) v_u_1, (copy) v_u_12, (copy) v_u_14, (copy) v_u_11
	local v19 = v_u_15
	local v_u_20 = setmetatable({}, v19)
	local v21 = v_u_1.Models.ChristmasEvent[p16]:Clone()
	v21.Name = p17
	local v22 = CFrame.new(p18)
	local v23 = v21.PrimaryPart.Size.Y * 0.5 - 0.5
	v21:PivotTo((v22 + Vector3.new(0, v23, 0)) * CFrame.fromOrientation(0, 6.283185307179586 * v_u_12:NextNumber(), 0))
	v21:SetAttribute("health", 100)
	v21:SetAttribute("maxHealth", 100)
	v21:SetAttribute("mobName", p16)
	v21.Parent = workspace.Christmas.Mobs
	local v24 = v_u_14[v_u_12:NextInteger(1, #v_u_14)]
	if p16 == "BigPresent" then
		v24 = Color3.fromRGB(255, 170, 0)
		local v25 = v21:FindFirstChild("D", true)
		if v25 then
			v25.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 170, 0)) })
		end
	end
	for _, v26 in v21:GetDescendants() do
		if v26.Color == Color3.fromRGB(180, 0, 0) then
			v26.Color = v24
		end
	end
	local v27 = v_u_1.Guis.BillboardGuis.HealthBillboard:Clone()
	v27.ExtentsOffset = Vector3.new(0, -0.2, 0)
	v27.Size = UDim2.fromScale(v27.Size.X.Scale * 1.5, v27.Size.Y.Scale * 1.5)
	v27.Parent = v21.PrimaryPart
	v_u_20.mobName = p16
	v_u_20.model = v21
	v_u_20.healthBar = v27
	v_u_20.originalSizes = {}
	v_u_20.t = 0
	v_u_20.maid = v_u_11.new()
	for _, v28 in v21:GetDescendants() do
		if v28:IsA("BasePart") then
			v_u_20.originalSizes[v28] = v28.Size
		end
	end
	v_u_20:_updateHealth(true)
	v_u_20.maid:GiveTask(v21:GetAttributeChangedSignal("health"):Connect(function()
		-- upvalues: (copy) v_u_20
		v_u_20:_updateHealth()
	end))
	v_u_20.maid:GiveTask(v21:GetAttributeChangedSignal("maxHealth"):Connect(function()
		-- upvalues: (copy) v_u_20
		v_u_20:_updateHealth()
	end))
	v21.AncestryChanged:Once(function(_, p29)
		-- upvalues: (copy) v_u_20
		if not p29 then
			v_u_20:Destroy()
		end
	end)
	return v_u_20
end
function v_u_15.Destroy(p30)
	if p30.maid then
		p30.maid:DoCleaning()
		p30.maid = nil
	end
	if p30:_isValid() then
		p30.model:Destroy()
		p30.model = nil
	end
end
function v_u_15._onDestroyed(p31)
	-- upvalues: (copy) v_u_1, (copy) v_u_12, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_5
	local v32 = p31.model
	if v32 and v32.Parent then
		local v33 = v32:GetAttribute("mobName") == "Big Present" and 3 or 2
		local v_u_34 = v_u_1.Models.Particles.PinataSmoke:Clone()
		v_u_34.Size = Vector3.new(8, 8, 8)
		v_u_34.CFrame = v32.PrimaryPart.CFrame * CFrame.fromOrientation(0, 6.283185307179586 * v_u_12:NextNumber(), 0)
		v_u_34.Parent = workspace.Game.Local
		v_u_6(v_u_34, v33)
		v_u_34.Smoke:Emit(20 + v_u_12:NextInteger(-2, 4))
		task.delay(2, function()
			-- upvalues: (copy) v_u_34
			v_u_34:Destroy()
		end)
		local v35 = v_u_9.newSound("pinataSmash")
		v35:attachToPart(v32.PrimaryPart)
		v35:play()
		if v_u_10.InvokeServer("attemptCollectMob", p31.mobName, v32.Name) then
			local v36 = v_u_7[p31.mobName]
			v_u_5.Spawn(v36.gingerbreadUnits, v32.PrimaryPart.CFrame, v36.gingerbread)
		end
		p31:Destroy()
	end
end
function v_u_15._onHit(p_u_37)
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_9
	local v_u_38 = p_u_37.model
	if v_u_38 and v_u_38.Parent then
		for _, v39 in v_u_38:GetDescendants() do
			if v39:IsA("BasePart") then
				v_u_3:Create(v39, v_u_13, {
					["Size"] = p_u_37.originalSizes[v39] + p_u_37.originalSizes[v39] * 0.1
				}):Play()
			end
		end
		task.delay(0.135, function()
			-- upvalues: (copy) p_u_37, (copy) v_u_38, (ref) v_u_3, (ref) v_u_13
			if p_u_37:_isValid() then
				for _, v40 in v_u_38:GetDescendants() do
					if v40:IsA("BasePart") then
						v_u_3:Create(v40, v_u_13, {
							["Size"] = p_u_37.originalSizes[v40]
						}):Play()
					end
				end
			end
		end)
		if p_u_37:_isValid() then
			local v41 = v_u_9.newSound("pinataHit")
			v41:attachToPart(v_u_38.PrimaryPart)
			v41:play()
		end
	end
end
function v_u_15._updateHealth(p42, p43)
	-- upvalues: (copy) v_u_8
	local v44 = p42.healthBar
	local v45 = p42.model
	if v44 and v44.Parent then
		local v46 = v44.Frame.Health
		local v47 = v45:GetAttribute("health")
		local v48 = v45:GetAttribute("maxHealth")
		local v49 = v47 / v48
		local v50 = math.clamp(v49, 0, 1)
		local v51 = v50 >= 1 and Color3.new(0, 0.839216, 0) or Color3.new(0.901961, 0, 0)
		local v52 = v_u_8(v51, -150)
		v46.RealBar.BackgroundColor3 = v51
		v46.UIStroke.Color = v52
		v46.HealthLabel.UIStroke.Color = v52
		v46.HealthLabel.Text = v47 .. "/" .. v48
		v46.RealBar.Visible = v50 > 0
		v46.RealBar.Size = UDim2.fromScale(v50, 1)
		if v47 <= 0 then
			p42:_onDestroyed()
		elseif p42:_isValid() and not p43 then
			p42:_onHit()
		end
	else
		return
	end
end
function v_u_15._isValid(p53)
	local v54 = p53.model and p53.model.Parent
	if v54 then
		v54 = p53.model.PrimaryPart
	end
	return v54
end
return v_u_15