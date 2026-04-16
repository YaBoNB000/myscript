-- ClientFireworkEvent (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local _ = game:GetService("Players").LocalPlayer
local v4 = require(v_u_2.devv).load
local v_u_5 = v4("FireworkEventMenu")
local v_u_6 = v4("ScaleParticles")
local v_u_7 = v4("getColorDelta")
local v_u_8 = v4("fireworkEvent")
local v_u_9 = v4("RetrieveModel")
local v_u_10 = v4("LimitedEvents")
local v_u_11 = v4("v3sound")
v4("globals")
local v_u_12 = v4("Signal")
local v_u_13 = v4("Maid")
local v_u_14 = Random.new()
local v_u_15 = {}
local v_u_16 = nil
local function v_u_25(p17)
	-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_11, (copy) v_u_6
	local v_u_18 = v_u_9("July 4th Firework", "Items"):Clone()
	v_u_18.PrimaryPart.TextureID = "rbxassetid://13843130611"
	v_u_18:PivotTo(CFrame.new(p17) * CFrame.fromOrientation(0, 6.283185307179586 * v_u_14:NextNumber(), 0))
	v_u_18.PrimaryPart.Anchored = false
	v_u_18.PrimaryPart.CanCollide = true
	v_u_18.PrimaryPart.CanTouch = true
	v_u_18.Parent = workspace.Game.Other
	local v19 = Instance.new("BodyVelocity")
	v19.Parent = v_u_18.PrimaryPart
	v19.Velocity = Vector3.new(0, 28, 0)
	local v20 = Instance.new("BodyGyro")
	v20.CFrame = v_u_18.PrimaryPart.CFrame
	v20.MaxTorque = Vector3.new(1, 1, 1) * (1 / 0)
	v20.Parent = v_u_18.PrimaryPart
	local v21 = v_u_11.newSound("fireworkLaunch")
	v21:attachToPart(v_u_18.PrimaryPart)
	v21:play()
	task.delay(math.random(7, 12) / 8, function()
		-- upvalues: (ref) v_u_9, (copy) v_u_18, (ref) v_u_6, (ref) v_u_11
		local v_u_22 = v_u_9("FireworkAllMedium", "Particles"):Clone()
		v_u_22.Anchored = true
		v_u_22.CanCollide = false
		v_u_22.CanTouch = false
		v_u_22.CFrame = v_u_18.PrimaryPart.CFrame
		v_u_22.Parent = workspace.Game.Other
		v_u_6(v_u_22, 2)
		for _, v23 in v_u_22:GetChildren() do
			if v23:IsA("ParticleEmitter") and (v23.Name == "Red" or (v23.Name == "Blue" or v23.Name == "White")) then
				v23:Emit(75 + math.random(5))
			end
		end
		local v24 = v_u_11.newSound("quietfirework")
		v24.playbackSpeed = math.random(70, 130) / 100
		v24:attachToPart(v_u_22)
		v24:play()
		v_u_18:Destroy()
		task.delay(5, function()
			-- upvalues: (copy) v_u_22
			v_u_22:Destroy()
		end)
	end)
end
local function v_u_58()
	-- upvalues: (copy) v_u_15, (ref) v_u_16, (copy) v_u_13, (copy) v_u_2, (copy) v_u_14, (copy) v_u_7, (copy) v_u_12, (copy) v_u_25, (copy) v_u_5, (copy) v_u_3, (copy) v_u_11
	for v_u_26, v27 in v_u_15 do
		if not v_u_16[v_u_26] then
			local v_u_28 = v_u_13.new()
			local v_u_29 = v_u_2.Models.Other.FireworkBarrel:Clone()
			local v30 = CFrame.new(v27)
			local v31 = v_u_29.PrimaryPart.Size.Y * 0.5 - 0.5
			v_u_29:PivotTo((v30 + Vector3.new(0, v31, 0)) * CFrame.fromOrientation(0, 6.283185307179586 * v_u_14:NextNumber(), 0))
			v_u_29:SetAttribute("health", 100)
			v_u_29:SetAttribute("maxHealth", 100)
			v_u_29.Parent = workspace.Fireworks
			local v_u_32 = v_u_2.Guis.BillboardGuis.HealthBillboard:Clone()
			v_u_32.Size = UDim2.fromScale(6.125, 2.1875)
			v_u_32.Parent = v_u_29.PrimaryPart
			local v_u_33 = v_u_32.Frame.Health
			local v_u_34 = {}
			for _, v35 in v_u_29:GetDescendants() do
				if v35:IsA("BasePart") then
					v_u_34[v35] = v35.Size
				end
			end
			local function v56(p36)
				-- upvalues: (copy) v_u_32, (copy) v_u_29, (ref) v_u_7, (copy) v_u_33, (ref) v_u_2, (ref) v_u_14, (ref) v_u_12, (copy) v_u_26, (ref) v_u_25, (ref) v_u_5, (ref) v_u_3, (copy) v_u_34, (ref) v_u_11
				if v_u_32 and v_u_32.Parent then
					local v37 = v_u_29:GetAttribute("health")
					local v38 = v_u_29:GetAttribute("maxHealth")
					local v39 = v37 / v38
					local v40 = math.clamp(v39, 0, 1)
					local v41 = v40 >= 1 and Color3.new(0, 0.839216, 0) or Color3.new(0.901961, 0, 0)
					local v42 = v_u_7(v41, -150)
					v_u_33.RealBar.BackgroundColor3 = v41
					v_u_33.UIStroke.Color = v42
					v_u_33.HealthLabel.UIStroke.Color = v42
					v_u_33.HealthLabel.Text = v37 .. "/" .. v38
					v_u_33.RealBar.Visible = v40 > 0
					v_u_33.RealBar.Size = UDim2.fromScale(v40, 1)
					if v37 <= 0 then
						local v_u_43 = v_u_2.Models.Particles.PinataSmoke:Clone()
						v_u_43.Position = v_u_29.PrimaryPart.CFrame.Position
						v_u_43.Size = Vector3.new(6, 6, 6)
						v_u_43.Parent = workspace.Game.Local
						v_u_43.Smoke:Emit(25 + v_u_14:NextInteger(-2, 4))
						task.delay(2, function()
							-- upvalues: (copy) v_u_43
							v_u_43:Destroy()
						end)
						v_u_12.FireServer("collectFirework", v_u_26)
						local v_u_44 = v_u_29.PrimaryPart.Position - Vector3.new(0, 1, 0)
						task.spawn(function()
							-- upvalues: (ref) v_u_25, (copy) v_u_44, (ref) v_u_14
							for _ = 1, 3 do
								local v45 = v_u_25
								local v46 = v_u_44
								local v47 = v_u_14:NextInteger(1, 65) / 40
								local v48 = v_u_14:NextInteger(1, 65) / 40
								v45(v46 + Vector3.new(v47, 0, v48))
								task.wait(0.35)
							end
						end)
						v_u_29:Destroy()
						v_u_5.UpdateCollected(v_u_26)
					else
						local v49 = v_u_29 and v_u_29.Parent
						if v49 then
							v49 = v_u_29.PrimaryPart
						end
						if v49 and not p36 then
							local v_u_50 = TweenInfo.new(0.16, Enum.EasingStyle.Back)
							for _, v51 in v_u_29:GetDescendants() do
								if v51:IsA("BasePart") then
									v_u_3:Create(v51, v_u_50, {
										["Size"] = v_u_34[v51] + v_u_34[v51] * 0.1
									}):Play()
								end
							end
							task.delay(0.135, function()
								-- upvalues: (ref) v_u_29, (ref) v_u_3, (copy) v_u_50, (ref) v_u_34
								local v52 = v_u_29 and v_u_29.Parent
								if v52 then
									v52 = v_u_29.PrimaryPart
								end
								if v52 then
									for _, v53 in v_u_29:GetDescendants() do
										if v53:IsA("BasePart") then
											v_u_3:Create(v53, v_u_50, {
												["Size"] = v_u_34[v53]
											}):Play()
										end
									end
								end
							end)
							local v54 = v_u_29 and v_u_29.Parent
							if v54 then
								v54 = v_u_29.PrimaryPart
							end
							if v54 then
								local v55 = v_u_11.newSound("pinataHit")
								v55:attachToPart(v_u_29.PrimaryPart)
								v55:play()
							end
						end
					end
				else
					return
				end
			end
			v56(true)
			v_u_28:GiveTask(v_u_29:GetAttributeChangedSignal("health"):Connect(v56))
			v_u_28:GiveTask(v_u_29:GetAttributeChangedSignal("maxHealth"):Connect(v56))
			v_u_29.AncestryChanged:Once(function(_, p57)
				-- upvalues: (copy) v_u_28
				if not p57 then
					v_u_28:DoCleaning()
				end
			end)
		end
	end
end
local function v_u_59()
	-- upvalues: (copy) v_u_10
	while task.wait(1) do
		if not v_u_10.IsActive("July4th2025") then
			workspace.Fireworks:ClearAllChildren()
			return
		end
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_8, (copy) v_u_15, (copy) v_u_10, (ref) v_u_16, (copy) v_u_12, (copy) v_u_58, (copy) v_u_59
	local v60 = 0
	for _, _ in v_u_8 do
		v60 = v60 + 1
		local v61 = workspace.FireworkSpawns:FindFirstChild("Firework" .. v60)
		v61.Transparency = 1
		v_u_15["Firework" .. v60] = v61.Position
	end
	workspace.FireworkSpawns:Destroy()
	task.defer(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_16, (ref) v_u_12, (ref) v_u_58, (ref) v_u_59
		if v_u_10.IsActive("July4th2025") then
			repeat
				v_u_16 = v_u_12.InvokeServer("getFireworkData")
				task.wait(1)
			until v_u_16 ~= nil
			v_u_58()
			task.spawn(v_u_59)
		end
	end)
end
return v1