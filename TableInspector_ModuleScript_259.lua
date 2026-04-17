-- TableInspector (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > debug
-- Original

local v_u_1 = Vector2.new(2, 2)
local v_u_2 = Vector2.new(1, 1)
local v_u_3 = Enum.Font.Code
local v_u_4 = Vector2.new(10, 10)
local v_u_5 = Vector2.new(98, 28)
local v_u_6 = Vector2.new(336, 112)
local v_u_7 = Vector2.new((1 / 0), (1 / 0))
local v_u_8 = Color3.fromRGB(248, 109, 124)
local v_u_9 = Color3.fromRGB(255, 198, 0)
local v_u_10 = Color3.fromRGB(173, 241, 149)
local v_u_11 = Color3.fromRGB(119, 255, 255)
local v_u_12 = Color3.fromRGB(48, 48, 48)
local v_u_13 = Color3.fromRGB(204, 204, 204)
local v_u_14 = Color3.fromRGB(255, 183, 0)
local v_u_15 = {}
v_u_15.__index = v_u_15
local v_u_16 = {}
v_u_16.__index = v_u_16
local v_u_17 = {}
v_u_17.__index = v_u_17
local v_u_18 = {}
v_u_18.__index = v_u_18
local v_u_19 = game:GetService("TextService")
local v_u_20 = game:GetService("GuiService")
local v_u_21 = game:GetService("UserInputService")
local v_u_22 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
function v_u_15.new()
	-- upvalues: (copy) v_u_15, (copy) v_u_21, (copy) v_u_20, (copy) v_u_22
	local v23 = v_u_15
	local v_u_24 = setmetatable({}, v23)
	v_u_24._logScale = 0
	v_u_24._tableRoots = {}
	v_u_24.backFrame = Instance.new("Frame")
	v_u_24.backFrame.BackgroundTransparency = 1
	v_u_24.backFrame.Size = UDim2.fromScale(1, 1)
	v_u_24.backFrame.ClipsDescendants = true
	v_u_24.basisFrame = Instance.new("Frame")
	v_u_24.basisFrame.Size = UDim2.fromOffset(100, 100)
	v_u_24.basisFrame.Transparency = 1
	v_u_24.basisFrame.Parent = v_u_24.backFrame
	v_u_24.basisScale = Instance.new("UIScale")
	v_u_24.basisScale.Parent = v_u_24.basisFrame
	v_u_24._activeElements = setmetatable({}, {
		["__mode"] = "k"
	})
	v_u_24:registerFrame(v_u_24.backFrame, v_u_24)
	v_u_24._connections = {}
	v_u_24._hoveringFrames = {}
	v_u_24._connections[1] = game:GetService("RunService").RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_21, (ref) v_u_20, (copy) v_u_24, (ref) v_u_22
		local v25 = v_u_21:GetMouseLocation() - v_u_20:GetGuiInset()
		v_u_24._hoveringFrames = v_u_22:getGuiObjectsAtPosition(v25.x, v25.y)
		v_u_24.highlightedValue = nil
		for _, v26 in v_u_24._hoveringFrames do
			local v27 = v_u_24._activeElements[v26]
			if v27 and v27.getValue then
				local v28 = v27:getValue()
				if type(v28) == "table" then
					v_u_24.highlightedValue = v28
					break
				end
			end
		end
		for v29 in v_u_24._tableRoots do
			v29:update()
		end
	end)
	v_u_24._connections[2] = v_u_21.InputBegan:Connect(function(p30, p31)
		-- upvalues: (copy) v_u_24
		if p31 then
			return
		elseif game:GetService("UserInputService").MouseBehavior ~= Enum.MouseBehavior.LockCenter then
			for _, v32 in v_u_24._hoveringFrames do
				local v33 = v_u_24._activeElements[v32]
				if v33 and (v33.inputBegan and v33:inputBegan(p30, v32)) then
					return
				end
			end
		end
	end)
	v_u_24._connections[3] = v_u_21.InputChanged:Connect(function(p34, p35)
		-- upvalues: (copy) v_u_24
		if p35 then
			return
		elseif game:GetService("UserInputService").MouseBehavior ~= Enum.MouseBehavior.LockCenter then
			for _, v36 in v_u_24._hoveringFrames do
				local v37 = v_u_24._activeElements[v36]
				if v37 and (v37.inputChanged and v37:inputChanged(p34, v36)) then
					return
				end
			end
		end
	end)
	v_u_24._connections[4] = v_u_21.InputEnded:Connect(function(p38, _)
		-- upvalues: (copy) v_u_24
		for _, v39 in v_u_24._hoveringFrames do
			local v40 = v_u_24._activeElements[v39]
			if v40 and (v40.inputEnded and v40:inputEnded(p38, v39)) then
				return
			end
		end
	end)
	v_u_24.highlightedValue = nil
	return v_u_24
end
function v_u_15.destroy(p41)
	for _, v42 in p41._connections do
		v42:Disconnect()
	end
	for v43 in p41._tableRoots do
		v43:destroy()
	end
end
function v_u_15.addPath(p44, p45, p46, p47)
	-- upvalues: (copy) v_u_16
	local v48 = v_u_16.new(p44, ("...%*"):format(p45), p46, p47)
	v48.backFrame.Parent = p44.basisFrame
	p44._tableRoots[v48] = true
	return v48
end
function v_u_15.addTable(p49, p50, p51, p52)
	-- upvalues: (copy) v_u_16
	local v53 = v_u_16.new(p49, p50, { p51 }, p52)
	v53.backFrame.Parent = p49.basisFrame
	p49._tableRoots[v53] = true
	return v53
end
function v_u_15.registerFrame(p54, p55, p56)
	p54._activeElements[p55] = p56
end
function v_u_15.inputChanged(_, _)
	return true
end
function v_u_15.inputBegan(_, p57)
	if p57.UserInputType == Enum.UserInputType.MouseButton1 then
		return true
	end
end
function v_u_15.drag(p_u_58, p_u_59)
	-- upvalues: (copy) v_u_21, (copy) v_u_20
	local v_u_60 = (v_u_21:GetMouseLocation() - v_u_20:GetGuiInset() - p_u_58.basisFrame.AbsolutePosition) / p_u_58.basisFrame.AbsoluteSize
	if p_u_58._dragging then
		p_u_58._dragging = false
		p_u_58._dragConnection1:Disconnect()
		p_u_58._dragConnection2:Disconnect()
	end
	p_u_58._dragging = true
	p_u_58._dragConnection1 = game:GetService("RunService").RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_21, (ref) v_u_20, (copy) v_u_60, (copy) p_u_58
		local v61 = (v_u_21:GetMouseLocation() - v_u_20:GetGuiInset() - v_u_60 * p_u_58.basisFrame.AbsoluteSize - p_u_58.basisFrame.Parent.AbsolutePosition) / p_u_58.basisFrame.Parent.AbsoluteSize
		p_u_58.basisFrame.Position = UDim2.fromScale(v61.x, v61.y)
	end)
	p_u_58._dragConnection2 = game:GetService("UserInputService").InputEnded:Connect(function(p62)
		-- upvalues: (copy) p_u_59, (ref) v_u_21, (ref) v_u_20, (copy) v_u_60, (copy) p_u_58
		if p62.UserInputType == p_u_59 then
			local v63 = (v_u_21:GetMouseLocation() - v_u_20:GetGuiInset() - v_u_60 * p_u_58.basisFrame.AbsoluteSize - p_u_58.basisFrame.Parent.AbsolutePosition) / p_u_58.basisFrame.Parent.AbsoluteSize
			p_u_58.basisFrame.Position = UDim2.fromScale(v63.x, v63.y)
			p_u_58._dragging = false
			p_u_58._dragConnection1:Disconnect()
			p_u_58._dragConnection2:Disconnect()
		end
	end)
end
function v_u_16.new(p64, p65, p66, p67)
	-- upvalues: (copy) v_u_16, (copy) v_u_19, (copy) v_u_3, (copy) v_u_13, (copy) v_u_12, (copy) v_u_17
	local v68 = v_u_16
	local v_u_69 = setmetatable({}, v68)
	v_u_69._tableInspector = p64
	v_u_69._name = p65
	v_u_69._json = game:GetService("HttpService"):JSONEncode(p66)
	if v_u_69._json then
		local v70 = v_u_69._json
		if string.len(v70) >= 200000 then
			v_u_69._json = ""
		end
	end
	local v71 = v_u_19:GetTextSize(p65, 14, v_u_3, Vector2.zero)
	v_u_69.backFrame = Instance.new("Frame")
	v_u_69.backFrame.Size = UDim2.fromOffset(100, 100)
	v_u_69.backFrame.Position = UDim2.fromScale(0, 1)
	v_u_69.backFrame.Transparency = 1
	v_u_69.dragFrame = Instance.new("Frame")
	v_u_69.dragFrame.Transparency = 1
	v_u_69.dragFrame.Parent = v_u_69.backFrame
	v_u_69.nameFrame = Instance.new("TextLabel")
	v_u_69.nameFrame.AnchorPoint = Vector2.new(0, 1)
	v_u_69.nameFrame.Size = UDim2.fromOffset(v71.x + 4, v71.y + 4)
	v_u_69.nameFrame.Position = UDim2.fromOffset(0, -1)
	v_u_69.nameFrame.TextSize = 14
	v_u_69.nameFrame.BorderSizePixel = 0
	v_u_69.nameFrame.TextColor3 = v_u_13
	v_u_69.nameFrame.BackgroundColor3 = v_u_12
	v_u_69.nameFrame.Font = Enum.Font.Code
	v_u_69.nameFrame.Text = p65
	v_u_69.nameFrame.Parent = v_u_69.backFrame
	v_u_69.exitButton = Instance.new("TextButton")
	v_u_69.exitButton.AnchorPoint = Vector2.new(1, 1)
	v_u_69.exitButton.Size = UDim2.fromOffset(20, 20)
	v_u_69.exitButton.Position = UDim2.fromOffset(v71.x + 25, 0)
	v_u_69.exitButton.TextSize = 16
	v_u_69.exitButton.BorderSizePixel = 0
	v_u_69.exitButton.TextColor3 = Color3.new(1, 1, 1)
	v_u_69.exitButton.BackgroundColor3 = Color3.new(1, 0, 0)
	v_u_69.exitButton.Font = Enum.Font.Code
	v_u_69.exitButton.Text = "X"
	v_u_69.exitButton.Parent = v_u_69.backFrame
	v_u_69.jsonBox = Instance.new("TextBox")
	v_u_69.jsonBox.AnchorPoint = Vector2.new(1, 1)
	v_u_69.jsonBox.Size = UDim2.fromOffset(v71.x + 45, v71.y + 4)
	v_u_69.jsonBox.Position = UDim2.fromOffset(0, -1)
	v_u_69.jsonBox.TextSize = 14
	v_u_69.jsonBox.BorderSizePixel = 0
	v_u_69.jsonBox.TextColor3 = v_u_13
	v_u_69.jsonBox.BackgroundColor3 = v_u_12
	v_u_69.jsonBox.Font = Enum.Font.Code
	v_u_69.jsonBox.Text = v_u_69._json or ""
	v_u_69.jsonBox.ClearTextOnFocus = false
	v_u_69.jsonBox.ClipsDescendants = true
	v_u_69.jsonBox.Parent = v_u_69.backFrame
	local v72 = p64._connections
	local v73 = v_u_69.exitButton.Activated
	table.insert(v72, v73:Connect(function()
		-- upvalues: (copy) v_u_69
		v_u_69:destroy()
	end))
	v_u_69._path = p66
	if p67 then
		local v74 = p67.backFrame.AbsolutePosition
		local v75 = p64.basisFrame
		local v76 = (v74 - v75.AbsolutePosition) / v75.AbsoluteSize
		v_u_69.backFrame.Position = UDim2.fromScale(v76.x, v76.y)
	end
	v_u_69._rootElement = p67 or v_u_17.new(v_u_69._tableInspector, v_u_69, nil)
	v_u_69._rootElement.parent = v_u_69
	v_u_69._rootElement.backFrame.Position = UDim2.fromOffset(0, 0)
	v_u_69._rootElement.backFrame.Parent = v_u_69.backFrame
	v_u_69._tableInspector:registerFrame(v_u_69.dragFrame, v_u_69)
	v_u_69._tableInspector:registerFrame(v_u_69.nameFrame, v_u_69)
	v_u_69._tableInspector:registerFrame(v_u_69.exitButton, v_u_69)
	v_u_69._tableInspector:registerFrame(v_u_69.jsonBox, v_u_69)
	v_u_69._dragging = false
	v_u_69._dragConnection1 = nil
	v_u_69._dragConnection2 = nil
	return v_u_69
end
function v_u_16.destroy(p77)
	p77._rootElement:destroy()
	p77.backFrame:Destroy()
	p77._tableInspector._tableRoots[p77] = nil
end
function v_u_16.getIndex(p78)
	return p78._name
end
function v_u_16.getPath(p79)
	local v80 = #p79._path
	local v81 = table.create(v80)
	table.move(p79._path, 1, v80, 1, v81)
	return v81
end
function v_u_16.getValue(p82)
	local v83 = p82._path
	local v84 = v83[1]
	for v85 = 2, #v83 do
		local v86 = v83[v85]
		if type(v84) ~= "table" then
			return nil
		end
		v84 = v84[v86]
	end
	return v84
end
function v_u_16.update(p87)
	p87._rootElement:setValue(p87:getValue())
	local v88 = p87._rootElement:update()
	p87.dragFrame.Size = UDim2.fromOffset(v88.x, v88.y)
end
function v_u_16.inputBegan(p89, p90)
	if p90.UserInputType == Enum.UserInputType.MouseButton1 then
		p89:drag(Enum.UserInputType.MouseButton1)
		return true
	end
end
function v_u_16.drag(p_u_91, p_u_92)
	-- upvalues: (copy) v_u_21, (copy) v_u_20
	local v_u_93 = (v_u_21:GetMouseLocation() - v_u_20:GetGuiInset() - p_u_91.backFrame.AbsolutePosition) / p_u_91.backFrame.AbsoluteSize
	if p_u_91._dragging then
		p_u_91._dragging = false
		p_u_91._dragConnection1:Disconnect()
		p_u_91._dragConnection2:Disconnect()
	end
	p_u_91._dragging = true
	p_u_91._dragConnection1 = game:GetService("RunService").RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_21, (ref) v_u_20, (copy) v_u_93, (copy) p_u_91
		local v94 = (v_u_21:GetMouseLocation() - v_u_20:GetGuiInset() - v_u_93 * p_u_91.backFrame.AbsoluteSize - p_u_91.backFrame.Parent.AbsolutePosition) / p_u_91.backFrame.Parent.AbsoluteSize
		p_u_91.backFrame.Position = UDim2.fromScale(v94.x, v94.y)
	end)
	p_u_91._dragConnection2 = game:GetService("UserInputService").InputEnded:Connect(function(p95)
		-- upvalues: (copy) p_u_92, (ref) v_u_21, (ref) v_u_20, (copy) v_u_93, (copy) p_u_91
		if p95.UserInputType == p_u_92 then
			local v96 = (v_u_21:GetMouseLocation() - v_u_20:GetGuiInset() - v_u_93 * p_u_91.backFrame.AbsoluteSize - p_u_91.backFrame.Parent.AbsolutePosition) / p_u_91.backFrame.Parent.AbsoluteSize
			p_u_91.backFrame.Position = UDim2.fromScale(v96.x, v96.y)
			p_u_91._dragging = false
			p_u_91._dragConnection1:Disconnect()
			p_u_91._dragConnection2:Disconnect()
		end
	end)
end
function v_u_17.new(p97, p98, p99)
	-- upvalues: (copy) v_u_17, (copy) v_u_12, (copy) v_u_13, (copy) v_u_3
	local v100 = v_u_17
	local v101 = setmetatable({}, v100)
	v101._tableInspector = p97
	v101._value = p99
	v101._isExpanded = false
	v101._scrollingEnabled = false
	v101._upToDate = false
	v101.parent = p98
	v101.backFrame = Instance.new("Frame")
	v101.backFrame.BackgroundColor3 = v_u_12
	v101.backFrame.BorderColor3 = v_u_13
	v101.backFrame.BorderSizePixel = 0
	v101.backFrame.BorderMode = Enum.BorderMode.Inset
	v101.clipFrame = Instance.new("Frame")
	v101.clipFrame.BackgroundTransparency = 1
	v101.clipFrame.ClipsDescendants = true
	v101.clipFrame.Position = UDim2.fromScale(0.5, 0.5)
	v101.clipFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	v101.clipFrame.Parent = v101.backFrame
	v101.dataFrame = Instance.new("TextLabel")
	v101.dataFrame.BackgroundColor3 = v_u_12
	v101.dataFrame.TextXAlignment = Enum.TextXAlignment.Left
	v101.dataFrame.TextYAlignment = Enum.TextYAlignment.Top
	v101.dataFrame.BorderSizePixel = 0
	v101.dataFrame.TextSize = 14
	v101.dataFrame.Font = v_u_3
	v101.dataFrame.Text = ""
	v101.dataFrame.Parent = v101.clipFrame
	v101._size = Vector2.zero
	v101._entries = {}
	v101._tableInspector:registerFrame(v101.backFrame, v101)
	v101._lastExpansionAttempt = (-1 / 0)
	v101._lastExpansionAttemptPosition = Vector2.zero
	return v101
end
function v_u_17.destroy(p102)
	p102.backFrame:Destroy()
end
function v_u_17.inputEnded(p103, p104)
	-- upvalues: (copy) v_u_21, (copy) v_u_20
	if p104.UserInputType == Enum.UserInputType.MouseButton1 then
		local v105 = v_u_21:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_21:IsKeyDown(Enum.KeyCode.RightControl)
		local v106 = v_u_21:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_21:IsKeyDown(Enum.KeyCode.RightShift)
		if v105 and v106 then
			return
		elseif v105 then
			return
		elseif not v106 then
			p103._lastExpansionAttempt = os.clock()
			p103._lastExpansionAttemptPosition = v_u_21:GetMouseLocation() - v_u_20:GetGuiInset()
		end
	else
		return
	end
end
function v_u_17.getPath(p107)
	return not p107.parent and { p107._value } or p107.parent:getPath(p107)
end
function v_u_17.inputBegan(p108, p109)
	-- upvalues: (copy) v_u_21, (copy) v_u_20
	if p109.UserInputType == Enum.UserInputType.MouseButton1 then
		local v110 = v_u_21:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_21:IsKeyDown(Enum.KeyCode.RightControl)
		local v111 = v_u_21:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_21:IsKeyDown(Enum.KeyCode.RightShift)
		if v110 and v111 then
			return
		elseif v110 then
			local v112 = p108._value
			if type(v112) == "table" then
				if p108.parent and p108.parent.pullOutElement then
					local v113 = p108.parent
					local v114 = tostring(v113:getIndex())
					p108.parent:pullOutElement(p108)
					p108.parent = nil
					p108._tableInspector:addTable(v114, p108._value, p108):drag(Enum.UserInputType.MouseButton1)
					return true
				end
			end
		elseif v111 then
			if p108.parent and p108.parent.pullOutElement then
				if p108.parent:getIndexElement() ~= p108 then
					local v115 = p108.parent
					local v116 = tostring(v115:getIndex())
					local v117 = p108:getPath()
					p108.parent:pullOutElement(p108)
					p108.parent = nil
					p108._tableInspector:addPath(v116, v117, p108):drag(Enum.UserInputType.MouseButton1)
					return true
				end
			end
		else
			if os.clock() - p108._lastExpansionAttempt < 0.25 and (p108._lastExpansionAttemptPosition - (v_u_21:GetMouseLocation() - v_u_20:GetGuiInset())).magnitude < 4 then
				p108:toggleExpansion()
				return true
			end
			return
		end
	else
		return
	end
end
function v_u_17.inputChanged(_, _)
	return true
end
function v_u_17.setValue(p118, p119)
	if p118._value ~= p119 then
		p118._upToDate = false
		p118._value = p119
	end
end
function v_u_17.collapse(p120)
	if p120._isExpanded then
		p120._upToDate = false
		p120._isExpanded = false
		for _, v121 in p120._entries do
			v121.backFrame.Visible = false
		end
	end
end
function v_u_17.expand(p122)
	if not p122._isExpanded then
		p122._upToDate = false
		p122._isExpanded = true
		for _, v123 in p122._entries do
			v123.backFrame.Visible = true
		end
	end
end
function v_u_17.toggleExpansion(p124)
	if p124._isExpanded then
		p124:collapse()
	else
		p124:expand()
	end
end
function v_u_17.getValue(p125)
	return p125._value
end
function v_u_17.getSize(p126)
	return p126._size
end
function v_u_17.update(p127)
	-- upvalues: (copy) v_u_14, (copy) v_u_13
	if p127._value == p127._tableInspector.highlightedValue then
		p127.backFrame.BorderColor3 = v_u_14
	else
		p127.backFrame.BorderColor3 = v_u_13
	end
	local v128 = p127._value
	local v129 = typeof(v128)
	if v129 == "table" then
		p127:setToTableForm()
		p127:renderTable()
		p127._upToDate = true
		return p127._size
	else
		if p127._upToDate then
			return p127._size
		end
		if v129 == "boolean" then
			p127:setToValueForm()
			p127:renderBoolean()
		elseif v129 == "number" then
			p127:setToValueForm()
			p127:renderNumber()
		elseif v129 == "string" then
			p127:setToValueForm()
			p127:renderString()
		elseif v129 == "function" then
			p127:setToValueForm()
			p127:renderFunction()
		else
			p127:setToValueForm()
			p127:renderAnything()
		end
		p127._upToDate = true
		return p127._size
	end
end
function v_u_17.setToValueForm(p130)
	if p130._form ~= "value" then
		p130._form = "value"
		p130.backFrame.BorderSizePixel = 0
		for _, v131 in p130._entries do
			v131:destroy()
		end
		table.clear(p130._entries)
	end
end
function v_u_17.setToTableForm(p132)
	if p132._form ~= "table" then
		p132._form = "table"
		p132.backFrame.BorderSizePixel = 1
	end
end
function v_u_17.remapEntries(p133)
	-- upvalues: (copy) v_u_18
	local v134 = p133._value
	local v135 = p133._entries
	local v136 = {}
	local v137 = {}
	for v138, v139 in v135 do
		if v134[v138] == nil then
			table.insert(v136, v139)
			v135[v138] = nil
		end
	end
	for v140, _ in v134 do
		if not v135[v140] then
			local v141 = table.remove(v136)
			if v141 then
				v135[v141:getIndex()] = nil
				v135[v140] = v141
				v141:setIndex(v140)
				v141:collapseIndex()
			else
				local v142 = v_u_18.new(p133._tableInspector, p133, v140)
				v142.backFrame.Parent = p133.dataFrame
				if not p133._isExpanded then
					v142.backFrame.Visible = false
				end
				v135[v140] = v142
			end
		end
	end
	for _, v143 in v136 do
		table.insert(v137, v143:getValueElement())
	end
	local v144 = {}
	for v145, v146 in v134 do
		local v147 = v135[v145]
		local v148 = v147:getValue()
		if v146 ~= v148 then
			if type(v148) == "table" then
				table.insert(v137, v147:getValueElement())
			end
			if type(v146) == "table" then
				v144[v146] = v147
			end
		end
	end
	for _, v149 in v137 do
		local v150 = v144[v149:getValue()]
		if v150 then
			v150:swapValueElement(v149.parent)
		end
	end
	for v151, v152 in v134 do
		v135[v151]:setValue(v152)
	end
	for _, v153 in v136 do
		v153:destroy()
	end
end
function v_u_17.renderBoolean(p154)
	-- upvalues: (copy) v_u_8
	p154:setText(p154._value and "true" or "false")
	p154.dataFrame.TextColor3 = v_u_8
end
function v_u_17.renderNumber(p155)
	-- upvalues: (copy) v_u_9
	local v156 = p155._value
	p155:setText((tostring(v156)))
	p155.dataFrame.TextColor3 = v_u_9
end
function v_u_17.renderString(p157)
	-- upvalues: (copy) v_u_10
	p157:setText(p157._value)
	p157.dataFrame.TextColor3 = v_u_10
end
function v_u_17.renderFunction(p158)
	-- upvalues: (copy) v_u_11
	if p158._isExpanded then
		local v159 = p158._value
		p158:setText((tostring(v159)))
	else
		p158:setText("f(x)")
	end
	p158.dataFrame.TextColor3 = v_u_11
end
function v_u_17.renderAnything(p160)
	-- upvalues: (copy) v_u_13
	local v161 = p160._value
	p160:setText((tostring(v161)))
	p160.dataFrame.TextColor3 = v_u_13
end
local v_u_162 = {
	["boolean"] = 1,
	["string"] = 2,
	["table"] = 3,
	["function"] = 4,
	["number"] = 5
}
local function v_u_167(p163, p164)
	-- upvalues: (copy) v_u_162
	if p163 == p164 then
		return 0
	end
	local v165 = type(p163)
	local v166 = type(p164)
	if v165 == v166 then
		if v165 ~= "string" and v165 ~= "number" then
			if v165 == "boolean" then
				p163 = p163 and 1 or 0
				p164 = p164 and 1 or 0
			else
				p163 = tostring(p163)
				p164 = tostring(p164)
			end
		end
	else
		p163 = v_u_162[v165]
		p164 = v_u_162[v166]
	end
	return p163 == p164 and 0 or (p163 < p164 and -1 or 1)
end
local function v_u_170(p168, p169)
	-- upvalues: (copy) v_u_167
	return v_u_167(p168, p169) < 0
end
function v_u_17.renderTable(p171)
	-- upvalues: (copy) v_u_19, (copy) v_u_3, (copy) v_u_5, (copy) v_u_1, (copy) v_u_13, (copy) v_u_2, (copy) v_u_170, (copy) v_u_7
	if p171._isExpanded then
		p171:remapEntries()
		local v172 = p171._entries
		if next(v172) == nil then
			local v173 = Vector2.new(14, 14) + 2 * v_u_1 + 2 * v_u_2
			local v174 = v173 + 2 * Vector2.one
			p171._scrollingEnabled = false
			p171._size = v174
			p171.dataFrame.Text = ""
			p171.dataFrame.Size = UDim2.fromOffset(v173.x, v173.y)
			p171.clipFrame.Size = UDim2.fromOffset(v173.x, v173.y)
			p171.backFrame.Size = UDim2.fromOffset(v174.x, v174.y)
		else
			local v175 = {}
			for v176 in next, v172 do
				table.insert(v175, v176)
			end
			table.sort(v175, v_u_170)
			local v177 = 0
			local v178 = 0
			for _, v179 in v175 do
				local v180 = v172[v179]
				local v181 = v180:update()
				v180.backFrame.Position = UDim2.fromOffset(0, v177)
				local v182 = v181.x
				v178 = math.max(v178, v182)
				v177 = v177 + v181.y + 1
			end
			for _, v183 in v172 do
				local v184 = v183:getSize()
				v183.backFrame.Size = UDim2.fromOffset(v178, v184.y)
			end
			local v185 = v177 - 1
			local v186 = Vector2.new(v178, v185)
			local v187 = Vector2.new
			local v188 = v186.x
			local v189 = v_u_7.x
			local v190 = math.min(v188, v189)
			local v191 = v186.y
			local v192 = v_u_7.y
			local v193 = v187(v190, (math.min(v191, v192)))
			local v194 = v193 + 2 * Vector2.one
			p171._scrollingEnabled = v186 ~= v193
			p171._lateralScrollEnabled = v186.y == v193.y
			p171.dataFrame.Text = ""
			p171.dataFrame.Size = UDim2.fromOffset(v186.x, v186.y)
			p171.clipFrame.Size = UDim2.fromOffset(v193.x, v193.y)
			p171.backFrame.Size = UDim2.fromOffset(v194.x, v194.y)
			p171._size = v194
		end
	else
		local v195 = p171._value
		local v196 = 0
		local v197 = 0
		while v195[v196 + 1] ~= nil do
			v196 = v196 + 1
		end
		for _ in v195 do
			v197 = v197 + 1
		end
		local v198 = ("%*k %*i"):format(v197 - v196, v196)
		if p171.dataFrame.Text ~= v198 then
			local v199 = v_u_19:GetTextSize(v198, 14, v_u_3, Vector2.zero)
			local v200 = Vector2.new
			local v201 = v199.x
			local v202 = v_u_5.x
			local v203 = math.min(v201, v202)
			local v204 = v199.y
			local v205 = v_u_5.y
			local v206 = v200(v203, (math.min(v204, v205)))
			local v207 = v206 + 2 * v_u_1
			p171._scrollingEnabled = false
			p171.dataFrame.Text = v198
			p171.dataFrame.TextColor3 = v_u_13
			p171.dataFrame.Size = UDim2.fromOffset(v199.x, v199.y)
			p171.clipFrame.Size = UDim2.fromOffset(v206.x, v206.y)
			p171.backFrame.Size = UDim2.fromOffset(v207.x, v207.y)
			p171._size = v207
		end
	end
end
function v_u_17.setText(p208, p209)
	-- upvalues: (copy) v_u_19, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_1
	local v210, v211
	if p208._isExpanded then
		v210 = v_u_19:GetTextSize(p209, 14, v_u_3, Vector2.zero)
		local v212 = Vector2.new
		local v213 = v210.x
		local v214 = v_u_6.x
		local v215 = math.min(v213, v214)
		local v216 = v210.y
		local v217 = v_u_6.y
		v211 = v212(v215, (math.min(v216, v217)))
		p208._scrollingEnabled = v210 ~= v211
		p208._lateralScrollEnabled = v210.y == v211.y
	else
		v210 = v_u_19:GetTextSize(p209, 14, v_u_3, Vector2.zero)
		local v218 = Vector2.new
		local v219 = v210.x
		local v220 = v_u_5.x
		local v221 = math.min(v219, v220)
		local v222 = v210.y
		local v223 = v_u_5.y
		v211 = v218(v221, (math.min(v222, v223)))
		p208._scrollingEnabled = false
	end
	local v224 = v211 + 2 * v_u_1
	p208.dataFrame.Text = p209
	p208.dataFrame.Size = UDim2.fromOffset(v210.x, v210.y)
	p208.clipFrame.Size = UDim2.fromOffset(v211.x, v211.y)
	p208.backFrame.Size = UDim2.fromOffset(v224.x, v224.y)
	p208._size = v224
end
function v_u_18.new(p225, p226, p227)
	-- upvalues: (copy) v_u_18, (copy) v_u_13, (copy) v_u_3, (copy) v_u_4, (copy) v_u_17
	local v228 = v_u_18
	local v229 = setmetatable({}, v228)
	v229._tableInspector = p225
	v229.parent = p226
	v229.backFrame = Instance.new("Frame")
	v229.backFrame.BorderSizePixel = 0
	v229.backFrame.BackgroundColor3 = Color3.fromRGB(96, 96, 96)
	v229.separatorFrame = Instance.new("TextLabel")
	v229.separatorFrame.BackgroundTransparency = 1
	v229.separatorFrame.TextColor3 = v_u_13
	v229.separatorFrame.Text = "="
	v229.separatorFrame.Font = v_u_3
	v229.separatorFrame.TextSize = 14
	v229.separatorFrame.Size = UDim2.fromOffset(v_u_4.x, v_u_4.y)
	v229.separatorFrame.Parent = v229.backFrame
	v229._indexElement = v_u_17.new(v229._tableInspector, v229, p227)
	v229._valueElement = v_u_17.new(v229._tableInspector, v229, nil)
	v229._indexElement.backFrame.Parent = v229.backFrame
	v229._valueElement.backFrame.Parent = v229.backFrame
	v229._size = Vector2.zero
	return v229
end
function v_u_18.destroy(p230)
	p230._indexElement:destroy()
	p230._valueElement:destroy()
	p230.backFrame:Destroy()
end
function v_u_18.getPath(p231, p232)
	if p231._indexElement == p232 then
		return { p232:getValue() }
	end
	if p231._valueElement == p232 then
		local v233 = p231.parent:getPath()
		local v234 = p231._indexElement
		table.insert(v233, v234:getValue())
		return v233
	end
	error("Element not found in Entry")
end
function v_u_18.setIndex(p235, p236)
	p235._indexElement:setValue(p236)
end
function v_u_18.setValue(p237, p238)
	p237._valueElement:setValue(p238)
end
function v_u_18.getIndex(p239, _)
	return p239._indexElement:getValue()
end
function v_u_18.getValue(p240, _)
	return p240._valueElement:getValue()
end
function v_u_18.getValueElement(p241)
	return p241._valueElement
end
function v_u_18.getIndexElement(p242)
	return p242._indexElement
end
function v_u_18.collapseIndex(p243)
	p243._indexElement:collapse()
end
function v_u_18.swapValueElement(p244, p245)
	local v246 = p245._valueElement
	local v247 = p244._valueElement
	p244._valueElement = v246
	p245._valueElement = v247
	p244._valueElement.parent = p244
	p245._valueElement.parent = p245
	p244._valueElement.backFrame.Parent = p244.backFrame
	p245._valueElement.backFrame.Parent = p245.backFrame
end
function v_u_18.pullOutElement(p248, p249)
	-- upvalues: (copy) v_u_17
	if p248._indexElement == p249 then
		p248._indexElement = v_u_17.new(p248._tableInspector, p248, p249:getValue())
		p248._indexElement.backFrame.Parent = p248.backFrame
		return
	elseif p248._valueElement == p249 then
		p248._valueElement = v_u_17.new(p248._tableInspector, p248, nil)
		p248._valueElement.backFrame.Parent = p248.backFrame
	else
		error("Element not found in entry")
	end
end
function v_u_18.update(p250)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v251 = p250._indexElement:update()
	local v252 = p250._valueElement:update()
	if p250._prevIndexSize == v251 and p250._prevValueSize == v252 then
		return p250._size
	end
	p250.prevIndexSize = v251
	p250.prevValueSize = v252
	local v253 = v_u_2.x
	local v254 = v_u_2.y
	local v255 = v253 + v251.x + v253 + v_u_4.x + v253 + v252.x + v253
	local v256 = v251.y
	local v257 = v_u_4.y
	local v258 = v252.y
	local v259 = v254 + math.max(v256, v257, v258) + v254
	p250._size = Vector2.new(v255, v259)
	local v260 = p250.separatorFrame
	local v261 = UDim2.fromOffset
	local v262 = v253 + v251.x + v253
	local v263 = v251.y
	local v264 = v252.y
	v260.Position = v261(v262, v254 + math.min(v263, v264) / 2 - v_u_4.y / 2)
	p250._indexElement.backFrame.Position = UDim2.fromOffset(v253, v254)
	p250._valueElement.backFrame.Position = UDim2.fromOffset(v253 + v251.x + v253 + v_u_4.x + v253, v254)
	return p250._size
end
function v_u_18.getSize(p265)
	return p265._size
end
return v_u_15