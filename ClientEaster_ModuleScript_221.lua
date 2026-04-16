-- ClientEaster (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Easter
-- Original

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v4 = require(v_u_1.devv).load
local v_u_5 = v4("confetiiiiiiiiiiiii")
local v_u_6 = v4("LimitedEvents")
local v_u_7 = v4("EasterMenu")
v4("GUILoader")
local v_u_8 = v4("makeToast")
v4("globals")
local v_u_9 = v4("v3sound")
local v_u_10 = v4("Signal")
local v_u_11 = nil
local v_u_12 = {}
local v_u_13 = {}
local v14 = {}
local function v_u_30()
	-- upvalues: (copy) v_u_13, (ref) v_u_11, (copy) v_u_1, (copy) v_u_12, (copy) v_u_3, (copy) v_u_10, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8, (copy) v_u_5
	for v_u_15, v16 in v_u_13 do
		local v17 = v_u_11.eggs[v_u_15] ~= nil
		local v_u_18 = v_u_1.Models.Eggs[v_u_15]:Clone()
		v_u_18.Name = "Model"
		local v19 = CFrame.new(v16)
		local v20 = v_u_18.PrimaryPart.Size.Y * 0.5 + 0.25
		v_u_18:PivotTo(v19 + Vector3.new(0, v20, 0))
		v_u_18.Parent = workspace
		for _, v21 in v_u_18:GetDescendants() do
			if v21:IsA("BasePart") then
				v21.Name = "MeshPart"
				v21.CanCollide = false
				v21.CanQuery = false
				v21.CanTouch = false
			end
		end
		if v17 then
			v_u_18.PrimaryPart.Transparency = 0.9
			for _, v22 in v_u_18.PrimaryPart:GetChildren() do
				if v22:IsA("Texture") then
					v22.Transparency = 0.9
				end
			end
			v_u_12[v_u_15] = {
				["spawnCFrame"] = v_u_18:GetPivot(),
				["model"] = v_u_18
			}
		else
			local v_u_23 = Instance.new("ProximityPrompt")
			v_u_23.ActionText = "Collect"
			v_u_23.HoldDuration = 0.25
			v_u_23.RequiresLineOfSight = true
			v_u_23.Parent = v_u_18.PrimaryPart
			v_u_23.Triggered:Once(function(p24)
				-- upvalues: (ref) v_u_3, (ref) v_u_10, (copy) v_u_15, (ref) v_u_7, (ref) v_u_9, (copy) v_u_18, (copy) v_u_23, (ref) v_u_8, (ref) v_u_5
				if p24 == v_u_3 then
					local v25, v26 = v_u_10.InvokeServer("attemptCollectEgg", v_u_15)
					if v25 then
						v_u_7.SetEggHidden(v_u_15, false)
						local v27 = v_u_9.newSound("collectEgg")
						v27:attachToPart(v_u_18.PrimaryPart)
						v27:play()
						if v_u_18 and v_u_18.Parent then
							v_u_18.PrimaryPart.Transparency = 0.9
							for _, v28 in v_u_18.PrimaryPart:GetChildren() do
								if v28:IsA("Texture") then
									v28.Transparency = 0.9
								end
							end
							v_u_23:Destroy()
						end
						local v29 = string.gsub(v_u_15, "%D", "")
						if v26 == 1 then
							v_u_8(string.format("Egg #%s found! There is %s egg remaining!", v29, v26), "rainbow", 6)
							return
						end
						if v26 > 0 then
							v_u_8(string.format("Egg #%s found! There are %s eggs remaining!", v29, v26), "rainbow", 6)
							return
						end
						v_u_8(string.format("Egg #%s found! You completed the OHIO MEGA EGG HUNT!", v29, v26), "rainbow", 6)
						v_u_5()
					end
				end
			end)
			v_u_12[v_u_15] = {
				["spawnCFrame"] = v_u_18:GetPivot(),
				["model"] = v_u_18,
				["prompt"] = v_u_23
			}
		end
	end
end
local function v_u_33()
	-- upvalues: (copy) v_u_6, (copy) v_u_12, (copy) v_u_3
	while task.wait(1) and v_u_6.IsActive("EggHunt") do
		for _, v31 in v_u_12 do
			local v32 = v31.model
			if v32 and v32.PrimaryPart then
				v31.isLODed = v_u_3:DistanceFromCharacter(v32.PrimaryPart.Position) > 500
				if v31.isLODed then
					v32.Parent = nil
				else
					v32.Parent = workspace
				end
			end
		end
	end
end
local function v_u_37()
	-- upvalues: (copy) v_u_6, (copy) v_u_12
	while task.wait(1) do
		if not v_u_6.IsActive("EggHunt") then
			for v34, v35 in v_u_12 do
				local v36 = v35.model
				if v36 then
					v36:Destroy()
				end
				v_u_12[v34] = nil
			end
			return
		end
	end
end
function v14.Initialize()
	-- upvalues: (copy) v_u_13, (copy) v_u_6, (ref) v_u_11, (copy) v_u_10, (copy) v_u_30, (copy) v_u_2, (copy) v_u_12, (copy) v_u_33, (copy) v_u_7, (copy) v_u_37
	for _, v38 in workspace.EggSpawns:GetChildren() do
		v_u_13[v38.Name] = v38.Position
		v38.Transparency = 1
		v38.Name = "Part"
	end
	workspace.EggSpawns:Destroy()
	task.defer(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_11, (ref) v_u_10, (ref) v_u_30, (ref) v_u_2, (ref) v_u_12, (ref) v_u_33, (ref) v_u_7
		if v_u_6.IsActive("EggHunt") then
			repeat
				v_u_11 = v_u_10.InvokeServer("getEasterData")
				task.wait(1)
			until v_u_11 ~= nil
			v_u_30()
			local v_u_39 = 0
			v_u_2.Heartbeat:Connect(function(p40)
				-- upvalues: (ref) v_u_39, (ref) v_u_12
				local v41 = v_u_39 % 6.283185307179586 * 0.5
				local v42 = 1 - math.sin(v41) ^ 2
				local v43 = v_u_39 * 0.5 % 6.283185307179586
				for _, v44 in v_u_12 do
					local v45 = v44.model
					if v45 and (v45.Parent and not v44.isLODed) then
						v45:PivotTo(v45:GetPivot():Lerp(v44.spawnCFrame * CFrame.new(0, v42 * 0.4, 0) * CFrame.Angles(0, v43, 0), 0.1))
					end
				end
				v_u_39 = v_u_39 + p40
			end)
			task.spawn(v_u_33)
			v_u_7.UpdateDiscovered()
		end
	end)
	task.spawn(v_u_37)
end
return v14