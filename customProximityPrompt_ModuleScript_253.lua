-- customProximityPrompt (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ProximityPromptService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("TextService")
local v_u_5 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v_u_6 = {
	[Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png",
	[Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png",
	[Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png",
	[Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png",
	[Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png",
	[Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png",
	[Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png",
	[Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png",
	[Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxmenu.png",
	[Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLS.png",
	[Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRS.png"
}
local v_u_7 = {
	[Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png",
	[Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png",
	[Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
}
local v_u_8 = {
	["\'"] = "rbxasset://textures/ui/Controls/apostrophe.png",
	[","] = "rbxasset://textures/ui/Controls/comma.png",
	["`"] = "rbxasset://textures/ui/Controls/graveaccent.png",
	["."] = "rbxasset://textures/ui/Controls/period.png",
	[" "] = "rbxasset://textures/ui/Controls/spacebar.png"
}
local v_u_9 = {
	[Enum.KeyCode.LeftControl] = "Ctrl",
	[Enum.KeyCode.RightControl] = "Ctrl",
	[Enum.KeyCode.LeftAlt] = "Alt",
	[Enum.KeyCode.RightAlt] = "Alt",
	[Enum.KeyCode.F1] = "F1",
	[Enum.KeyCode.F2] = "F2",
	[Enum.KeyCode.F3] = "F3",
	[Enum.KeyCode.F4] = "F4",
	[Enum.KeyCode.F5] = "F5",
	[Enum.KeyCode.F6] = "F6",
	[Enum.KeyCode.F7] = "F7",
	[Enum.KeyCode.F8] = "F8",
	[Enum.KeyCode.F9] = "F9",
	[Enum.KeyCode.F10] = "F10",
	[Enum.KeyCode.F11] = "F11",
	[Enum.KeyCode.F12] = "F12"
}
local function v_u_15(p10, p11)
	local v12 = Instance.new("Frame")
	v12.Size = UDim2.fromScale(0.5, 1)
	v12.Position = UDim2.fromScale(p11 and 0 or 0.5, 0)
	v12.BackgroundTransparency = 1
	v12.ClipsDescendants = true
	v12.Parent = p10
	local v13 = Instance.new("ImageLabel")
	v13.BackgroundTransparency = 1
	v13.Size = UDim2.fromScale(2, 1)
	v13.Position = UDim2.fromScale(p11 and 0 or -1, 0)
	v13.Image = "rbxasset://textures/ui/Controls/RadialFill.png"
	v13.Parent = v12
	local v14 = Instance.new("UIGradient")
	v14.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.4999, 0),
		NumberSequenceKeypoint.new(0.5, 1),
		NumberSequenceKeypoint.new(1, 1)
	})
	v14.Rotation = p11 and 180 or 0
	v14.Parent = v13
	return v14
end
local function v_u_23()
	-- upvalues: (copy) v_u_15
	local v16 = Instance.new("Frame")
	v16.Name = "CircularProgressBar"
	v16.Size = UDim2.fromOffset(58, 58)
	v16.AnchorPoint = Vector2.new(0.5, 0.5)
	v16.Position = UDim2.fromScale(0.5, 0.5)
	v16.BackgroundTransparency = 1
	local v_u_17 = v_u_15(v16, true)
	local v_u_18 = v_u_15(v16, false)
	local v19 = Instance.new("NumberValue")
	v19.Name = "Progress"
	v19.Parent = v16
	v19.Changed:Connect(function(p20)
		-- upvalues: (copy) v_u_17, (copy) v_u_18
		local v21 = p20 * 360
		local v22 = math.clamp(v21, 0, 360)
		v_u_17.Rotation = math.clamp(v22, 180, 360)
		v_u_18.Rotation = math.clamp(v22, 0, 180)
	end)
	return v16
end
local function v_u_113(p_u_24, p25, p26)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_1, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_23, (copy) v_u_4
	local v_u_27 = {}
	local v_u_28 = {}
	local v_u_29 = {}
	local v_u_30 = {}
	local v31 = TweenInfo.new(p_u_24.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local v32 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v33 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v34 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local v_u_35 = Instance.new("BillboardGui")
	v_u_35.Name = "Prompt"
	v_u_35.AlwaysOnTop = true
	local v36 = Instance.new("Frame")
	v36.Size = UDim2.fromScale(0.5, 1)
	v36.BackgroundTransparency = 1
	v36.BackgroundColor3 = Color3.new(0.07, 0.07, 0.07)
	v36.Parent = v_u_35
	Instance.new("UICorner").Parent = v36
	local v37 = Instance.new("Frame")
	v37.Name = "InputFrame"
	v37.Size = UDim2.fromScale(1, 1)
	v37.BackgroundTransparency = 1
	v37.SizeConstraint = Enum.SizeConstraint.RelativeYY
	v37.Parent = v36
	local v38 = Instance.new("Frame")
	v38.Size = UDim2.fromScale(1, 1)
	v38.Position = UDim2.fromScale(0.5, 0.5)
	v38.AnchorPoint = Vector2.new(0.5, 0.5)
	v38.BackgroundTransparency = 1
	v38.Parent = v37
	local v39 = Instance.new("UIScale")
	v39.Parent = v38
	local v40 = p25 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33
	local v41 = v_u_3
	table.insert(v_u_27, v41:Create(v39, v33, {
		["Scale"] = v40
	}))
	local v42 = v_u_3
	table.insert(v_u_28, v42:Create(v39, v33, {
		["Scale"] = 1
	}))
	local v_u_43 = Instance.new("TextLabel")
	v_u_43.Name = "ActionText"
	v_u_43.Size = UDim2.fromScale(1, 1)
	v_u_43.Font = Enum.Font.GothamSemibold
	v_u_43.TextSize = 19
	v_u_43.BackgroundTransparency = 1
	v_u_43.TextTransparency = 1
	v_u_43.TextColor3 = Color3.new(1, 1, 1)
	v_u_43.TextXAlignment = Enum.TextXAlignment.Left
	v_u_43.Parent = v36
	local v44 = v_u_3
	table.insert(v_u_27, v44:Create(v_u_43, v33, {
		["TextTransparency"] = 1
	}))
	local v45 = v_u_3
	table.insert(v_u_28, v45:Create(v_u_43, v33, {
		["TextTransparency"] = 0
	}))
	local v46 = v_u_3
	table.insert(v_u_29, v46:Create(v_u_43, v33, {
		["TextTransparency"] = 1
	}))
	local v47 = v_u_3
	table.insert(v_u_30, v47:Create(v_u_43, v33, {
		["TextTransparency"] = 0
	}))
	local v_u_48 = Instance.new("TextLabel")
	v_u_48.Name = "ObjectText"
	v_u_48.Size = UDim2.fromScale(1, 1)
	v_u_48.Font = Enum.Font.GothamSemibold
	v_u_48.TextSize = 14
	v_u_48.BackgroundTransparency = 1
	v_u_48.TextTransparency = 1
	v_u_48.TextColor3 = Color3.new(0.7, 0.7, 0.7)
	v_u_48.TextXAlignment = Enum.TextXAlignment.Left
	v_u_48.Parent = v36
	local v49 = v_u_3
	table.insert(v_u_27, v49:Create(v_u_48, v33, {
		["TextTransparency"] = 1
	}))
	local v50 = v_u_3
	table.insert(v_u_28, v50:Create(v_u_48, v33, {
		["TextTransparency"] = 0
	}))
	local v51 = v_u_3
	table.insert(v_u_29, v51:Create(v_u_48, v33, {
		["TextTransparency"] = 1
	}))
	local v52 = v_u_3
	table.insert(v_u_30, v52:Create(v_u_48, v33, {
		["TextTransparency"] = 0
	}))
	local v53 = v_u_3
	local v54 = {
		["Size"] = UDim2.fromScale(0.5, 1),
		["BackgroundTransparency"] = 1
	}
	table.insert(v_u_27, v53:Create(v36, v33, v54))
	local v55 = v_u_3
	local v56 = {
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundTransparency"] = 0.2
	}
	table.insert(v_u_28, v55:Create(v36, v33, v56))
	local v57 = v_u_3
	local v58 = {
		["Size"] = UDim2.fromScale(0.5, 1),
		["BackgroundTransparency"] = 1
	}
	table.insert(v_u_29, v57:Create(v36, v33, v58))
	local v59 = v_u_3
	local v60 = {
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundTransparency"] = 0.2
	}
	table.insert(v_u_30, v59:Create(v36, v33, v60))
	local v61 = Instance.new("Frame")
	v61.Name = "RoundFrame"
	v61.Size = UDim2.fromOffset(48, 48)
	v61.AnchorPoint = Vector2.new(0.5, 0.5)
	v61.Position = UDim2.fromScale(0.5, 0.5)
	v61.BackgroundTransparency = 1
	v61.Parent = v38
	local v62 = Instance.new("UICorner")
	v62.CornerRadius = UDim.new(0.5, 0)
	v62.Parent = v61
	local v63 = v_u_3
	table.insert(v_u_29, v63:Create(v61, v34, {
		["BackgroundTransparency"] = 1
	}))
	local v64 = v_u_3
	table.insert(v_u_30, v64:Create(v61, v34, {
		["BackgroundTransparency"] = 0.5
	}))
	if p25 == Enum.ProximityPromptInputType.Gamepad then
		if v_u_6[p_u_24.GamepadKeyCode] then
			local v65 = Instance.new("ImageLabel")
			v65.Name = "ButtonImage"
			v65.AnchorPoint = Vector2.new(0.5, 0.5)
			v65.Size = UDim2.fromOffset(24, 24)
			v65.Position = UDim2.fromScale(0.5, 0.5)
			v65.BackgroundTransparency = 1
			v65.ImageTransparency = 1
			v65.Image = v_u_6[p_u_24.GamepadKeyCode]
			v65.Parent = v38
			local v66 = v_u_3
			table.insert(v_u_29, v66:Create(v65, v34, {
				["ImageTransparency"] = 1
			}))
			local v67 = v_u_3
			table.insert(v_u_30, v67:Create(v65, v34, {
				["ImageTransparency"] = 0
			}))
		end
	elseif p25 == Enum.ProximityPromptInputType.Touch then
		local v68 = Instance.new("ImageLabel")
		v68.Name = "ButtonImage"
		v68.BackgroundTransparency = 1
		v68.ImageTransparency = 1
		v68.Size = UDim2.fromOffset(25, 31)
		v68.AnchorPoint = Vector2.new(0.5, 0.5)
		v68.Position = UDim2.fromScale(0.5, 0.5)
		v68.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png"
		v68.Parent = v38
		local v69 = v_u_3
		table.insert(v_u_29, v69:Create(v68, v34, {
			["ImageTransparency"] = 1
		}))
		local v70 = v_u_3
		table.insert(v_u_30, v70:Create(v68, v34, {
			["ImageTransparency"] = 0
		}))
	else
		local v71 = Instance.new("ImageLabel")
		v71.Name = "ButtonImage"
		v71.BackgroundTransparency = 1
		v71.ImageTransparency = 1
		v71.Size = UDim2.fromOffset(28, 30)
		v71.AnchorPoint = Vector2.new(0.5, 0.5)
		v71.Position = UDim2.fromScale(0.5, 0.5)
		v71.Image = "rbxasset://textures/ui/Controls/key_single.png"
		v71.Parent = v38
		local v72 = v_u_3
		table.insert(v_u_29, v72:Create(v71, v34, {
			["ImageTransparency"] = 1
		}))
		local v73 = v_u_3
		table.insert(v_u_30, v73:Create(v71, v34, {
			["ImageTransparency"] = 0
		}))
		local v74 = v_u_1:GetStringForKeyCode(p_u_24.KeyboardKeyCode)
		local v75 = v_u_7[p_u_24.KeyboardKeyCode]
		if v75 == nil then
			v75 = v_u_8[v74]
		end
		if v75 == nil then
			v74 = v_u_9[p_u_24.KeyboardKeyCode] or v74
		end
		if v75 then
			local v76 = Instance.new("ImageLabel")
			v76.Name = "ButtonImage"
			v76.AnchorPoint = Vector2.new(0.5, 0.5)
			v76.Size = UDim2.fromOffset(36, 36)
			v76.Position = UDim2.fromScale(0.5, 0.5)
			v76.BackgroundTransparency = 1
			v76.ImageTransparency = 1
			v76.Image = v75
			v76.Parent = v38
			local v77 = v_u_3
			table.insert(v_u_29, v77:Create(v76, v34, {
				["ImageTransparency"] = 1
			}))
			local v78 = v_u_3
			table.insert(v_u_30, v78:Create(v76, v34, {
				["ImageTransparency"] = 0
			}))
		elseif v74 == nil or v74 == "" then
			local v79 = error
			local v80 = p_u_24.Name
			local v81 = p_u_24.KeyboardKeyCode
			v79("ProximityPrompt \'" .. v80 .. "\' has an unsupported keycode for rendering UI: " .. tostring(v81))
		else
			local v82 = Instance.new("TextLabel")
			v82.Name = "ButtonText"
			v82.Position = UDim2.fromOffset(0, -1)
			v82.Size = UDim2.fromScale(1, 1)
			v82.Font = Enum.Font.GothamSemibold
			v82.TextSize = 14
			if string.len(v74) > 2 then
				v82.TextSize = 12
			end
			v82.BackgroundTransparency = 1
			v82.TextTransparency = 1
			v82.TextColor3 = Color3.new(1, 1, 1)
			v82.TextXAlignment = Enum.TextXAlignment.Center
			v82.Text = v74
			v82.Parent = v38
			local v83 = v_u_3
			table.insert(v_u_29, v83:Create(v82, v34, {
				["TextTransparency"] = 1
			}))
			local v84 = v_u_3
			table.insert(v_u_30, v84:Create(v82, v34, {
				["TextTransparency"] = 0
			}))
		end
	end
	if p25 == Enum.ProximityPromptInputType.Touch or p_u_24.ClickablePrompt then
		local v85 = Instance.new("TextButton")
		v85.BackgroundTransparency = 1
		v85.TextTransparency = 1
		v85.Size = UDim2.fromScale(1, 1)
		v85.Parent = v_u_35
		local v_u_86 = false
		v85.InputBegan:Connect(function(p87)
			-- upvalues: (copy) p_u_24, (ref) v_u_86
			if (p87.UserInputType == Enum.UserInputType.Touch or p87.UserInputType == Enum.UserInputType.MouseButton1) and p87.UserInputState ~= Enum.UserInputState.Change then
				p_u_24:InputHoldBegin()
				v_u_86 = true
			end
		end)
		v85.InputEnded:Connect(function(p88)
			-- upvalues: (ref) v_u_86, (copy) p_u_24
			if (p88.UserInputType == Enum.UserInputType.Touch or p88.UserInputType == Enum.UserInputType.MouseButton1) and v_u_86 then
				v_u_86 = false
				p_u_24:InputHoldEnd()
			end
		end)
		v_u_35.Active = true
	end
	if p_u_24.HoldDuration > 0 then
		local v89 = v_u_23()
		v89.Parent = v38
		local v90 = v_u_3
		local v91 = v89.Progress
		table.insert(v_u_27, v90:Create(v91, v31, {
			["Value"] = 1
		}))
		local v92 = v_u_3
		local v93 = v89.Progress
		table.insert(v_u_28, v92:Create(v93, v32, {
			["Value"] = 0
		}))
	end
	local v_u_94, v_u_95
	if p_u_24.HoldDuration > 0 then
		v_u_94 = p_u_24.PromptButtonHoldBegan:Connect(function()
			-- upvalues: (copy) v_u_27
			for _, v96 in ipairs(v_u_27) do
				v96:Play()
			end
		end)
		v_u_95 = p_u_24.PromptButtonHoldEnded:Connect(function()
			-- upvalues: (copy) v_u_28
			for _, v97 in ipairs(v_u_28) do
				v97:Play()
			end
		end)
	else
		v_u_94 = nil
		v_u_95 = nil
	end
	local v_u_99 = p_u_24.Triggered:Connect(function()
		-- upvalues: (copy) v_u_29
		for _, v98 in ipairs(v_u_29) do
			v98:Play()
		end
	end)
	local v_u_101 = p_u_24.TriggerEnded:Connect(function()
		-- upvalues: (copy) v_u_30
		for _, v100 in ipairs(v_u_30) do
			v100:Play()
		end
	end)
	local function v109()
		-- upvalues: (ref) v_u_4, (copy) p_u_24, (copy) v_u_43, (copy) v_u_48, (copy) v_u_35
		local v102 = v_u_4:GetTextSize(p_u_24.ActionText, 19, Enum.Font.GothamSemibold, Vector2.new(1000, 1000))
		local v103 = v_u_4:GetTextSize(p_u_24.ObjectText, 14, Enum.Font.GothamSemibold, Vector2.new(1000, 1000))
		local v104 = v102.X
		local v105 = v103.X
		local v106 = math.max(v104, v105)
		local v107 = (p_u_24.ActionText == nil or p_u_24.ActionText == "") and (p_u_24.ObjectText == nil or p_u_24.ObjectText == "") and 72 or v106 + 72 + 24
		local v108 = (p_u_24.ObjectText == nil or p_u_24.ObjectText == "") and 0 or 9
		v_u_43.Position = UDim2.new(0.5, 72 - v107 / 2, 0, v108)
		v_u_48.Position = UDim2.new(0.5, 72 - v107 / 2, 0, -10)
		v_u_43.Text = p_u_24.ActionText
		v_u_48.Text = p_u_24.ObjectText
		v_u_43.AutoLocalize = p_u_24.AutoLocalize
		v_u_43.RootLocalizationTable = p_u_24.RootLocalizationTable
		v_u_48.AutoLocalize = p_u_24.AutoLocalize
		v_u_48.RootLocalizationTable = p_u_24.RootLocalizationTable
		v_u_35.Size = UDim2.fromOffset(v107, 72)
		v_u_35.SizeOffset = Vector2.new(p_u_24.UIOffset.X / v_u_35.Size.Width.Offset, p_u_24.UIOffset.Y / v_u_35.Size.Height.Offset)
	end
	local v_u_110 = p_u_24.Changed:Connect(v109)
	v109()
	v_u_35.Adornee = p_u_24.Parent
	v_u_35.Parent = p26
	for _, v111 in ipairs(v_u_30) do
		v111:Play()
	end
	return function()
		-- upvalues: (ref) v_u_94, (ref) v_u_95, (ref) v_u_99, (ref) v_u_101, (copy) v_u_110, (copy) v_u_29, (copy) v_u_35
		if v_u_94 then
			v_u_94:Disconnect()
		end
		if v_u_95 then
			v_u_95:Disconnect()
		end
		v_u_99:Disconnect()
		v_u_101:Disconnect()
		v_u_110:Disconnect()
		for _, v112 in ipairs(v_u_29) do
			v112:Play()
		end
		wait(0.2)
		v_u_35.Parent = nil
	end
end
v2.PromptShown:Connect(function(p114, p115)
	-- upvalues: (copy) v_u_5, (copy) v_u_113
	if p114.Style ~= Enum.ProximityPromptStyle.Default then
		local v116 = v_u_5:FindFirstChild("ProximityPrompts")
		if v116 == nil then
			v116 = Instance.new("ScreenGui")
			v116.Name = "ProximityPrompts"
			v116.ResetOnSpawn = false
			v116.Parent = v_u_5
		end
		local v117 = v_u_113(p114, p115, v116)
		p114.PromptHidden:Wait()
		v117()
	end
end)
return {}