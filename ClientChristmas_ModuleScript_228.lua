-- ClientChristmas (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Christmas
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("CollectionService")
local v4 = require(v2.devv).load
local v_u_5 = v4("confetiiiiiiiiiiiii")
local v_u_6 = v4("secondsToClock")
local v_u_7 = v4("LimitedEvents")
v4("shortenTime")
local v_u_8 = v4("commavalue")
local v_u_9 = v4("makeToast")
local v_u_10 = v4("ChristmasEventMob")
local v_u_11 = v4("EventGingerbread")
local v_u_12 = v4("v3sound")
local v_u_13 = v4("Signal")
local v_u_14 = {}
local v_u_15 = 0
local function v_u_24()
	-- upvalues: (copy) v_u_14, (ref) v_u_15, (copy) v_u_9, (copy) v_u_6, (copy) v_u_13
	for _, v16 in workspace:WaitForChild("Christmas"):WaitForChild("SnowballPiles"):GetChildren() do
		if v16.Name == "SnowballPile" then
			local v17 = v_u_14
			table.insert(v17, v16)
		end
	end
	for _, v18 in v_u_14 do
		local v19 = Instance.new("ProximityPrompt")
		v19.ActionText = "Grab Snowballs"
		v19.RequiresLineOfSight = false
		v19.MaxActivationDistance = 8
		v19.HoldDuration = 0.75
		v19.Parent = v18.PrimaryPart
		v19.Triggered:Connect(function(_)
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_6, (ref) v_u_13, (ref) v_u_14
			if os.time() - v_u_15 < 300 then
				v_u_9(string.format("Try again in %s!", v_u_6(300 - (os.time() - v_u_15))), "red", 3)
				return
			else
				local v20, v21 = v_u_13.InvokeServer("attemptGrabSnowballs")
				if v20 then
					v_u_15 = os.time()
					for _, v22 in v_u_14 do
						local v23 = v22:FindFirstChild("Snowballs")
						if v23 then
							v23.Transparency = 1
						end
					end
				elseif not v21 then
					v_u_9("Failed to grab snowballs. Try again!", "red", 3)
				end
			end
		end)
	end
end
local function v_u_30(p25)
	-- upvalues: (copy) v_u_10
	if p25 then
		local v26 = workspace:WaitForChild("Christmas"):WaitForChild("MobSpawns")
		for _, v27 in p25 do
			local v28 = v27.spawnName
			if not workspace.Christmas.Mobs:FindFirstChild(v28) then
				local v29 = v26[v28].Position
				v_u_10.new(v27.mobName, v28, v29)
			end
		end
	end
end
local function v_u_43()
	-- upvalues: (copy) v_u_13, (copy) v_u_9, (copy) v_u_8, (copy) v_u_5, (copy) v_u_12, (copy) v_u_3
	repeat
		local v_u_31 = v_u_13.InvokeServer("getFoundElfs")
		task.wait(1)
	until v_u_31 ~= nil
	repeat
		task.wait(0.1)
	until workspace:GetAttribute("adventDay") ~= nil
	local function v41(p_u_32)
		-- upvalues: (ref) v_u_31, (ref) v_u_13, (ref) v_u_9, (ref) v_u_8, (ref) v_u_5, (ref) v_u_12
		local v_u_33 = workspace:GetAttribute("adventDay")
		if v_u_33 and v_u_31["Day" .. v_u_33] then
			for _, v34 in p_u_32:GetChildren() do
				if v34:IsA("BasePart") and v34.Name ~= "Hitbox" then
					v34.Transparency = 0.5
					v34.Color = Color3.new(0, 0, 0)
				end
			end
			local v35 = p_u_32:FindFirstChild("Sparkles", true)
			if v35 then
				v35:Destroy()
			end
		else
			local v_u_36 = Instance.new("ProximityPrompt")
			v_u_36.ActionText = "Collect"
			v_u_36.HoldDuration = 0.5
			v_u_36.RequiresLineOfSight = false
			v_u_36.Parent = p_u_32.PrimaryPart
			v_u_36.Triggered:Connect(function()
				-- upvalues: (ref) v_u_13, (ref) v_u_31, (ref) v_u_33, (ref) v_u_9, (ref) v_u_8, (ref) v_u_5, (ref) v_u_12, (copy) v_u_36, (copy) p_u_32
				local v37, v38 = v_u_13.InvokeServer("attemptCollectElf")
				if v37 then
					if not v_u_31 then
						v_u_31 = {}
					end
					v_u_33 = workspace:GetAttribute("adventDay")
					v_u_31["Day" .. v_u_33] = true
					v_u_9(string.format("\240\159\142\133 You found the daily Elf! +%s Gingerbread", v_u_8(v38)), "rainbow", 8)
					v_u_5()
					v_u_12.newLocalSound("dopamine"):Play()
					v_u_36:Destroy()
					for _, v39 in p_u_32:GetChildren() do
						if v39:IsA("BasePart") and v39.Name ~= "Hitbox" then
							v39.Transparency = 0.5
							v39.Color = Color3.new(0, 0, 0)
						end
					end
					local v40 = p_u_32:FindFirstChild("Sparkles", true)
					if v40 then
						v40:Destroy()
					end
				end
			end)
		end
	end
	for _, v42 in v_u_3:GetTagged("PeterTheElf") do
		v41(v42)
	end
	v_u_3:GetInstanceAddedSignal("PeterTheElf"):Connect(v41)
end
local function v_u_44()
	-- upvalues: (copy) v_u_7
	while task.wait(1) do
		if not v_u_7.IsActive("Christmas") then
			workspace:WaitForChild("Christmas"):WaitForChild("Mobs"):ClearAllChildren()
			break
		end
	end
	workspace:WaitForChild("Christmas"):WaitForChild("Mobs"):ClearAllChildren()
end
local function v_u_52(p45, ...)
	-- upvalues: (copy) v_u_11
	if p45 == "spawn" then
		local v46, v47 = ...
		for v48 = 1, #v47 do
			v_u_11.SpawnSingle(CFrame.new(v47[v48]) * CFrame.Angles(6.283185307179586 * math.random(), 6.283185307179586 * math.random(), 6.283185307179586 * math.random()), v46)
		end
	elseif p45 == "explode" then
		local v49, v50, v51 = ...
		v_u_11.Spawn(v49, CFrame.new(v51 + Vector3.new(0, 1, 0)) * CFrame.Angles(0, 6.283185307179586 * math.random(), 0), v50, 1.33)
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_13, (copy) v_u_30, (copy) v_u_52, (copy) v_u_24, (ref) v_u_15, (copy) v_u_14, (copy) v_u_7, (copy) v_u_43, (copy) v_u_44
	v_u_13.LinkSignal("updateMobs", v_u_30)
	v_u_13.LinkSignal("spawnGingerbread", v_u_52)
	task.spawn(function()
		-- upvalues: (ref) v_u_24, (ref) v_u_15, (ref) v_u_14
		v_u_24()
		while task.wait(1) do
			if os.time() - v_u_15 >= 300 then
				for _, v53 in v_u_14 do
					local v54 = v53:FindFirstChild("Snowballs")
					if v54 then
						v54.Transparency = 0
					end
				end
			end
		end
	end)
	if v_u_7.IsActive("Christmas") then
		task.spawn(v_u_43)
	end
	task.spawn(v_u_44)
end
return v1