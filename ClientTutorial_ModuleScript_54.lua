-- ClientTutorial (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v_u_6 = require(v_u_2.devv).load
local v_u_7 = v_u_6("tutorialPulseEffect")
local v_u_8 = v_u_6("MoneyEffect")
local v_u_9 = v_u_6("getIsAlive")
local v_u_10 = v_u_6("GUILoader")
local v_u_11 = v_u_6("MapMenu")
local v_u_12 = v_u_6("v3sound")
v_u_6("globals")
local v_u_13 = v_u_6("Signal")
local v_u_14 = v_u_6("state")
local v_u_15 = v_u_6("Maid")
local v_u_16 = {}
local v_u_17 = workspace:WaitForChild("Tutorial")
local function v_u_28(p_u_18, p_u_19)
	-- upvalues: (copy) v_u_2, (copy) v_u_15, (copy) v_u_13, (copy) v_u_8, (copy) v_u_5
	local v_u_20 = v_u_2.Models.Entities.CashBundle.SmallCashBundle:Clone()
	for _, v21 in v_u_20:GetDescendants() do
		if v21:IsA("BasePart") then
			v21.CanCollide = true
			v21.CanTouch = true
			v21.CanQuery = true
			v21.Anchored = false
		end
	end
	v_u_20:PivotTo(p_u_18 * CFrame.new(0, 0, -0.5))
	v_u_20.Parent = workspace.Game.Entities.CashBundle
	local v22 = Instance.new("ClickDetector")
	v22.MaxActivationDistance = 12
	v22.Parent = v_u_20
	local v23 = v_u_2.Guis.BillboardGuis.CashBillboard:Clone()
	v23.MoneyLabel.Text = "$" .. p_u_19
	v23.Parent = v_u_20.PrimaryPart
	local v_u_24 = v_u_15.new()
	v_u_24:GiveTask(v_u_20)
	v_u_24:GiveTask(v22.MouseClick:Connect(function(p25)
		-- upvalues: (ref) v_u_5, (copy) v_u_20, (ref) v_u_13, (copy) p_u_19, (ref) v_u_8, (copy) v_u_24
		if p25 == v_u_5 then
			if v_u_20 then
				if not v_u_20.Parent then
					return
				end
				v_u_13.FireServer("collectTutorialCash", p_u_19)
				v_u_8(v_u_20.PrimaryPart.CFrame.Position, 1)
				v_u_24:DoCleaning()
			end
		end
	end))
	v_u_24:GiveTask(v_u_20.PrimaryPart.Touched:Connect(function(p26)
		-- upvalues: (ref) v_u_5, (copy) v_u_20, (ref) v_u_13, (copy) p_u_19, (ref) v_u_8, (copy) v_u_24
		if p26:IsDescendantOf(v_u_5.Character) then
			if v_u_20 then
				if not v_u_20.Parent then
					return
				end
				v_u_13.FireServer("collectTutorialCash", p_u_19)
				v_u_8(v_u_20.PrimaryPart.CFrame.Position, 1)
				v_u_24:DoCleaning()
			end
		end
	end))
	task.defer(function()
		-- upvalues: (copy) v_u_20, (copy) p_u_18
		local v27 = math.random(15, 20)
		v_u_20.PrimaryPart.AssemblyLinearVelocity = p_u_18.LookVector.Unit * v27
		v_u_20.PrimaryPart.AssemblyAngularVelocity = p_u_18.LookVector.Unit * v27
	end)
end
local function v_u_53(p29, p30, p_u_31)
	-- upvalues: (copy) v_u_2, (copy) v_u_17, (copy) v_u_15, (copy) v_u_4, (copy) v_u_3, (copy) v_u_12, (copy) v_u_16, (copy) v_u_28
	local v_u_32 = v_u_2.Models.Other.ATM:Clone()
	local v33 = v_u_32:GetExtentsSize().Y * 0.5 - 0.75
	v_u_32:PivotTo(p29 + Vector3.new(0, v33, 0))
	v_u_32:SetAttribute("health", 40)
	v_u_32:SetAttribute("isDestroyed", false)
	v_u_32.Parent = v_u_17
	for _, v34 in v_u_32:GetChildren() do
		if v34:IsA("BasePart") and v34.Color == Color3.fromRGB(91, 154, 76) then
			v34.Color = p30
		end
	end
	local v_u_35 = v_u_32:GetPivot()
	local v_u_36 = 0
	local v_u_37 = v_u_15.new()
	local function v_u_45()
		-- upvalues: (copy) v_u_32, (ref) v_u_3, (ref) v_u_12, (copy) v_u_37
		if v_u_32 then
			local v38 = v_u_32:FindFirstChild("Screen")
			local v39 = v_u_32:FindFirstChild("ThreeDTextObject")
			local v40 = v_u_32:FindFirstChild("Main")
			local v41
			if v40 then
				v41 = v40:FindFirstChild("Attachment")
			else
				v41 = v40
			end
			if v38 and (v39 and (v40 and v41)) then
				v_u_3:Create(v_u_32.Screen, TweenInfo.new(0.1), {
					["Color"] = Color3.new(1, 0, 0)
				}):Play()
				for _, v42 in v39:GetChildren() do
					v_u_3:Create(v42, TweenInfo.new(0.1), {
						["Color"] = math.random() > 0.5 and Color3.new(0, 0, 0) or Color3.fromRGB(27, 58, 18)
					}):Play()
				end
				local v43 = v_u_12.newSound("printer")
				v43:attachToPart(v_u_32.PrimaryPart)
				v43.playbackSpeed = 0.8
				v43.vol = 1.2
				v43:play()
				for _, v44 in v41:GetChildren() do
					if v44:IsA("ParticleEmitter") then
						v44.Enabled = true
					end
				end
				v41.Specks:Emit()
				task.delay(10, function()
					-- upvalues: (ref) v_u_37
					v_u_37:DoCleaning()
				end)
			end
		else
			return
		end
	end
	v_u_37:GiveTask(v_u_32:GetAttributeChangedSignal("health"):Connect(function()
		-- upvalues: (copy) v_u_32, (copy) v_u_45, (ref) v_u_16, (ref) v_u_28, (copy) v_u_35, (copy) p_u_31, (ref) v_u_36, (ref) v_u_4, (copy) v_u_37
		if not v_u_32:GetAttribute("isDestroyed") then
			local v46 = v_u_32:GetAttribute("health")
			if v46 <= 0 then
				v_u_32:SetAttribute("isDestroyed", true)
				v_u_45()
				local v47 = v_u_16
				local v48 = v_u_32
				table.insert(v47, v48)
				if v46 == 0 then
					v_u_28(v_u_35, p_u_31)
					return
				end
			else
				v_u_28(v_u_35, p_u_31)
				if os.clock() - v_u_36 > 0.4 then
					v_u_36 = os.clock()
					local v_u_49 = nil
					v_u_49 = v_u_4.Heartbeat:Connect(function()
						-- upvalues: (ref) v_u_32, (ref) v_u_49, (ref) v_u_36, (ref) v_u_35
						if not (v_u_32 and (v_u_32.PrimaryPart and v_u_32.PrimaryPart.Anchored)) then
							v_u_49:Disconnect()
						end
						if os.clock() - v_u_36 > 0.4 then
							v_u_49:Disconnect()
							v_u_32:PivotTo(v_u_35)
						else
							local v50 = 1 - (os.clock() - v_u_36) / 0.4
							local v51 = os.clock() * 10
							local v52 = math.sin(v51) * 0.35 * v50
							v_u_32:PivotTo(v_u_35 * CFrame.new(v52, 0, v52))
						end
					end)
					v_u_37:GiveTask(v_u_49)
				end
			end
		end
	end))
	v_u_37:GiveTask(v_u_32)
	return v_u_32
end
local v_u_54 = nil
local v_u_55 = false
local v_u_56 = false
local v_u_57 = false
local v_u_58 = false
local v_u_59 = false
local v_u_60 = false
local v_u_61 = nil
local v_u_62 = false
local v_u_63 = 0
local v_u_64 = nil
local v_u_65 = false
local v_u_66 = {
	"Glock",
	"M1911",
	"Mossberg",
	"Uzi",
	"AK-47",
	"AR-15"
}
function v1.WaypointReached(_, p67)
	-- upvalues: (ref) v_u_54, (ref) v_u_55, (ref) v_u_57
	if p67 == v_u_54 then
		v_u_55 = true
	elseif p67 == workspace.LandmarkNodes.Nodes.bank then
		v_u_57 = true
	end
end
function v1.BoughtGun()
	-- upvalues: (ref) v_u_55, (ref) v_u_56
	v_u_55 = true
	v_u_56 = true
end
function v1.ReachedLandmark(_)
	-- upvalues: (ref) v_u_58
	v_u_58 = true
end
local function v_u_68()
	-- upvalues: (ref) v_u_65, (copy) v_u_53, (copy) v_u_17
	if not v_u_65 then
		v_u_65 = true
		v_u_53(v_u_17.Spawns.BankATM1.CFrame, Color3.fromRGB(255, 163, 5), 100)
		v_u_53(v_u_17.Spawns.BankATM2.CFrame, Color3.fromRGB(255, 163, 5), 100)
	end
end
function v1.Skip()
	-- upvalues: (ref) v_u_61, (ref) v_u_64, (copy) v_u_68, (ref) v_u_62, (ref) v_u_63, (copy) v_u_5, (copy) v_u_11
	if v_u_61 then
		task.cancel(v_u_61)
		v_u_61 = nil
	end
	if v_u_64 then
		v_u_64()
		v_u_64 = nil
	end
	v_u_68()
	v_u_62 = true
	v_u_63 = os.clock()
	v_u_5:SetAttribute("isTutorial", nil)
	task.defer(function()
		-- upvalues: (ref) v_u_11
		v_u_11.Reset()
	end)
end
local function v_u_75(p69)
	-- upvalues: (ref) v_u_54
	local v70 = {}
	for _, v71 in workspace.ItemsOnSale:GetChildren() do
		if v71.Name == p69 then
			local v72 = {
				["part"] = v71.BillboardPos,
				["distance"] = (v71.BillboardPos.Position - v_u_54.Position).Magnitude
			}
			table.insert(v70, v72)
		end
	end
	table.sort(v70, function(p73, p74)
		return p73.distance < p74.distance
	end)
	if #v70 > 0 then
		return v70[1].part
	else
		return nil
	end
end
local function v_u_82()
	-- upvalues: (copy) v_u_5
	local v76 = v_u_5.Character
	if v76 then
		v76 = v76.PrimaryPart
	end
	if v76 then
		local v77 = {}
		for _, v78 in workspace.HousingPlots:GetChildren() do
			if v78.Sign.PrimaryPart and not v78:GetAttribute("owner") then
				local v79 = {
					["plot"] = v78,
					["distance"] = (v78.Sign.PrimaryPart.Position - v76.Position).Magnitude
				}
				table.insert(v77, v79)
			end
		end
		table.sort(v77, function(p80, p81)
			return p80.distance < p81.distance
		end)
		if #v77 > 0 then
			return v77[1].plot, v77[1].distance
		else
			return nil
		end
	else
		return nil
	end
end
local function v_u_89()
	-- upvalues: (copy) v_u_5, (copy) v_u_17
	local v83 = v_u_5.Character
	if v83 then
		v83 = v83.PrimaryPart
	end
	if not v83 then
		return nil
	end
	local v84 = {}
	for _, v85 in v_u_17.Spawns:GetChildren() do
		if v85.Name == "TutorialATM" then
			local v86 = {
				["part"] = v85,
				["distance"] = (v85.Position - v83.Position).Magnitude
			}
			table.insert(v84, v86)
		end
	end
	table.sort(v84, function(p87, p88)
		return p87.distance < p88.distance
	end)
	return { v84[1].part, v84[2].part }
end
local function v_u_96()
	-- upvalues: (copy) v_u_5
	local v90 = {}
	local v91 = v_u_5.Character
	if v91 then
		v91 = v91.PrimaryPart
	end
	if v91 then
		for _, v92 in workspace.LandmarkNodes.Nodes:GetChildren() do
			if string.find(v92.Name, "armory") then
				local v93 = {
					["part"] = v92,
					["distance"] = (v92.Position - v91.Position).Magnitude
				}
				table.insert(v90, v93)
			end
		end
		table.sort(v90, function(p94, p95)
			return p94.distance < p95.distance
		end)
	end
	if #v90 > 0 then
		return v90[1].part
	else
		return workspace.LandmarkNodes.Nodes.armory1
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (ref) v_u_61, (copy) v_u_89, (copy) v_u_53, (copy) v_u_11, (ref) v_u_60, (copy) v_u_16, (ref) v_u_54, (copy) v_u_96, (ref) v_u_55, (copy) v_u_6, (copy) v_u_66, (copy) v_u_75, (ref) v_u_56, (copy) v_u_10, (ref) v_u_64, (copy) v_u_7, (ref) v_u_62, (ref) v_u_63, (copy) v_u_9, (copy) v_u_14, (copy) v_u_82, (ref) v_u_59
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_13, (ref) v_u_61, (ref) v_u_89, (ref) v_u_53, (ref) v_u_11, (ref) v_u_60, (ref) v_u_16, (ref) v_u_54, (ref) v_u_96, (ref) v_u_55, (ref) v_u_6, (ref) v_u_66, (ref) v_u_75, (ref) v_u_56, (ref) v_u_10, (ref) v_u_64, (ref) v_u_7, (ref) v_u_62, (ref) v_u_63, (ref) v_u_9, (ref) v_u_14, (ref) v_u_82, (ref) v_u_59
		repeat
			task.wait(0.1)
		until v_u_5:GetAttribute("isLoaded")
		repeat
			task.wait(0.1)
		until v_u_5:GetAttribute("closedUpdateLog")
		workspace.LandmarkNodes:WaitForChild("Nodes")
		if v_u_13.InvokeServer("getTutorial") or v_u_5:GetAttribute("isFirstTime") then
			v_u_61 = task.spawn(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_13, (ref) v_u_89, (ref) v_u_53, (ref) v_u_11, (ref) v_u_60, (ref) v_u_16, (ref) v_u_54, (ref) v_u_96, (ref) v_u_55, (ref) v_u_6, (ref) v_u_66, (ref) v_u_75, (ref) v_u_56, (ref) v_u_10, (ref) v_u_64, (ref) v_u_7, (ref) v_u_62, (ref) v_u_63
				repeat
					task.wait(1)
				until v_u_5 and (v_u_5.Character and (v_u_5.Character:IsDescendantOf(workspace) and (v_u_5:GetAttribute("isLoaded") and v_u_5:GetAttribute("isSpawned"))))
				v_u_5:SetAttribute("isTutorial", true)
				v_u_13.FireServer("sendTutorialAnalytics", "TutorialStarted")
				local v97 = v_u_89()
				local v98 = v_u_53(v97[1].CFrame, Color3.fromRGB(91, 154, 76), 50)
				local v99 = v_u_53(v97[2].CFrame, Color3.fromRGB(91, 154, 76), 50)
				v_u_11.SetWaypoint("Equip your fists and punch the ATM", v98.PrimaryPart)
				v_u_60 = true
				repeat
					task.wait()
				until #v_u_16 == 1
				v_u_13.FireServer("sendTutorialAnalytics", "BrokeFirstATM")
				if v_u_16[1] == v98 then
					v98 = v99 or v98
				end
				v_u_11.SetWaypoint("Equip your fists and punch the ATM", v98.PrimaryPart)
				repeat
					task.wait(0.1)
				until #v_u_16 > 1
				v_u_13.FireServer("sendTutorialAnalytics", "BrokeSecondATM")
				v_u_60 = false
				v_u_54 = v_u_96()
				v_u_11.SetWaypoint("Walk to the Armory", v_u_54, 15)
				repeat
					task.wait()
				until v_u_55 == true
				v_u_13.FireServer("sendTutorialAnalytics", "NavigatedToArmory")
				local v100 = nil
				for _, v101 in v_u_6("v3item").inventory.items do
					if v101.type == "Gun" and table.find(v_u_66, v101.name) then
						v100 = v101.name
						break
					end
				end
				if v100 then
					local v102 = v_u_75(v100)
					if v102 then
						v_u_11.SetWaypoint("Buy Ammo for your " .. v100, v102)
					end
				else
					local v103 = v_u_75("Glock")
					if v103 then
						v_u_11.SetWaypoint("Buy a Glock", v103)
					end
				end
				repeat
					task.wait()
				until v_u_56 == true
				v_u_13.FireServer("sendTutorialAnalytics", "BoughtGun")
				local v104 = v_u_10.Get("ContextButtons")
				v_u_10.Get("Map")
				local v105 = v104.Frame.Map
				v_u_64 = v_u_7(v105.Tutorial)
				v_u_62 = true
				v_u_63 = os.clock()
				v_u_5:SetAttribute("isTutorial", nil)
				local v106 = v_u_5.Character
				if v106 then
					v106 = v106.PrimaryPart
				end
				if v106 and v106.Parent then
					v_u_11.SetWaypoint("Break ATMs, rob the bank, buy guns, PVP, and more in Ohio!", v106, nil, true)
					task.delay(8, function()
						-- upvalues: (ref) v_u_11
						v_u_11.ClearWaypoint()
					end)
				end
				v105.Button.Activated:Once(function()
					-- upvalues: (ref) v_u_64, (ref) v_u_13
					if v_u_64 then
						v_u_64()
						v_u_64 = nil
					end
					v_u_13.FireServer("sendTutorialAnalytics", "OpenedMap")
				end)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_55, (ref) v_u_16, (ref) v_u_56, (ref) v_u_54, (ref) v_u_96, (ref) v_u_5, (ref) v_u_11
				while task.wait(2) and not v_u_55 do
					if #v_u_16 > 1 and not (v_u_56 or v_u_55) then
						v_u_54 = v_u_96()
						v_u_5:SetAttribute("ignoreWaypoint", true)
						v_u_11.SetWaypoint("Walk to the Armory", v_u_54, 15)
						task.delay(0.5, function()
							-- upvalues: (ref) v_u_5
							v_u_5:SetAttribute("ignoreWaypoint", nil)
						end)
					end
				end
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_62, (ref) v_u_63, (ref) v_u_9, (ref) v_u_5, (ref) v_u_14, (ref) v_u_82, (ref) v_u_11, (ref) v_u_13, (ref) v_u_59
				while task.wait(10) do
					if v_u_62 and (os.clock() - v_u_63 >= 20 and v_u_9(v_u_5)) then
						local v107 = false
						for _, v108 in workspace.HousingPlots:GetChildren() do
							if v108:GetAttribute("owner") == v_u_5.UserId then
								v107 = true
								break
							end
						end
						if v107 then
							break
						end
						local v109 = v_u_14.data.money or 0
						local v110, v111 = v_u_82()
						if v109 >= 500 and (v110 and (v110.Sign.PrimaryPart and v111 < 250)) then
							v_u_11.SetWaypoint("You can afford a house! Walk to a house to rent one", v110.Sign.PrimaryPart, 15)
							v_u_13.FireServer("sendTutorialAnalytics", "WalkToHouse")
							local v112 = false
							while task.wait(1) do
								for _, v113 in workspace.HousingPlots:GetChildren() do
									if v113:GetAttribute("owner") == v_u_5.UserId then
										v_u_59 = true
										v_u_13.FireServer("sendTutorialAnalytics", "RentedHouse")
										v112 = true
										break
									end
								end
								if v110 and (v110:GetAttribute("owner") and v110:GetAttribute("owner") ~= v_u_5.UserId) then
									v110 = v_u_82()
									if not v110 or (not v110.Sign.PrimaryPart or v111 >= 250) then
										v_u_59 = false
										v112 = true
									end
									v_u_11.SetWaypoint("You can afford a house! Walk to a house to rent one", v110.Sign.PrimaryPart, 15)
								end
								if v112 then
									break
								end
							end
							if v112 then
								break
							end
						end
					end
				end
			end)
		end
	end)
end
return v1