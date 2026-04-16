-- ClientPlayerLoader (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("ProximityPromptService")
local v_u_3 = game:GetService("ContextActionService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("StarterGui")
local v_u_8 = game:GetService("GuiService")
local v_u_9 = game:GetService("Players").LocalPlayer
v_u_9:WaitForChild("PlayerGui")
local v_u_10 = require(v4.devv).load
local v_u_11 = v_u_10("HumanoidReadyUtil")
local v_u_12 = v_u_10("contextButtons")
local v_u_13 = v_u_10("confetiiiiiiiiiiiii")
local v_u_14 = v_u_10("ClientRagdoll")
local v_u_15 = v_u_10("specialRoles")
local v_u_16 = v_u_10("makeToast")
local v_u_17 = v_u_10("v3vehicle")
local v_u_18 = v_u_10("v3entity")
local v_u_19 = v_u_10("v3effect")
local v_u_20 = v_u_10("MapMenu")
local v_u_21 = v_u_10("v3sound")
local v_u_22 = v_u_10("hotbar")
local v_u_23 = v_u_10("v3prop")
local v_u_24 = v_u_10("Signal")
local v_u_25 = v_u_10("status")
local v_u_26 = v_u_10("v3sfx")
local v_u_27 = v_u_10("Maid")
v_u_1.IsPlayerReady = false
v_u_1.LocalPlayerDead = true
local function v_u_30(p28)
	-- upvalues: (copy) v_u_9
	if p28 ~= v_u_9 then
		for _, v29 in pairs(p28.Character:GetDescendants()) do
			if v29:IsA("BasePart") then
				v29.CastShadow = false
			end
		end
	end
end
local function v_u_31()
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	if not v_u_5.GamepadEnabled then
		v_u_8.AutoSelectGuiEnabled = false
	end
	v_u_5.GamepadConnected:Connect(function()
		-- upvalues: (ref) v_u_8
		v_u_8.AutoSelectGuiEnabled = true
	end)
	v_u_5.GamepadDisconnected:Connect(function()
		-- upvalues: (ref) v_u_8
		v_u_8.AutoSelectGuiEnabled = false
	end)
end
local function v_u_34()
	-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_24, (copy) v_u_5, (copy) v_u_7
	if (v_u_15.isDeveloper(v_u_9.UserId) ~= nil or v_u_15.isAdmin(v_u_9.UserId)) and v_u_24.InvokeServer("isPrivateServer") then
		local v_u_32 = false
		v_u_5.InputBegan:Connect(function(p33)
			-- upvalues: (ref) v_u_32, (ref) v_u_9, (ref) v_u_7
			if p33.KeyCode == Enum.KeyCode.G then
				v_u_32 = not v_u_32
				v_u_9:SetAttribute("backpackToggled", v_u_32)
				pcall(function()
					-- upvalues: (ref) v_u_7, (ref) v_u_32
					v_u_7:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, v_u_32)
				end)
			end
		end)
	end
end
local function v_u_37(p35, p36)
	if p35 and p35.Enabled ~= nil then
		p35.Enabled = p36
	end
end
local function v_u_39(p38)
	if p38 and p38:IsA("ProximityPrompt") then
		p38:InputHoldEnd()
	end
end
local function v_u_43(p40)
	-- upvalues: (copy) v_u_9, (copy) v_u_10
	local v41 = v_u_9.Character
	if v41 then
		v41 = v41:FindFirstChild("Humanoid")
	end
	if v41 then
		v41 = v41:FindFirstChild("Animator")
	end
	if v41 then
		local v42 = v_u_10("animLoader").Get(p40)
		if v42 then
			v41:LoadAnimation(v42):Play()
		end
	else
		return
	end
end
local function v_u_45(p44)
	if p44 then
		p44 = p44.Character
	end
	if p44 then
		p44 = p44:FindFirstChild("Humanoid")
	end
	if p44 then
		workspace.Camera.CameraSubject = p44
	end
end
local function v_u_51()
	-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_10, (copy) v_u_24
	if v_u_15.isHero(v_u_9.UserId) then
		local v46 = Instance.new("ScreenGui")
		v46.Name = "TableDebug"
		v46.ResetOnSpawn = false
		v46.Parent = v_u_9:WaitForChild("PlayerGui")
		local v_u_47 = v_u_10("TableInspector").new()
		v_u_47.backFrame.Parent = v46
		local v_u_48 = nil
		v_u_24.LinkSignal("viewTable", function(p49, p50)
			-- upvalues: (ref) v_u_48, (copy) v_u_47
			if v_u_48 then
				v_u_48:destroy()
				v_u_48 = nil
			end
			v_u_48 = v_u_47:addTable(p49 or "", p50)
		end)
	end
end
local function v_u_54(p52)
	-- upvalues: (copy) v_u_9
	local v53 = v_u_9.Character
	repeat
		task.wait()
	until v53 and v53.PrimaryPart or v_u_9.Character ~= v53
	if v_u_9.Character.PrimaryPart then
		v_u_9.Character.PrimaryPart.Anchored = p52
	end
end
local function v_u_69()
	-- upvalues: (copy) v_u_27, (copy) v_u_6, (copy) v_u_10, (copy) v_u_9, (copy) v_u_16, (copy) v_u_2
	local v_u_55 = v_u_27.new()
	local v_u_56 = v_u_27.new()
	local function v_u_59(p_u_57)
		-- upvalues: (copy) v_u_55, (ref) v_u_6, (ref) v_u_10, (ref) v_u_9
		v_u_55:GiveTask(v_u_6.Heartbeat:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_9, (copy) p_u_57
			local v58 = v_u_10("v3item").GetEquipped(v_u_9)
			if v58 and (v58.maxAmmo and (v58.projectileType == "bullet" or v58.projectileType == "rocket")) then
				p_u_57.ActionText = "Grab Mag"
			else
				p_u_57.ActionText = "Equip a gun"
			end
		end))
		v_u_55:GiveTask(p_u_57.PromptHidden:Connect(function()
			-- upvalues: (ref) v_u_55
			v_u_55:DoCleaning()
		end))
	end
	local function v_u_66(p_u_60)
		-- upvalues: (copy) v_u_56, (ref) v_u_6, (ref) v_u_10, (ref) v_u_9, (ref) v_u_16
		local v_u_61 = p_u_60.Parent.Name
		local v_u_62 = false
		v_u_56:GiveTask(v_u_6.Heartbeat:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_9, (ref) v_u_62, (copy) p_u_60, (copy) v_u_61
			local v63 = v_u_10("v3item").GetEquipped(v_u_9)
			if v63 and v63.name == "Lockpick" then
				v_u_62 = true
				p_u_60.ActionText = "Steal " .. v_u_61
				p_u_60.ObjectText = ""
			else
				p_u_60.ActionText = "Equip a Lockpick"
				p_u_60.ObjectText = v_u_61
				if v_u_62 then
					v_u_62 = false
					p_u_60.Enabled = false
					task.delay(0.05, function()
						-- upvalues: (ref) p_u_60
						p_u_60.Enabled = true
					end)
				end
			end
		end))
		v_u_56:GiveTask(p_u_60.PromptButtonHoldBegan:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_9, (ref) v_u_16
			local v64 = v_u_10("v3item").GetEquipped(v_u_9)
			if not v64 or v64.name ~= "Lockpick" then
				v_u_16("You need a lockpick to steal this vehicle!", "red", 3)
			end
		end))
		v_u_56:GiveTask(p_u_60.Triggered:Connect(function(p65)
			-- upvalues: (ref) v_u_9, (ref) v_u_10
			if p65 == v_u_9 then
				v_u_10("v3item").inventory.unequipAll(true)
			end
		end))
		v_u_56:GiveTask(p_u_60.PromptHidden:Connect(function()
			-- upvalues: (ref) v_u_56
			v_u_56:DoCleaning()
		end))
	end
	v_u_2.PromptShown:Connect(function(p67)
		-- upvalues: (ref) v_u_9, (copy) v_u_59, (copy) v_u_66
		local v68 = p67 and p67:IsA("ProximityPrompt")
		if v68 then
			v68 = p67:GetAttribute("whitelist")
		end
		if v68 and v68 ~= v_u_9.Name then
			p67.Enabled = false
			return
		elseif p67.Parent.Parent.Name == "Ammo Box" then
			v_u_59(p67)
		elseif p67.Parent:IsDescendantOf(workspace.Game.Entities.vehicles) then
			v_u_66(p67)
		end
	end)
end
function v_u_1.PlayerSpawned(p_u_70)
	-- upvalues: (copy) v_u_30, (copy) v_u_10
	if p_u_70 and p_u_70:IsDescendantOf(game) then
		v_u_30(p_u_70)
		task.defer(function()
			-- upvalues: (ref) v_u_10, (copy) p_u_70
			local v71 = v_u_10("v3item").movement
			task.wait()
			v71.bind(p_u_70)
		end)
	end
end
function v_u_1.PlayerDied(_) end
function v_u_1.LocalPlayerSpawned()
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_1, (copy) v_u_22, (copy) v_u_6, (copy) v_u_25, (copy) v_u_3, (copy) v_u_14, (copy) v_u_24
	if v_u_9 and v_u_9:IsDescendantOf(game) then
		v_u_10("v3item")
		v_u_12.Show()
		v_u_1.LocalPlayerDead = false
		v_u_22.SetVisible()
		v_u_9:SetAttribute("isMining", nil)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.CameraSubject = v_u_9.Character.Humanoid
		repeat
			v_u_6.Heartbeat:Wait()
		until v_u_9:GetAttribute("dataLoaded") == true and (v_u_9:GetAttribute("doneLoading") == true and (v_u_9.Character and (v_u_9.Character:FindFirstChild("HumanoidRootPart") and v_u_9.Character:IsDescendantOf(workspace))))
		v_u_25.ResetStatus()
		pcall(function()
			-- upvalues: (ref) v_u_3
			v_u_3:UnbindAction("LockSeat")
		end)
		task.spawn(v_u_14.SetRagdoll, v_u_9, false)
		task.defer(function()
			-- upvalues: (ref) v_u_24
			v_u_24.FireServer("spawned", true)
		end)
	end
end
function v_u_1.PrepareLocalCharacter()
	-- upvalues: (copy) v_u_6, (copy) v_u_9
	if workspace.StreamingEnabled then
		repeat
			v_u_6.Heartbeat:Wait()
		until v_u_9.Character and (v_u_9.Character.PrimaryPart and v_u_9.Character:IsDescendantOf(workspace))
		v_u_9.Character.PrimaryPart.Anchored = true
		repeat
			v_u_6.Heartbeat:Wait()
		until v_u_9:GetAttribute("isSpawned") == true
		if v_u_9.Character and v_u_9.Character.PrimaryPart then
			v_u_9.Character.PrimaryPart.Anchored = false
		end
	end
end
function v_u_1.LocalPlayerDied()
	-- upvalues: (copy) v_u_1, (copy) v_u_24, (copy) v_u_10, (copy) v_u_20, (copy) v_u_14, (copy) v_u_9, (copy) v_u_22
	v_u_1.LocalPlayerDead = true
	v_u_24.FireServer("spawned", false)
	local v72 = v_u_10("v3item").inventory
	v72.clearItems()
	v72.backpack.toggle(false)
	v_u_20.Close()
	task.spawn(v_u_14.SetRagdoll, v_u_9, true)
	v_u_22.SetVisible()
	v_u_10("ClientBike").Stop()
end
function v_u_1.HumanoidReadyFunc(p_u_73, _, p74)
	-- upvalues: (copy) v_u_9, (copy) v_u_1, (copy) v_u_27, (copy) v_u_10
	if p_u_73 == v_u_9 then
		task.spawn(v_u_1.LocalPlayerSpawned)
		task.spawn(v_u_1.PrepareLocalCharacter)
	end
	v_u_1.PlayerSpawned(p_u_73)
	local v_u_75 = v_u_27.new()
	v_u_75:GiveTask(function()
		-- upvalues: (ref) v_u_10, (copy) p_u_73
		v_u_10("v3item").movement.unbind(p_u_73)
	end)
	v_u_75:GiveTask(p74.Died:Connect(function()
		-- upvalues: (copy) v_u_75, (ref) v_u_1, (copy) p_u_73, (ref) v_u_9
		v_u_75:DoCleaning()
		v_u_1.PlayerDied(p_u_73)
		if p_u_73 == v_u_9 then
			v_u_1.LocalPlayerDied()
		end
	end))
	v_u_75:GiveTask(p74.AncestryChanged:Connect(function(_, p76)
		-- upvalues: (copy) v_u_75
		if not game:IsAncestorOf(p76) then
			v_u_75:DoCleaning()
		end
	end))
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_24, (copy) v_u_37, (copy) v_u_39, (copy) v_u_43, (copy) v_u_45, (copy) v_u_13, (copy) v_u_54, (copy) v_u_31, (copy) v_u_34, (copy) v_u_21, (copy) v_u_26, (copy) v_u_18, (copy) v_u_23, (copy) v_u_10, (copy) v_u_19, (copy) v_u_17, (copy) v_u_11, (copy) v_u_1, (copy) v_u_51, (copy) v_u_69, (copy) v_u_7
	v_u_24.LinkSignal("setObjectEnabled", v_u_37)
	v_u_24.LinkSignal("stopPromptHold", v_u_39)
	v_u_24.LinkSignal("playAnimation", v_u_43)
	v_u_24.LinkSignal("spectatePlayer", v_u_45)
	v_u_24.LinkSignal("makeConfetti", v_u_13)
	v_u_24.LinkSignal("setAnchored", v_u_54)
	task.defer(v_u_31)
	task.defer(v_u_34)
	v_u_21.cache(v_u_26.explosion.id)
	v_u_18.Initialize()
	v_u_23.Initialize()
	local v77 = v_u_10("v3item")
	v77.Initialize()
	v_u_19.Initialize()
	v_u_17.Initialize()
	v77.inventory:bindInput()
	v_u_11.registerHumanoidReady(v_u_1.HumanoidReadyFunc)
	v_u_51()
	v_u_69()
	task.spawn(function()
		-- upvalues: (ref) v_u_7
		repeat
			local v78 = pcall(function()
				-- upvalues: (ref) v_u_7
				return v_u_7:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
			end)
			task.wait(0.5)
		until v78
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_7
		repeat
			local v79 = pcall(function()
				-- upvalues: (ref) v_u_7
				return v_u_7:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
			end)
			task.wait(0.5)
		until v79
	end)
end
return v_u_1