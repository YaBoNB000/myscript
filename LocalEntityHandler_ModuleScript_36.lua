-- LocalEntityHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("CollectionService")
game:GetService("RunService")
game:GetService("Chat")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v2.devv).load
local v_u_6 = v_u_5("GuiLoader")
local v_u_7 = v_u_5("Maid")
local function v_u_13(p8, p9)
	if not (p8 and (p8.Character and p8.Character.PrimaryPart)) then
		return false
	end
	local v10 = p8.Character.PrimaryPart
	local v11 = workspace:GetPartsInPart(p9)
	for _, v12 in ipairs(v11) do
		if v10 == v12 then
			return true
		end
	end
	return false
end
function v_u_1._startDoorCheck()
	-- upvalues: (copy) v_u_4, (copy) v_u_13
	local v14 = workspace:WaitForChild("Game"):WaitForChild("Props"):WaitForChild("Door")
	while task.wait(0.25) do
		local v15 = v_u_4.Character
		if v15 then
			v15 = v15:FindFirstChild("HumanoidRootPart")
		end
		if v15 then
			local v16 = OverlapParams.new()
			v16.FilterType = Enum.RaycastFilterType.Whitelist
			v16.FilterDescendantsInstances = { v14 }
			local v17 = workspace:GetPartBoundsInRadius(v15.Position, 10)
			for _, v18 in ipairs(v17) do
				local v19
				if v18 and (v18.Name == "Door" and (v18.Parent and (v18.Parent.Parent and v18.Parent.Parent:FindFirstChild("Base")))) then
					v19 = v18.Parent.Parent
				else
					v19 = nil
				end
				if v19 then
					local v20 = v19:FindFirstChild("InsideCheck")
					local v21 = v19:FindFirstChild("Lock", true)
					if v21 then
						local v22 = v21:FindFirstChildOfClass("ProximityPrompt")
						local v23 = v19:GetAttribute("isOpen")
						if v20 and v22 then
							local v24 = v_u_13(v_u_4, v20)
							if v24 then
								v24 = not v23
							end
							v22.Enabled = v24
						end
					end
				end
			end
		end
	end
end
function v_u_1._setupWorkbenches()
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
	local v_u_25 = {}
	local function v37(p_u_26)
		-- upvalues: (ref) v_u_7, (ref) v_u_4, (copy) v_u_25, (ref) v_u_6, (ref) v_u_5
		local v27 = Instance.new("ProximityPrompt")
		v27.ObjectText = "Workbench"
		v27.ActionText = "Use"
		v27.HoldDuration = 0.5
		v27.RequiresLineOfSight = false
		v27.Parent = p_u_26
		local v_u_28 = v_u_7.new()
		v_u_28:GiveTask(v27.Triggered:Connect(function(p29)
			-- upvalues: (ref) v_u_4, (ref) v_u_25, (ref) v_u_6, (copy) v_u_28, (ref) v_u_5, (copy) p_u_26
			if p29 == v_u_4 then
				for _, v30 in pairs(v_u_25) do
					local v31 = v30.prompt
					if v31 then
						v31.Enabled = false
					end
				end
				local v_u_32 = nil
				local v_u_33 = v_u_6.Get("CraftingBenchMenu")
				v_u_32 = v_u_33:GetPropertyChangedSignal("Enabled"):Connect(function()
					-- upvalues: (copy) v_u_33, (ref) v_u_25, (ref) v_u_32
					if not v_u_33.Enabled then
						for _, v34 in pairs(v_u_25) do
							local v35 = v34.prompt
							if v35 then
								v35.Enabled = true
							end
						end
						v_u_32:Disconnect()
						v_u_32 = nil
					end
				end)
				v_u_28:GiveTask(v_u_32)
				local v_u_36 = v_u_5("CraftingMenu")
				v_u_36:Toggle(true)
				task.spawn(function()
					-- upvalues: (copy) v_u_33, (ref) p_u_26, (ref) v_u_4, (copy) v_u_36
					repeat
						task.wait(0.1)
					until not v_u_33.Enabled or (not p_u_26 or (not p_u_26.PrimaryPart or v_u_4:DistanceFromCharacter(p_u_26.PrimaryPart.Position) > 25))
					v_u_36:Toggle(false)
				end)
			end
		end))
		v_u_25[p_u_26] = {
			["prompt"] = v27,
			["maid"] = v_u_28
		}
	end
	v_u_3:GetInstanceAddedSignal("workbench"):Connect(v37)
	v_u_3:GetInstanceRemovedSignal("workbench"):Connect(function(p38)
		-- upvalues: (copy) v_u_25
		local v39 = v_u_25[p38]
		if v39 then
			v39.maid:DoCleaning()
			v39.prompt = nil
		end
		v_u_25[p38] = nil
	end)
	for _, v40 in v_u_3:GetTagged("workbench") do
		v37(v40)
	end
end
function v_u_1._setupLockers()
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
	local v_u_41 = {}
	local function v53(p_u_42)
		-- upvalues: (ref) v_u_7, (ref) v_u_4, (copy) v_u_41, (ref) v_u_6, (ref) v_u_5
		local v43 = Instance.new("ProximityPrompt")
		v43.ObjectText = "Locker"
		v43.ActionText = "Open"
		v43.HoldDuration = 0.5
		v43.RequiresLineOfSight = true
		v43.Parent = p_u_42
		local v_u_44 = v_u_7.new()
		v_u_44:GiveTask(v43.Triggered:Connect(function(p45)
			-- upvalues: (ref) v_u_4, (ref) v_u_41, (ref) v_u_6, (copy) v_u_44, (ref) v_u_5, (copy) p_u_42
			if p45 == v_u_4 then
				for _, v46 in pairs(v_u_41) do
					local v47 = v46.prompt
					if v47 then
						v47.Enabled = false
					end
				end
				local v_u_48 = nil
				local v_u_49 = v_u_6.Get("Backpack")
				v_u_48 = v_u_49:GetPropertyChangedSignal("Enabled"):Connect(function()
					-- upvalues: (copy) v_u_49, (ref) v_u_41, (ref) v_u_48
					if not v_u_49.Enabled then
						for _, v50 in pairs(v_u_41) do
							local v51 = v50.prompt
							if v51 then
								v51.Enabled = true
							end
						end
						v_u_48:Disconnect()
						v_u_48 = nil
					end
				end)
				v_u_44:GiveTask(v_u_48)
				local v_u_52 = v_u_5("v3item")
				v_u_52.inventory.locker.toggle(true)
				v_u_52.inventory.backpack.toggle(true)
				task.spawn(function()
					-- upvalues: (copy) v_u_49, (ref) p_u_42, (ref) v_u_4, (copy) v_u_52
					repeat
						task.wait(0.1)
					until not v_u_49.Enabled or (not p_u_42 or (not p_u_42.PrimaryPart or v_u_4:DistanceFromCharacter(p_u_42.PrimaryPart.Position) > 25))
					v_u_52.inventory.locker.toggle(false)
					v_u_52.inventory.backpack.toggle(false)
				end)
			end
		end))
		v_u_41[p_u_42] = {
			["prompt"] = v43,
			["maid"] = v_u_44
		}
	end
	v_u_3:GetInstanceAddedSignal("locker"):Connect(v53)
	v_u_3:GetInstanceRemovedSignal("locker"):Connect(function(p54)
		-- upvalues: (copy) v_u_41
		local v55 = v_u_41[p54]
		if v55 then
			v55.maid:DoCleaning()
			v55.prompt = nil
		end
		v_u_41[p54] = nil
	end)
	for _, v56 in v_u_3:GetTagged("locker") do
		v53(v56)
	end
end
function v_u_1._bindLeaderboards()
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local function v59(p57)
		-- upvalues: (ref) v_u_4
		task.wait(0.1)
		local v58 = p57.Parent
		if v58 and (v58.Parent and v58:IsA("BasePart")) then
			p57.ResetOnSpawn = false
			p57.Parent = v_u_4:WaitForChild("PlayerGui")
			p57.Adornee = v58
		end
	end
	v_u_3:GetInstanceAddedSignal("LeaderboardGui"):Connect(v59)
	for _, v60 in v_u_3:GetTagged("LeaderboardGui") do
		task.wait(0.1)
		local v61 = v60.Parent
		if v61 and (v61.Parent and v61:IsA("BasePart")) then
			v60.ResetOnSpawn = false
			v60.Parent = v_u_4:WaitForChild("PlayerGui")
			v60.Adornee = v61
		end
	end
end
function v_u_1._bindRandomListeners()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	v_u_3:GetInstanceAddedSignal("ProximityPrompt"):Connect(function(p62)
		-- upvalues: (ref) v_u_4
		task.wait()
		local v63 = p62:GetAttribute("ignore")
		if v63 and v63 == v_u_4.Name then
			p62:Destroy()
		end
	end)
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_1
	task.defer(v_u_1._startDoorCheck)
	task.defer(v_u_1._setupLockers)
	task.defer(v_u_1._setupWorkbenches)
	task.defer(v_u_1._bindRandomListeners)
	task.spawn(v_u_1._bindLeaderboards)
end
return v_u_1