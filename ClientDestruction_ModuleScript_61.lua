-- ClientDestruction (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("UserInputService").TouchEnabled
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
game:GetService("HttpService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Players").LocalPlayer
local v7 = require(v3.devv).load
local v_u_8 = v7("Signal")
v7("GUID")
local v_u_9 = v7("Maid")
local v_u_10 = require(script.makeDebris)
local v_u_11, v_u_12
if v1 then
	v_u_11 = 40
	v_u_12 = 30
else
	v_u_11 = 100
	v_u_12 = 150
end
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = 0
function v_u_13.GetWall(p19)
	-- upvalues: (copy) v_u_14
	return v_u_14[p19]
end
function v_u_13.GetWallByGUID(p20)
	-- upvalues: (copy) v_u_15, (copy) v_u_14
	local v21 = v_u_15[p20]
	if v21 and v_u_14[v21] then
		return v_u_14[v21]
	end
end
local function v_u_25(p22, p23)
	for _, v24 in ipairs(p22:GetChildren()) do
		if v24:IsA("Decal") or v24:IsA("Texture") then
			v24.Transparency = p23 or (v24:GetAttribute("originalTransparency") or 0)
		end
	end
end
function v_u_13._unpaintWall(p26)
	-- upvalues: (copy) v_u_13, (copy) v_u_16
	local v27 = p26:GetAttribute("WallGUID")
	local v28 = v_u_13.GetWall(p26)
	if p26 and (v27 and v28) then
		local v29 = p26:GetAttribute("paintAmount") or 0
		local v30 = p26:GetAttribute("originalColor") or Color3.new(1, 1, 1)
		local _ = p26:GetAttribute("paintColor") or v30
		local v31 = v29 / 2
		local v32 = v31 < 0.1 and 0 or v31
		local v33 = p26.Color:Lerp(v30, 1 - v32 / 1)
		p26.Color = v33
		p26:SetAttribute("paintColor", v33)
		p26:SetAttribute("paintAmount", v32)
		v28.lastPainted = os.clock()
		if v32 == 0 then
			p26:SetAttribute("paintColor", nil)
			p26:SetAttribute("paintAmount", nil)
			p26.Color = v30
			v_u_16[v27] = nil
		end
	end
end
function v_u_13._paintWalls(p34, p35)
	-- upvalues: (copy) v_u_13, (copy) v_u_16
	for _, v36 in p34 do
		local v37 = v_u_13.GetWall(v36)
		if v37 then
			local v38 = v36:GetAttribute("WallGUID")
			local v39 = v36:GetAttribute("originalColor") or Color3.new(1, 1, 1)
			local v40 = v36:GetAttribute("paintAmount")
			if not v40 then
				v36:SetAttribute("paintAmount", 0)
				v40 = 0
			end
			local v41 = 1.5 / v36.Size.Magnitude
			local v42 = v40 + v41
			v36:SetAttribute("paintAmount", (math.clamp(v42, 0, 1)))
			v37.lastPainted = os.clock()
			local v43 = v36:GetAttribute("paintColor")
			if v36:GetAttribute("paintColor") then
				v36:SetAttribute("paintColor", v43:Lerp(p35, v41))
			else
				v36:SetAttribute("paintColor", v39:Lerp(p35, v41))
			end
			v36.Color = v36:GetAttribute("paintColor") or v39
			v_u_16[v38] = v36
		end
	end
end
function v_u_13._doBurnAnimation(p44)
	-- upvalues: (copy) v_u_4, (copy) v_u_25
	local v45 = p44.wall
	local v46 = v45:GetAttribute("originalColor") or Color3.new(1, 1, 1)
	local v47 = { v46:lerp(Color3.new(0, 0, 0), 0.5), Color3.new(0, 0, 0) }
	local v48 = nil
	for v49 = 1, #v47 do
		if v48 then
			v48:Pause()
		end
		v48 = v_u_4:Create(v45, TweenInfo.new(3), {
			["Color"] = v47[v49]
		})
		v48:Play()
		task.wait(3)
	end
	if v48 then
		v48:Pause()
	end
	v_u_25(v45, 1)
	v45.Transparency = 1
	v45.Color = v46
end
function v_u_13._doMeltAnimation(p50)
	-- upvalues: (copy) v_u_4, (copy) v_u_25
	local v51 = p50.wall
	local v52 = v51:GetAttribute("originalColor") or Color3.new(1, 1, 1)
	local v53 = { Color3.new(0, 1, 0), Color3.new(0, 0, 0) }
	local v54 = nil
	for v55 = 1, #v53 do
		if v54 then
			v54:Pause()
		end
		v54 = v_u_4:Create(v51, TweenInfo.new(4), {
			["Color"] = v53[v55]
		})
		v54:Play()
		task.wait(4)
	end
	if v54 then
		v54:Pause()
	end
	v_u_25(v51, 1)
	v51.Transparency = 1
	v51.Color = v52
end
function v_u_13._burnWall(p56)
	-- upvalues: (copy) v_u_13
	local v57 = v_u_13.GetWall(p56)
	if v57 and v57.isDestroyed == false then
		v57.isDestroyed = true
		v57.lastDestroyed = os.clock()
		task.defer(v_u_13._doBurnAnimation, v57)
	end
end
function v_u_13._burnWalls(p58)
	-- upvalues: (copy) v_u_13
	for _, v59 in ipairs(p58) do
		local v60 = v59.object
		v_u_13._burnWall(v60)
	end
end
function v_u_13._meltWall(p61)
	-- upvalues: (copy) v_u_13
	local v62 = v_u_13.GetWall(p61)
	if v62 and v62.isDestroyed == false then
		v62.isDestroyed = true
		v62.lastDestroyed = os.clock()
		task.defer(v_u_13._doMeltAnimation, v62)
	end
end
function v_u_13._meltWalls(p63)
	-- upvalues: (copy) v_u_13
	for _, v64 in ipairs(p63) do
		local v65 = v64.object
		v_u_13._meltWall(v65)
	end
end
function v_u_13._destroyWall(p66, p67)
	-- upvalues: (copy) v_u_13, (copy) v_u_17
	local v68 = v_u_13.GetWall(p66)
	if v68 and v68.isDestroyed == false then
		v68.isDestroyed = true
		v68.lastDestroyed = os.clock()
		v68.impactPoint = p67
		local v69 = v_u_17
		table.insert(v69, p66)
	end
end
function v_u_13._destroyWalls(p70)
	-- upvalues: (copy) v_u_13
	for _, v71 in ipairs(p70) do
		local v72 = v71.object
		local v73 = v71.impactPoint
		v_u_13._destroyWall(v72, v73)
	end
end
function v_u_13._clearDebris(p74)
	for v75 in pairs(p74) do
		v75:Destroy()
		p74[v75] = nil
	end
end
function v_u_13._respawn(p76)
	-- upvalues: (copy) v_u_4, (ref) v_u_18, (copy) v_u_13, (copy) v_u_14
	local function v80(p_u_77)
		-- upvalues: (ref) v_u_4, (ref) v_u_18
		for v_u_78 in pairs(p_u_77) do
			local v79 = v_u_4:Create(v_u_78, TweenInfo.new(1), {
				["Transparency"] = 1
			})
			v79:Play()
			v79.Completed:Once(function()
				-- upvalues: (copy) p_u_77, (copy) v_u_78, (ref) v_u_18
				p_u_77[v_u_78] = nil
				v_u_78:Destroy()
				v_u_18 = v_u_18 - 1
			end)
		end
	end
	local v81 = v_u_13.GetWallByGUID(p76)
	if v81 then
		v80(v_u_14[v81.wall].debris)
	end
end
function v_u_13._registerAllWalls()
	-- upvalues: (copy) v_u_13
	repeat
		task.wait(0.1)
	until workspace.Game:GetAttribute("wallsRegistered")
	v_u_13._registerWalls(workspace)
end
function v_u_13._registerWalls(p82)
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_9, (copy) v_u_13
	local function v87(p_u_83)
		-- upvalues: (ref) v_u_14, (ref) v_u_15, (ref) v_u_9, (ref) v_u_13
		if not v_u_14[p_u_83] then
			local v_u_84 = p_u_83:GetAttribute("WallGUID")
			if v_u_84 then
				v_u_15[v_u_84] = p_u_83
				local v85 = v_u_9.new()
				local v_u_86 = {}
				v_u_14[p_u_83] = {
					["guid"] = v_u_84,
					["wall"] = p_u_83,
					["isDestroyed"] = false,
					["lastDestroyed"] = os.clock(),
					["lastPainted"] = os.clock(),
					["debris"] = v_u_86,
					["wallParent"] = p_u_83.Parent,
					["maid"] = v85
				}
				v85:GiveTask(p_u_83:GetAttributeChangedSignal("destroyed"):Connect(function()
					-- upvalues: (copy) p_u_83, (ref) v_u_14, (ref) v_u_13, (copy) v_u_84
					if p_u_83:GetAttribute("destroyed") then
						v_u_14[p_u_83].lastDestroyed = os.clock()
					else
						v_u_14[p_u_83].isDestroyed = false
						v_u_13._respawn(v_u_84)
					end
				end))
				v85:GiveTask(function()
					-- upvalues: (ref) v_u_13, (copy) v_u_86
					v_u_13._clearDebris(v_u_86)
				end)
			end
		end
	end
	if p82:IsA("Model") or p82:IsA("Folder") then
		for _, v88 in pairs(p82:GetDescendants()) do
			if v88:IsA("Model") and (p82:GetAttribute("isDestructible") or v88:GetAttribute("isDestructible")) then
				for _, v89 in pairs(v88:GetDescendants()) do
					if v89:IsA("BasePart") and (v89.Transparency == 0 or v89:GetAttribute("originalTransparency")) then
						v87(v89)
					end
				end
			elseif v88:IsA("BasePart") and (v88.Transparency == 0 or v88:GetAttribute("originalTransparency")) and p82:GetAttribute("isDestructible") then
				v87(v88)
			end
		end
	elseif p82:IsA("BasePart") and (p82:GetAttribute("isDestructible") and (p82.Transparency == 0 or p82:GetAttribute("originalTransparency"))) then
		v87(p82)
	end
end
function v_u_13._deregisterWalls(p90)
	-- upvalues: (copy) v_u_14, (copy) v_u_16, (copy) v_u_15
	if p90:IsA("Model") or p90:IsA("Folder") then
		for _, v91 in pairs(p90:GetDescendants()) do
			if v91:IsA("BasePart") and v_u_14[v91] then
				v_u_14[v91].maid:DoCleaning()
				local v92 = v_u_14[v91].guid or v91:GetAttribute("WallGUID")
				v_u_14[v91].wall = nil
				v_u_14[v91] = nil
				v_u_16[v92] = nil
				v_u_15[v92] = nil
			end
		end
	elseif p90:IsA("BasePart") and v_u_14[p90] then
		v_u_14[p90].maid:DoCleaning()
		local v93 = v_u_14[p90].guid or p90:GetAttribute("WallGUID")
		v_u_14[p90].wall = nil
		v_u_14[p90] = nil
		v_u_16[v93] = nil
		v_u_15[v93] = nil
	end
end
function v_u_13._cleanPaint()
	-- upvalues: (copy) v_u_16, (copy) v_u_13
	while true do
		local v94 = 0
		for v95, v96 in v_u_16 do
			v94 = v94 + 1
			if v94 % 5 == 0 then
				task.wait()
			end
			local v97 = v_u_13.GetWallByGUID(v95)
			if v97 then
				local v98 = v97.lastPainted
				if os.clock() - v98 >= 45 then
					v_u_13._unpaintWall(v96)
				end
			else
				v_u_16[v95] = nil
			end
		end
		task.wait(1)
	end
end
function v_u_13._debrisSpawner()
	-- upvalues: (copy) v_u_17, (copy) v_u_13, (copy) v_u_6, (ref) v_u_11, (ref) v_u_18, (ref) v_u_12, (copy) v_u_10, (copy) v_u_25
	if #v_u_17 > 0 then
		local v99 = 0
		while v99 < 1 do
			if #v_u_17 <= 0 then
				return
			end
			local v100 = table.remove(v_u_17)
			if v100 then
				local v101 = v_u_13.GetWall(v100)
				local v102
				if v101 then
					v102 = v101.impactPoint
				else
					v102 = v101
				end
				if v100:IsA("Part") and (v101 and (v101.isDestroyed and (v_u_6:GetAttribute("destruction") and (v_u_6:DistanceFromCharacter(v100.Position) <= v_u_11 and (math.random() >= 0.7 and (v100.Size.Magnitude <= 40 and v_u_18 <= v_u_12)))))) then
					local v_u_103 = v_u_10(v100, v102, "triangle")
					for _, v104 in pairs(v_u_103) do
						v101.debris[v104] = true
						v_u_18 = v_u_18 + 1
					end
					task.delay(6, function()
						-- upvalues: (copy) v_u_103
						for _, v105 in pairs(v_u_103) do
							if v105 and v105:IsDescendantOf(workspace) then
								v105.Anchored = true
							end
						end
					end)
					v99 = v99 + 1
				end
				v100.Transparency = 1
				v_u_25(v100, 1)
			end
		end
	end
end
function v_u_13.destructibleAdded(p106)
	-- upvalues: (copy) v_u_13
	if p106:IsA("BasePart") and p106:GetAttribute("destroyed") then
		p106.Transparency = 1
	end
	v_u_13._registerWalls(p106)
end
function v_u_13.destructibleRemoved(p107)
	-- upvalues: (copy) v_u_13
	v_u_13._deregisterWalls(p107)
end
function v_u_13.Initialize()
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2
	task.defer(v_u_13._registerAllWalls)
	task.defer(v_u_13._cleanPaint)
	v_u_8.LinkSignal("meltWalls", v_u_13._meltWalls)
	v_u_8.LinkSignal("burnWalls", v_u_13._burnWalls)
	v_u_8.LinkSignal("paintWalls", v_u_13._paintWalls)
	v_u_8.LinkSignal("destroyWalls", v_u_13._destroyWalls)
	v_u_5.Heartbeat:Connect(v_u_13._debrisSpawner)
	v_u_2:GetInstanceAddedSignal("isInitializedDestructible"):Connect(v_u_13.destructibleAdded)
	v_u_2:GetInstanceRemovedSignal("isInitializedDestructible"):Connect(v_u_13.destructibleRemoved)
end
return v_u_13