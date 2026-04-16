-- Button (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > InputHandler
-- Original

local v_u_1 = {}
local v2 = require(game:GetService("ReplicatedStorage").devv).load
game:GetService("GuiService")
local v_u_3 = require(script.Parent.Config)
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = v2("Maid")
function v_u_1.new(p6, p7, p8)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_5
	local v9 = {
		["__index"] = v_u_1
	}
	local v10 = setmetatable({}, v9)
	if v_u_3.POSITION_MAP[p7] == nil then
		return nil
	end
	v10._actionName = p6
	v10._slot = p7
	v10._button = v10:_createButton()
	v10._functionToBind = p8
	v10._state = Enum.UserInputState.End
	v10._maid = v_u_5.new()
	return v10
end
function v_u_1.RebindFunction(p11, p12)
	p11._functionToBind = p12
end
function v_u_1.Bind(p_u_13)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v_u_14 = p_u_13._actionName
	local v15 = v_u_3.NAME_TO_SLOT_MAP[v_u_14]
	local function v16()
		-- upvalues: (copy) p_u_13, (copy) v_u_14
		if p_u_13._state == Enum.UserInputState.Begin then
			p_u_13._state = Enum.UserInputState.End
			p_u_13._button.ImageColor3 = p_u_13._button.BackgroundColor3
		else
			p_u_13._state = Enum.UserInputState.Begin
			p_u_13._button.ImageColor3 = p_u_13._button.BorderColor3
		end
		p_u_13._functionToBind(v_u_14, p_u_13._state)
	end
	local function v17()
		-- upvalues: (copy) p_u_13, (copy) v_u_14
		p_u_13._functionToBind(v_u_14, Enum.UserInputState.Begin)
		p_u_13._button.ImageColor3 = p_u_13._button.BorderColor3
	end
	local function v18()
		-- upvalues: (copy) p_u_13, (copy) v_u_14
		p_u_13._functionToBind(v_u_14, Enum.UserInputState.End)
		p_u_13._button.ImageColor3 = p_u_13._button.BackgroundColor3
	end
	if v_u_14 == "shoot" then
		if v_u_4:GetAttribute("toggleShoot") then
			p_u_13._maid:GiveTask(p_u_13._button.Activated:Connect(v16))
		else
			p_u_13._maid:GiveTask(p_u_13._button.InputBegan:Connect(v17))
			p_u_13._maid:GiveTask(p_u_13._button.InputEnded:Connect(v18))
		end
	elseif v15 == 5 and (v_u_14 ~= "block" and v_u_14 ~= "siren") or (v15 == 6 or (v_u_14 == "reload" or (v_u_14 == "fp" or (v_u_14 == "detonate" or v_u_14 == "horn")))) then
		p_u_13._maid:GiveTask(p_u_13._button.InputBegan:Connect(v17))
		p_u_13._maid:GiveTask(p_u_13._button.InputEnded:Connect(v18))
	else
		p_u_13._maid:GiveTask(p_u_13._button.Activated:Connect(v16))
	end
	p_u_13._button.Visible = true
end
function v_u_1.Unbind(p19)
	p19._maid:DoCleaning()
	p19._state = Enum.UserInputState.End
	p19._button.ImageColor3 = p19._button.BackgroundColor3
	p19._button.Visible = false
end
function v_u_1.SetParent(p20, p21)
	if p20._button ~= nil then
		p20._button.Parent = p21
	end
end
function v_u_1.Toggle(p22, p23)
	if p23 then
		p22._state = Enum.UserInputState.Begin
		p22._button.ImageColor3 = p22._button.BorderColor3
	else
		p22._state = Enum.UserInputState.End
		p22._button.ImageColor3 = p22._button.BackgroundColor3
	end
end
function v_u_1.Destroy(p24)
	p24:Unbind()
	if p24._button ~= nil then
		p24._button:Destroy()
		p24._button = nil
	end
end
function v_u_1._createButton(p25)
	-- upvalues: (copy) v_u_3
	local v26 = p25._actionName
	local v27 = v_u_3.NAME_TO_SLOT_MAP[v26]
	local v28 = p25._slot
	local v29 = (v26 == "scope" or v26 == "reload") and 0.8 or (v27 == 5 and 1.1 or 0.75)
	local v30 = Instance.new("ImageButton")
	v30.Name = v28
	v30.BackgroundTransparency = 1
	local v31 = UDim2.fromScale(v29, v29)
	local v32 = Vector2.new(v31.X.Scale, v31.Y.Scale) / (Vector2.new(1, 1) * 1.25)
	v30.Size = UDim2.fromScale(v32.X, v32.Y)
	v30.Image = "rbxassetid://10243710804"
	v30.ImageTransparency = 0.5
	v30.AnchorPoint = Vector2.new(0.5, 0.5)
	v30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	v30.BorderColor3 = Color3.fromRGB(125, 125, 125)
	local v33 = v_u_3.POSITION_MAP[v28]
	local v34 = Vector2.new(v33.X.Scale, v33.Y.Scale) / (Vector2.new(1, 1) * 1.25)
	v30.Position = UDim2.fromScale(v34.X, v34.Y)
	local v35 = v_u_3.NAME_TO_ICON_MAP[v26]
	if v35 then
		v35 = "rbxassetid://" .. v35
	end
	local v36 = Instance.new("ImageLabel")
	v36.BackgroundTransparency = 1
	v36.Size = UDim2.fromScale(0.525, 0.525)
	v36.Position = UDim2.fromScale(0.5, 0.5)
	v36.AnchorPoint = Vector2.new(0.5, 0.5)
	v36.Image = v35 or ""
	v36.Parent = v30
	return v30
end
return v_u_1