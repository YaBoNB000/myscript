-- InputHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {
	["isReady"] = false
}
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v_u_6 = v_u_5:WaitForChild("PlayerGui")
local v_u_7 = v_u_3.TouchEnabled
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = require(script.Button)
local v_u_12 = require(script.Config)
local v_u_13 = {}
local v_u_14 = "KeyboardAndMouse"
local v_u_15 = { "KeyboardAndMouse", "Touch", "Gamepad" }
local v_u_16 = {
	[Enum.UserInputType.MouseButton1] = 1,
	[Enum.UserInputType.MouseButton2] = 1,
	[Enum.UserInputType.MouseButton3] = 1,
	[Enum.UserInputType.MouseWheel] = 1,
	[Enum.UserInputType.MouseMovement] = 1,
	[Enum.UserInputType.Keyboard] = 1,
	[Enum.UserInputType.Touch] = 2,
	[Enum.UserInputType.Gamepad1] = 3,
	[Enum.UserInputType.Gamepad2] = 3,
	[Enum.UserInputType.Gamepad3] = 3,
	[Enum.UserInputType.Gamepad4] = 3,
	[Enum.UserInputType.Gamepad5] = 3,
	[Enum.UserInputType.Gamepad6] = 3,
	[Enum.UserInputType.Gamepad7] = 3,
	[Enum.UserInputType.Gamepad8] = 3
}
local v_u_17 = {
	Enum.UserInputType.Gamepad1,
	Enum.UserInputType.Gamepad2,
	Enum.UserInputType.Gamepad3,
	Enum.UserInputType.Gamepad4,
	Enum.UserInputType.Gamepad5,
	Enum.UserInputType.Gamepad6,
	Enum.UserInputType.Gamepad7,
	Enum.UserInputType.Gamepad8
}
function v_u_1.BindAction(p_u_18, p_u_19, p_u_20, p_u_21, ...)
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	local v22 = p_u_19 ~= nil
	assert(v22, "No actionName")
	local v23 = p_u_20 ~= nil
	assert(v23, "No functionToBind")
	local v_u_24 = { ... }
	task.spawn(function()
		-- upvalues: (copy) p_u_18, (ref) v_u_2, (copy) p_u_19, (copy) p_u_20, (copy) v_u_24, (copy) p_u_21, (ref) v_u_7
		while not p_u_18.isReady do
			task.wait()
		end
		local v25 = v_u_24
		v_u_2:BindAction(p_u_19, p_u_20, false, unpack(v25))
		if p_u_21 and v_u_7 then
			p_u_18:_bindButton(p_u_19, p_u_20)
		end
	end)
end
function v_u_1.BindActionAtPriority(p_u_26, p_u_27, p_u_28, p_u_29, p_u_30, ...)
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	local v31 = p_u_27 ~= nil
	assert(v31, "No actionName")
	local v32 = p_u_28 ~= nil
	assert(v32, "No functionToBind")
	local v33 = p_u_30 ~= nil
	assert(v33, "No priorityLevel")
	local v_u_34 = { ... }
	task.spawn(function()
		-- upvalues: (copy) p_u_26, (ref) v_u_2, (copy) p_u_27, (copy) p_u_28, (copy) p_u_30, (copy) v_u_34, (copy) p_u_29, (ref) v_u_7
		while not p_u_26.isReady do
			task.wait()
		end
		local v35 = v_u_34
		v_u_2:BindActionAtPriority(p_u_27, p_u_28, false, p_u_30, unpack(v35))
		if p_u_29 and v_u_7 then
			p_u_26:_bindButton(p_u_27, p_u_28)
		end
	end)
end
function v_u_1.UnbindAction(p_u_36, p_u_37)
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	local v38 = p_u_37 ~= nil
	assert(v38, "No actionName")
	task.spawn(function()
		-- upvalues: (copy) p_u_36, (ref) v_u_2, (copy) p_u_37, (ref) v_u_7
		while not p_u_36.isReady do
			task.wait()
		end
		v_u_2:UnbindAction(p_u_37)
		if v_u_7 then
			p_u_36:_unbindButton(p_u_37)
		end
	end)
end
function v_u_1.Toggle(_, p39, p40)
	-- upvalues: (copy) v_u_13
	local v41 = v_u_13[p39]
	if v41 and v41.button then
		v41.button:Toggle(p40)
	end
end
function v_u_1._bindButton(p42, p43, p44)
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (ref) v_u_10
	local v45 = v_u_13[p43]
	local v46 = v_u_12.NAME_TO_SLOT_MAP[p43]
	local v47, v48
	if v45 then
		v47 = v45.slot
		v48 = v45.button
		v48:RebindFunction(p44)
	else
		v47 = v46 or p42:_getEmptySlot()
		v48 = v_u_11.new(p43, v47, p44)
	end
	v48:SetParent(v_u_10)
	v_u_13[p43] = {
		["slot"] = v47,
		["button"] = v48
	}
	v48:Bind()
end
function v_u_1._unbindButton(_, p49)
	-- upvalues: (copy) v_u_13
	local v50 = v_u_13[p49]
	if v50 and v50.button then
		v50.button:Unbind()
	end
end
function v_u_1._getEmptySlot(_)
	-- upvalues: (copy) v_u_13
	local v51 = 0
	for _, v52 in pairs(v_u_13) do
		if v51 < v52.slot then
			v51 = v52.slot
		end
	end
	return v51 + 1
end
function v_u_1.GetInputType(p53)
	-- upvalues: (copy) v_u_16, (copy) v_u_15, (copy) v_u_1, (ref) v_u_14
	if p53 and v_u_16[p53] then
		return v_u_15[v_u_16[p53]] or v_u_1.KeyboardAndMouse
	else
		return v_u_14 or v_u_1.KeyboardAndMouse
	end
end
function v_u_1.Initialize()
	-- upvalues: (ref) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_3, (copy) v_u_17, (copy) v_u_7, (copy) v_u_1, (ref) v_u_6, (copy) v_u_5, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (copy) v_u_4
	v_u_14 = v_u_15[v_u_16[v_u_3:GetLastInputType()] or 1]
	v_u_3.LastInputTypeChanged:Connect(function(p54)
		-- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_14
		local v55 = v_u_15[v_u_16[p54]]
		if v55 and v55 ~= v_u_14 then
			v_u_14 = v55
		end
	end)
	v_u_3.InputBegan:Connect(function(p56)
		-- upvalues: (ref) v_u_14, (ref) v_u_17
		if p56.UserInputType == Enum.UserInputType.Touch then
			v_u_14 = "Touch"
		elseif p56.UserInputType and table.find(v_u_17, p56.UserInputType) then
			v_u_14 = "Gamepad"
		end
	end)
	if v_u_7 then
		task.spawn(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_5, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (ref) v_u_4, (ref) v_u_1
			v_u_6 = v_u_5:WaitForChild("PlayerGui")
			while true do
				v_u_8 = v_u_6:FindFirstChild("TouchGui")
				local v57 = v_u_8
				if v57 then
					v57 = v_u_8:FindFirstChild("TouchControlFrame")
				end
				v_u_9 = v57
				local v58 = v_u_9
				if v58 then
					v58 = v_u_9:FindFirstChild("JumpButton")
				end
				v_u_10 = v58
				v_u_4.RenderStepped:Wait()
				if v_u_8 ~= nil and (v_u_9 ~= nil and v_u_10 ~= nil) then
					v_u_1.isReady = true
					v_u_8.DisplayOrder = 20
					return
				end
			end
		end)
	else
		v_u_1.isReady = true
	end
end
return v_u_1