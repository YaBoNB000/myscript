-- GrabHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v_u_1("HumanoidReadyUtil")
local v_u_3 = v_u_1("ClientReplicator")
local v_u_4 = v_u_1("TransparencyMask")
local v_u_5 = v_u_1("stopAnimations")
local v_u_6 = v_u_1("playAnimation")
local v_u_7 = v_u_1("CASPriorities")
local v_u_8 = v_u_1("InputHandler")
local v_u_9 = v_u_1("animLoader")
local v_u_10 = v_u_1("Scheduler")
local v_u_11 = v_u_1("makeToast")
local v_u_12 = v_u_1("v3sound")
local v13 = v_u_1("object")
local v_u_14 = v_u_1("Signal")
local v_u_15 = v_u_1("Maid")
local v_u_16 = game:GetService("Players")
local v_u_17 = v_u_16.LocalPlayer
local v_u_18 = game:GetService("ContextActionService")
local v19 = game:GetService("UserInputService")
local v_u_20 = game:GetService("RunService")
local v_u_21 = game:GetService("StarterGui")
local v_u_22 = v19.TouchEnabled
local v_u_23 = v13()
v_u_23.heldPlayer = nil
v_u_23.playerHoldingMe = nil
local v_u_24 = os.clock()
local v_u_25 = nil
local v_u_26 = {}
local v_u_27 = nil
function v_u_23.CheckValid(p28, p29, p30)
	-- upvalues: (copy) v_u_23, (copy) v_u_3
	local v31 = p28.Character
	local v32 = p29.Character
	local v33
	if v31 then
		v33 = v31:FindFirstChild("Humanoid")
	else
		v33 = v31
	end
	local v34
	if v32 then
		v34 = v32:FindFirstChild("Humanoid")
	else
		v34 = v32
	end
	local v35 = p28 and (p29 and (v31 and (v32 and (v33 and (v34 and v31.PrimaryPart)))))
	if v35 then
		v35 = v32.PrimaryPart
	end
	local v36 = v35 ~= nil
	local v37 = v_u_23.heldPlayer == nil and true or v_u_23.heldPlayer == p29
	local v38 = v_u_23.playerHoldingMe == nil and true or v_u_23.playerHoldingMe == p28
	local v39
	if v_u_3.Get(p29, "knocked") == true then
		v39 = v_u_3.Get(p28, "knocked") == false
	else
		v39 = false
	end
	local v40 = v_u_3.Get(p28, "crawl") == false
	local v41
	if p30 and (v_u_3.Get(p28, "carried") == false and v_u_3.Get(p29, "carried") == false) then
		v41 = true
	elseif v_u_3.Get(p28, "carried") == false then
		v41 = v_u_3.Get(p29, "carried") == true
	else
		v41 = false
	end
	if v33 then
		if v33.Health == 0 then
			v34 = false
		elseif v34 then
			v34 = v34.Health ~= 0
		end
	else
		v34 = v33
	end
	if v36 then
		if v37 then
			if v38 then
				if v39 then
					if v40 then
						if v41 then
							if v34 then
								v34 = (v31.PrimaryPart.Position - v32.PrimaryPart.Position).magnitude <= 30
							end
						else
							v34 = v41
						end
					else
						v34 = v40
					end
				else
					v34 = v39
				end
			else
				v34 = v38
			end
		else
			v34 = v37
		end
	else
		v34 = v36
	end
	return v34
end
function v_u_23.AttemptGrab(p42)
	-- upvalues: (copy) v_u_23, (copy) v_u_17, (copy) v_u_14
	if v_u_23.CheckValid(v_u_17, p42, true) then
		v_u_14.FireServer("grabPlayer", p42)
	end
end
function v_u_23.Handcuff(p43)
	-- upvalues: (copy) v_u_23, (copy) v_u_17, (copy) v_u_3, (copy) v_u_11, (copy) v_u_14
	if v_u_23.CheckValid(v_u_17, p43, true) or p43:GetAttribute("surrendering") then
		if v_u_3.Get(p43, "cuffed") then
			v_u_11(p43.DisplayName .. " is already handcuffed!", "red", 3)
		else
			v_u_14.FireServer("cuffPlayer", p43)
		end
	else
		return
	end
end
local function v_u_48(p44, p45)
	local v46 = p44.Character:FindFirstChild("Humanoid")
	for _, v47 in pairs(Enum.HumanoidStateType:GetEnumItems()) do
		if v47 ~= Enum.HumanoidStateType.Physics and (v47 ~= Enum.HumanoidStateType.Dead and (v47 ~= Enum.HumanoidStateType.None and (v47 ~= Enum.HumanoidStateType.RunningNoPhysics and v47 ~= Enum.HumanoidStateType.StrafingNoPhysics))) then
			v46:SetStateEnabled(v47, p45)
		end
	end
	v46:ChangeState(p45 and Enum.HumanoidStateType.GettingUp or Enum.HumanoidStateType.Physics)
end
local v_u_49 = Enum.ContextActionResult.Pass
local function v_u_53()
	-- upvalues: (copy) v_u_22, (copy) v_u_49, (copy) v_u_23, (copy) v_u_18, (copy) v_u_7, (copy) v_u_8
	if v_u_22 then
		v_u_8:BindActionAtPriority("drop", v_u_23.Drop, true, v_u_7.dropPlayer)
	else
		local v_u_50 = false
		v_u_18:BindActionAtPriority("dropPlayer", function(_, p51, p52)
			-- upvalues: (ref) v_u_50, (ref) v_u_49, (ref) v_u_23
			if p51 == Enum.UserInputState.Begin then
				v_u_50 = true
				return v_u_49
			end
			if p51 ~= Enum.UserInputState.End then
				return v_u_49
			end
			if p52.KeyCode ~= Enum.KeyCode.G and p52.KeyCode ~= Enum.KeyCode.DPadDown then
				return v_u_49
			end
			if v_u_50 then
				v_u_23.Drop()
			end
			return v_u_49
		end, false, v_u_7.dropPlayer, Enum.UserInputType.Keyboard, Enum.KeyCode.DPadDown)
	end
end
function v_u_23.Grab(p_u_54, p_u_55)
	-- upvalues: (ref) v_u_25, (copy) v_u_3, (ref) v_u_27, (copy) v_u_20, (copy) v_u_17, (copy) v_u_23, (copy) v_u_9, (copy) v_u_48, (ref) v_u_24, (copy) v_u_53, (copy) v_u_10
	if v_u_25 then
		return
	elseif p_u_54 and p_u_55 then
		v_u_3.Set(p_u_55, "carried", true)
		if v_u_27 then
			v_u_27:Disconnect()
			v_u_27 = nil
		end
		v_u_27 = v_u_20.Stepped:Connect(function()
			-- upvalues: (copy) p_u_55, (ref) v_u_27
			if p_u_55 and p_u_55.Character then
				for _, v56 in ipairs(p_u_55.Character:GetDescendants()) do
					if v56:IsA("BasePart") then
						v56.CanCollide = false
					end
				end
			else
				v_u_27:Disconnect()
				v_u_27 = nil
			end
		end)
		if p_u_55 == v_u_17 then
			v_u_3.Replicate("carried")
			v_u_23.playerHoldingMe = p_u_54
			local v57 = p_u_55.Character.Humanoid.Animator:LoadAnimation((v_u_9.Get("dangle")))
			v57.Looped = true
			v57.Priority = Enum.AnimationPriority.Action
			v57:AdjustSpeed(1)
			v57:Play()
			v_u_23.dangleAnimTrack = v57
		else
			if p_u_54 == v_u_17 then
				v_u_48(p_u_55, false)
			end
			v_u_24 = os.clock()
			v_u_23.heldPlayer = p_u_55
			v_u_53()
		end
		local function v58()
			-- upvalues: (ref) v_u_23, (copy) p_u_54, (copy) p_u_55
			if not v_u_23.CheckValid(p_u_54, p_u_55, false) then
				v_u_23.Drop()
			end
		end
		v_u_25 = v_u_10.Schedule(v58, 0, -1)
	end
end
function v_u_23.Drop()
	-- upvalues: (ref) v_u_24, (ref) v_u_25, (copy) v_u_23, (ref) v_u_27, (copy) v_u_3, (copy) v_u_17, (copy) v_u_48, (copy) v_u_18, (copy) v_u_22, (copy) v_u_8, (copy) v_u_14, (copy) v_u_4
	if os.clock() - v_u_24 > 2 then
		task.defer(function()
			-- upvalues: (ref) v_u_25
			if v_u_25 then
				v_u_25:cancel()
				v_u_25 = nil
			end
		end)
		if v_u_23.dangleAnimTrack then
			v_u_23.dangleAnimTrack:Stop()
			v_u_23.dangleAnimTrack = nil
		end
		if v_u_27 then
			v_u_27:Disconnect()
			v_u_27 = nil
		end
		if v_u_23.playerHoldingMe == nil or v_u_23.heldPlayer ~= nil then
			if v_u_23.playerHoldingMe == nil and v_u_23.heldPlayer ~= nil then
				v_u_18:UnbindAction("dropPlayer")
				if v_u_22 then
					v_u_8:UnbindAction("drop")
				end
				v_u_14.FireServer("dropPlayer", v_u_23.heldPlayer)
				v_u_4.SetMasked(v_u_23.heldPlayer, false)
			else
				v_u_18:UnbindAction("dropPlayer")
				if v_u_22 then
					v_u_8:UnbindAction("drop")
				end
				v_u_3.Set(v_u_17, "carried", false)
				v_u_3.Replicate("carried")
				v_u_14.FireServer("dropPlayer", v_u_23.heldPlayer)
				v_u_4.SetMasked(v_u_23.heldPlayer, false)
				v_u_48(v_u_17, true)
			end
		else
			v_u_3.Set(v_u_17, "stun", 2)
			v_u_3.Set(v_u_17, "carried", false)
			v_u_3.Replicate("carried")
			v_u_48(v_u_17, true)
		end
		v_u_23.heldPlayer = nil
		v_u_23.playerHoldingMe = nil
	end
end
local function v_u_66(p_u_59)
	-- upvalues: (copy) v_u_26, (copy) v_u_1, (copy) v_u_17, (copy) v_u_6, (copy) v_u_12, (copy) v_u_23
	local v60 = p_u_59.Character
	if v60 then
		local v61 = v60:FindFirstChild("grabPrompt")
		if v61 then
			v61:Destroy()
		end
		local v62 = Instance.new("ProximityPrompt")
		v62.Name = "grabPrompt"
		v62.ActionText = "Grab"
		v62.ClickablePrompt = false
		v62.Enabled = false
		v62.HoldDuration = 1
		v62.ObjectText = p_u_59.DisplayName
		v62.MaxActivationDistance = 8
		v62.KeyboardKeyCode = Enum.KeyCode.G
		v62.Exclusivity = Enum.ProximityPromptExclusivity.OnePerButton
		v62.Parent = v60
		v_u_26[p_u_59]:GiveTask(v62.PromptButtonHoldBegan:Connect(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_17, (ref) v_u_6, (ref) v_u_12, (copy) p_u_59
			local v63 = v_u_1("v3item").inventory.getEquippedItem()
			if v63 then
				v63 = v63.name == "Handcuffs"
			end
			if v63 and (v_u_17.Character and v_u_17.Character:FindFirstChild("RightHand")) then
				v_u_6("cuffPlayer", v_u_17.Character)
				local v64 = v_u_12.newSound("jingle")
				v64:attachToPart(p_u_59.Character.RightHand)
				v64:play()
			end
		end))
		v_u_26[p_u_59]:GiveTask(v62.Triggered:Connect(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_23, (copy) p_u_59
			local v65 = v_u_1("v3item").inventory.getEquippedItem()
			if v65 then
				v65 = v65.name == "Handcuffs"
			end
			if v65 then
				v_u_23.Handcuff(p_u_59)
			else
				v_u_23.AttemptGrab(p_u_59)
			end
		end))
		return v62
	end
end
local function v_u_80(p_u_67)
	-- upvalues: (copy) v_u_17, (copy) v_u_26, (copy) v_u_15, (copy) v_u_1, (copy) v_u_3, (copy) v_u_66
	if p_u_67 ~= v_u_17 then
		v_u_26[p_u_67] = v_u_15.new()
		local v_u_68 = {
			["knocked"] = true,
			["carried"] = false,
			["ragdolled"] = false
		}
		local function v_u_76()
			-- upvalues: (ref) v_u_1, (copy) v_u_68, (ref) v_u_3, (copy) p_u_67, (ref) v_u_17, (ref) v_u_66
			local v69 = true
			local v70 = v_u_1("v3item").inventory.getEquippedItem()
			if v70 then
				v70 = v70.name == "Handcuffs"
			end
			for v71, v72 in pairs(v_u_68) do
				if v_u_3.Get(p_u_67, v71) ~= v72 then
					v69 = false
					break
				end
			end
			for v73 in pairs(v_u_68) do
				if v_u_3.Get(v_u_17, v73) then
					v69 = false
					break
				end
			end
			local v74 = p_u_67:GetAttribute("surrendering") and v70 and true or v69
			local v75 = p_u_67
			if v75 then
				v75 = p_u_67.Character
			end
			if v75 then
				v75 = v75:FindFirstChild("grabPrompt")
			end
			if v75 then
				v75.Enabled = v74
			else
				v75 = v_u_66(p_u_67)
			end
			if v75 then
				v75.ActionText = "Grab"
				if v70 then
					v75.ActionText = "Handcuff"
				end
			end
		end
		for v77 in pairs(v_u_68) do
			v_u_3.AddUpdateFunc(p_u_67, v77, "setProximityPromptEnabled", v_u_76)
			v_u_3.AddUpdateFunc(v_u_17, v77, p_u_67.Name .. "_setProximityPromptEnabled", v_u_76)
		end
		v_u_26[p_u_67]:GiveTask(p_u_67:GetAttributeChangedSignal("surrendering"):Connect(v_u_76))
		local v78 = v_u_1("v3item")
		v_u_26[p_u_67]:GiveTask(v78.onItemEquipped:Connect(function(p79)
			-- upvalues: (ref) v_u_17, (copy) v_u_76
			if p79 == v_u_17 then
				v_u_76()
			end
		end))
	end
end
local function v_u_82(p81)
	-- upvalues: (copy) v_u_23, (copy) v_u_26
	if p81 == v_u_23.playerHoldingMe then
		v_u_23.playerHoldingMe = nil
		v_u_23.Drop()
	end
	if v_u_26[p81] then
		v_u_26[p81]:DoCleaning()
		v_u_26[p81] = nil
	end
end
function v_u_23.Initialize()
	-- upvalues: (copy) v_u_16, (copy) v_u_80, (copy) v_u_82, (copy) v_u_14, (copy) v_u_23, (copy) v_u_2, (copy) v_u_4, (copy) v_u_17, (copy) v_u_3, (copy) v_u_66, (copy) v_u_26, (copy) v_u_21, (copy) v_u_5, (copy) v_u_6
	v_u_16.PlayerAdded:Connect(v_u_80)
	for _, v83 in pairs(v_u_16:GetPlayers()) do
		v_u_80(v83)
	end
	v_u_16.PlayerRemoving:Connect(v_u_82)
	v_u_14.LinkSignal("grabPlayer", v_u_23.Grab)
	v_u_14.LinkSignal("dropPlayer", v_u_23.Drop)
	v_u_2.registerHumanoidReady(function(p_u_84, _, p_u_85)
		-- upvalues: (ref) v_u_4, (ref) v_u_17, (ref) v_u_3, (ref) v_u_66, (ref) v_u_26, (ref) v_u_23
		task.defer(function()
			-- upvalues: (ref) v_u_4, (copy) p_u_84
			v_u_4.SetMasked(p_u_84, false)
		end)
		if p_u_84 == v_u_17 then
			v_u_3.Set(v_u_17, "carried", false)
			v_u_3.Replicate("carried")
		else
			task.defer(function()
				-- upvalues: (ref) v_u_66, (copy) p_u_84, (copy) p_u_85, (ref) v_u_26, (ref) v_u_23
				local v_u_86 = v_u_66(p_u_84)
				local v_u_87 = nil
				v_u_87 = p_u_85.Died:Connect(function()
					-- upvalues: (ref) v_u_26, (ref) p_u_84, (ref) v_u_87, (copy) v_u_86, (ref) v_u_23
					if v_u_26[p_u_84] then
						v_u_26[p_u_84]:DoCleaning()
					end
					v_u_87:Disconnect()
					if v_u_86 and v_u_86.Parent then
						v_u_86.Enabled = false
						v_u_86:Destroy()
					end
					local v88 = p_u_84.Character
					if v88 then
						v88 = v88:FindFirstChild("grabPrompt")
					end
					if v88 then
						v88:Destroy()
					end
					if v_u_23.DropPlayer then
						v_u_23.DropPlayer()
					end
				end)
			end)
		end
	end)
	v_u_17:GetAttributeChangedSignal("grabbedBy"):Connect(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_21
		local v_u_89 = v_u_17:GetAttribute("grabbedBy") ~= nil
		pcall(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_89
			v_u_21:SetCore("ResetButtonCallback", not v_u_89)
		end)
	end)
	v_u_17:GetAttributeChangedSignal("struggling"):Connect(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_5, (ref) v_u_6
		local v90 = v_u_17.Character
		if v90 then
			v_u_5(v90, "struggle")
			if v_u_17:GetAttribute("struggling") then
				v_u_6("struggle", v90)
			end
		end
	end)
	local function v93()
		-- upvalues: (ref) v_u_17, (ref) v_u_3
		local v91 = v_u_17.Character
		if v91 then
			local v92 = v91:FindFirstChild("uncuffPrompt")
			if v92 then
				if v_u_3.Get(v_u_17, "cuffed") and not (v_u_3.Get(v_u_17, "knocked") or (v_u_3.Get(v_u_17, "carried") or v_u_3.Get(v_u_17, "ragdolled"))) then
					v92.Enabled = true
				else
					v92.Enabled = false
				end
			else
				return
			end
		else
			return
		end
	end
	v_u_3.AddUpdateFunc(v_u_17, "cuffed", "cuffPromptChanged", v93)
	v_u_3.AddUpdateFunc(v_u_17, "knocked", "knockedPromptChanged", v93)
	v_u_3.AddUpdateFunc(v_u_17, "carried", "carriedPromptChanged", v93)
	v_u_3.AddUpdateFunc(v_u_17, "ragdolled", "ragdolledPromptChanged", v93)
end
return v_u_23