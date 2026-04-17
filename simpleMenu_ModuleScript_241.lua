-- simpleMenu (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v2 = v1("object")
local v_u_3 = v1("makeButton")
local v4 = v2()
local v_u_5 = game:GetService("ReplicatedStorage").Guis.Buttons.simpleMenuButton
function v4._makeSimpleButton(p6, p7, p8, p9)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v10 = v_u_5:Clone()
	v10.Parent = p6.UIObject.Buttons
	local v11 = v_u_3({
		["UIObject"] = v10,
		["super"] = "simpleMenuButton",
		["activatedFunc"] = p8,
		["mouseOverFunc"] = p9
	})
	v11:SetText(p7)
	v11:Init()
	return v11
end
function v4.Clear(p12)
	for _, v13 in pairs(p12.buttons) do
		v13.UIObject:Destroy()
		v13.UIObject = nil
		v13:clean()
	end
	p12.buttons = {}
end
function v4.render(p_u_14)
	p_u_14:Clear()
	local v15 = p_u_14.tree
	if v15.init then
		v15.init()
	end
	local v16 = v15.back ~= nil
	local v17 = #v15 + (v15.back == nil and 0 or 1)
	local v18 = math.min(8, v17)
	local v19 = {}
	for v20, v_u_21 in ipairs(v15) do
		local v22 = v_u_21.mouseOverFunc
		local v23 = p_u_14:_makeSimpleButton(v_u_21.text, function()
			-- upvalues: (copy) v_u_21, (copy) p_u_14
			if v_u_21.activatedFunc then
				v_u_21.activatedFunc()
			end
			p_u_14:Next(v_u_21.next)
		end, v22)
		v23.UIObject.Size = UDim2.new(1, 0, 1 / v18, 0)
		v23.LayoutOrder = v20
		table.insert(v19, v23)
	end
	if v16 then
		local v24 = p_u_14:_makeSimpleButton("Back", function()
			-- upvalues: (copy) p_u_14
			p_u_14:back()
		end)
		v24.UIObject.Size = UDim2.new(1, 0, 1 / v18, 0)
		table.insert(v19, v24)
		v24.LayoutOrder = #v19
	end
	p_u_14.UIObject.Size = UDim2.new(0.4, 0, v18 * 0.05, 0)
	if p_u_14.UIObject:FindFirstChild("Shadow") then
		p_u_14.UIObject.Shadow.Value.Size = p_u_14.UIObject.Size
	end
	p_u_14.UIObject.Buttons.ScrollingEnabled = v17 > 8
	p_u_14.UIObject.Buttons.CanvasSize = UDim2.new(0, 0, 1, 0)
	if v17 > 8 then
		p_u_14.UIObject.Buttons.CanvasSize = UDim2.new(0, 0, 1 + 0.125 * (v17 - 8), 0)
		for _, v25 in ipairs(v19) do
			v25.UIObject.Size = UDim2.new(1, 0, 1 / v17, 0)
		end
	end
	p_u_14.buttons = v19
end
function v4.Next(p26, p27)
	if p27 and p26.trees[p27] then
		p26.tree = p26.trees[p27]
		p26.treeName = p27
		p26:render()
	end
end
function v4.back(p28)
	local v29 = p28.tree.back
	if v29 and p28.trees[v29] then
		p28.tree = p28.trees[v29]
		p28.treeName = v29
		p28:render()
	end
end
function v4.Init(p30, p31, p32, p33)
	p30.UIObject = p31
	p30.trees = p32
	p30.tree = p32[p33]
	p30.treeName = p33
	p30.buttons = {}
	p30:render()
end
return v4