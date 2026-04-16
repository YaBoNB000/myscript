-- PaintPlayer (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("Players")
local v_u_3 = v_u_2.LocalPlayer
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.devv).load("Signal")
local v_u_6 = Instance.new("Highlight")
v_u_6.Name = "PaintHighlight"
v_u_6.Enabled = false
v_u_6.DepthMode = Enum.HighlightDepthMode.Occluded
v_u_6.OutlineTransparency = 1
v_u_6.FillTransparency = 1
v_u_6.FillColor = Color3.new(1, 1, 1)
local v_u_7 = {}
function v_u_1._loop()
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_1
	while true do
		for v8, _ in v_u_7 do
			local v9 = v_u_2:GetPlayerByUserId(v8)
			if v9 then
				v_u_1.SetPainted(v9)
			end
		end
		task.wait(1)
	end
end
function v_u_1.SetPainted(p10)
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_6
	local v11 = p10.Character
	local v12 = p10.UserId
	if v11 and v11.PrimaryPart then
		local v13 = p10:GetAttribute("paintAmount") or 0
		local v14 = p10:GetAttribute("paintColor") or Color3.new(1, 1, 1)
		local v15 = v_u_7[v12]
		if v15 and os.clock() - v15 >= 1 then
			local v16 = v13 - 0.1
			v13 = math.max(v16, 0)
			p10:SetAttribute("paintAmount", v13)
			v_u_7[v12] = os.clock()
		end
		if v13 > 0 and (p10 == v_u_3 or v_u_3:DistanceFromCharacter(v11.PrimaryPart.Position) < 200) then
			local v17 = v11:FindFirstChild("PaintHighlight")
			if not v17 then
				v17 = v_u_6:Clone()
				v17.Parent = v11
				v17.Enabled = true
			end
			v17.FillColor = v14
			v17.FillTransparency = 1 - v13 / 2
		else
			local v18 = v11:FindFirstChild("PaintHighlight")
			if v18 then
				v18:Destroy()
			end
			if v13 <= 0 then
				p10:SetAttribute("paintAmount", nil)
				p10:SetAttribute("paintColor", nil)
				v_u_7[v12] = nil
			end
		end
	else
		return
	end
end
function v_u_1._paint(p19, p20, p21)
	-- upvalues: (copy) v_u_7, (copy) v_u_1
	local v22 = p19:GetAttribute("paintColor") or Color3.new(1, 1, 1)
	p19:SetAttribute("paintAmount", p21)
	p19:SetAttribute("paintColor", v22:Lerp(p20, p21))
	v_u_7[p19.UserId] = os.clock()
	v_u_1.SetPainted(p19)
end
function v_u_1._paintHit(p23, p24)
	-- upvalues: (copy) v_u_1
	local v25 = (p23:GetAttribute("paintAmount") or 0) + 0.1
	local v26 = math.min(1, v25)
	v_u_1._paint(p23, p24, v26)
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_2, (copy) v_u_7
	task.defer(v_u_1._loop)
	v_u_5.LinkSignal("paintPlayer", v_u_1._paintHit)
	v_u_2.PlayerRemoving:Connect(function(p27)
		-- upvalues: (ref) v_u_7
		v_u_7[p27.UserId] = nil
	end)
end
return v_u_1