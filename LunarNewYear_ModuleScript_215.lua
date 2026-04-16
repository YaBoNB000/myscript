-- LunarNewYear (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > LunarNewYear
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("UserInputService")
game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v_u_6 = require(v_u_2.devv).load
local v_u_7 = v_u_6("ScaleParticles")
local v_u_8 = v_u_6("LimitedEvents")
local v_u_9 = v_u_6("RetrieveModel")
local v_u_10 = v_u_6("globals")
local v_u_11 = v_u_6("v3sound")
local v_u_12 = v_u_6("Signal")
local v_u_13 = v3.TouchEnabled and 50 or 100
local v_u_14 = Random.new()
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = nil
local function v_u_26(p18)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_7
	local v_u_19 = v_u_9("Firework", "Items"):Clone()
	v_u_19.PrimaryPart.TextureID = "rbxassetid://108103935489774"
	v_u_19:PivotTo(CFrame.new(p18) * CFrame.fromOrientation(0, 6.283185307179586 * math.random(), 0))
	v_u_19.PrimaryPart.Anchored = false
	v_u_19.PrimaryPart.CanCollide = true
	v_u_19.PrimaryPart.CanTouch = true
	v_u_19.Parent = workspace.Game.Other
	local v20 = Instance.new("BodyVelocity")
	v20.Parent = v_u_19.PrimaryPart
	v20.Velocity = Vector3.new(0, 28, 0)
	local v21 = Instance.new("BodyGyro")
	v21.CFrame = v_u_19.PrimaryPart.CFrame
	v21.MaxTorque = Vector3.new(1, 1, 1) * (1 / 0)
	v21.Parent = v_u_19.PrimaryPart
	local v22 = v_u_11.newSound("fireworkLaunch")
	v22:attachToPart(v_u_19.PrimaryPart)
	v22:play()
	task.delay(math.random(5, 7) / 8, function()
		-- upvalues: (ref) v_u_9, (copy) v_u_19, (ref) v_u_7, (ref) v_u_11
		local v_u_23 = v_u_9("FireworkAllMedium", "Particles"):Clone()
		v_u_23.Anchored = true
		v_u_23.CanCollide = false
		v_u_23.CanTouch = false
		v_u_23.CFrame = v_u_19.PrimaryPart.CFrame
		v_u_23.Parent = workspace.Game.Other
		v_u_7(v_u_23, 4)
		for _, v24 in v_u_23:GetChildren() do
			if v24:IsA("ParticleEmitter") and (v24.Name == "Red" or v24.Name == "Yellow") then
				v24:Emit(50 + math.random(10))
			end
		end
		local v25 = v_u_11.newSound("quietfirework")
		v25.playbackSpeed = math.random(70, 130) / 100
		v25:attachToPart(v_u_23)
		v25:play()
		v_u_19:Destroy()
		task.delay(5, function()
			-- upvalues: (copy) v_u_23
			v_u_23:Destroy()
		end)
	end)
end
local function v_u_29(p_u_27)
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_26
	if p_u_27 and (p_u_27.Parent and p_u_27.PrimaryPart) then
		local v_u_28 = v_u_2.Models.Particles.PinataSmoke:Clone()
		v_u_28.Position = p_u_27.PrimaryPart.CFrame.Position
		v_u_28.Size = Vector3.new(4, 4, 4)
		v_u_28.Parent = workspace.Game.Local
		v_u_28.Smoke:Emit(25 + v_u_14:NextInteger(-4, 4))
		task.delay(2, function()
			-- upvalues: (copy) v_u_28
			v_u_28:Destroy()
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_26, (copy) p_u_27
			v_u_26(p_u_27.PrimaryPart.Position - Vector3.new(0, 1, 0))
		end)
	end
end
local function v_u_50()
	-- upvalues: (ref) v_u_17, (copy) v_u_15, (copy) v_u_2, (copy) v_u_4, (copy) v_u_12, (copy) v_u_6, (copy) v_u_29, (ref) v_u_16, (copy) v_u_5, (copy) v_u_13
	if v_u_17 and v_u_17.lanterns then
		local function v_u_33(p30)
			if p30 and p30.Parent then
				for _, v31 in p30:GetDescendants() do
					if v31:IsA("BasePart") and v31.Name ~= "Hitbox" then
						v31.Transparency = 0.9
					elseif v31:IsA("PointLight") then
						v31.Enabled = false
					end
				end
				local v32 = p30:FindFirstChild("ProximityPrompt", true)
				if v32 then
					v32:Destroy()
				end
			end
		end
		for v_u_34, v35 in v_u_15 do
			local v_u_36 = v_u_2.Models.Other.ChineseLantern:Clone()
			v_u_36.Name = v_u_4:IsStudio() and v_u_34 and v_u_34 or ""
			v_u_36:PivotTo(CFrame.new(v35) * CFrame.new(0, 7, 0) * CFrame.Angles(0, 6.283185307179586 * math.random(), 0))
			v_u_36.Parent = workspace.LunarNewYear
			if v_u_17.lanterns[v_u_34] then
				v_u_33(v_u_36)
			else
				local v37 = Instance.new("ProximityPrompt")
				v37.ActionText = "Collect"
				v37.HoldDuration = 0.5
				v37.RequiresLineOfSight = true
				v37.Parent = v_u_36.PrimaryPart
				v37.Triggered:Connect(function()
					-- upvalues: (ref) v_u_12, (copy) v_u_34, (ref) v_u_6, (copy) v_u_33, (copy) v_u_36, (ref) v_u_29
					if v_u_12.InvokeServer("collectLantern", v_u_34) then
						v_u_6("LunarMenu").CollectLantern(v_u_34)
						v_u_33(v_u_36)
						v_u_29(v_u_36)
					end
				end)
			end
			local v38 = v_u_16
			local v39 = {
				["model"] = v_u_36,
				["originalCFrame"] = v_u_36:GetPivot(),
				["flatPosition"] = v35 * Vector3.new(1, 0, 1)
			}
			table.insert(v38, v39)
		end
		local v_u_40 = 0
		local v_u_41 = nil
		v_u_41 = v_u_4.Heartbeat:Connect(function(p42)
			-- upvalues: (ref) v_u_16, (ref) v_u_41, (ref) v_u_40, (ref) v_u_5, (ref) v_u_13
			if #v_u_16 == 0 then
				if v_u_41 then
					v_u_41:Disconnect()
					v_u_41 = nil
				end
			else
				v_u_40 = v_u_40 + p42
				v_u_40 = v_u_40 % 1000
				local v43 = v_u_40 * 3.141592653589793 * 0.25
				local v44 = math.sin(v43) * -1 * 0.5
				local v45 = v_u_40 / 4
				local v46 = v_u_40
				local v47 = math.sin(v46) * 0.08
				for _, v48 in v_u_16 do
					local v49 = v48.model
					if v49 and (v49.Parent and (v49.PrimaryPart and v_u_13 >= v_u_5:DistanceFromCharacter(v49.PrimaryPart.Position))) then
						v49:PivotTo(v49:GetPivot():Lerp((v48.originalCFrame + Vector3.new(0, v44, 0)) * CFrame.Angles(0, v45, 0) * CFrame.Angles(v47, 0, 0), p42 * 1.5))
					end
				end
			end
		end)
	end
end
local function v_u_51()
	-- upvalues: (copy) v_u_8, (ref) v_u_16
	while task.wait(1) do
		if not v_u_8.IsActive("LunarNewYear") then
			workspace.LunarNewYear:ClearAllChildren()
			v_u_16 = {}
			return
		end
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_15, (copy) v_u_8, (ref) v_u_17, (copy) v_u_12, (copy) v_u_10, (copy) v_u_50, (copy) v_u_51
	for _, v52 in workspace.LunarNewYear:GetChildren() do
		v_u_15[v52.Name] = v52.Position
		v52:Destroy()
	end
	task.defer(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_17, (ref) v_u_12, (ref) v_u_10, (ref) v_u_50, (ref) v_u_51
		if v_u_8.IsActive("LunarNewYear") then
			repeat
				v_u_17 = v_u_12.InvokeServer("getLunarData")
				task.wait(1)
			until v_u_17 ~= nil
			if v_u_17 and (v_u_17.lanterns and v_u_17.playtime) then
				local v53 = 0
				for _, _ in v_u_17.lanterns do
					v53 = v53 + 1
				end
				local v54
				if v_u_10.LUNAR_EVENT.LANTERN_COUNT <= v53 then
					v54 = v_u_17.playtime >= v_u_10.LUNAR_EVENT.PLAYTIME_REQUIREMENT
				else
					v54 = false
				end
				if v54 then
					return
				end
			end
			v_u_50()
			task.spawn(v_u_51)
		end
	end)
end
return v1