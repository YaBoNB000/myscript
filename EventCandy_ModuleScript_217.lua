-- EventCandy (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Halloween
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v4 = require(v_u_2.devv).load
local v_u_5 = v4("MoneyEffect")
local v_u_6 = v4("commavalue")
v4("makeToast")
local v_u_7 = v4("v3sound")
local v_u_8 = v4("Signal")
local v_u_9 = v4("Maid")
local function v_u_27(p10, p_u_11, p12, p_u_13)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3
	local v_u_14 = v_u_2.Models.Other.Candy:Clone()
	for _, v15 in v_u_14:GetDescendants() do
		if v15:IsA("BasePart") then
			v15.CanCollide = true
			v15.CanTouch = true
			v15.CanQuery = true
			v15.Anchored = false
		end
	end
	v_u_14:PivotTo(p10)
	v_u_14.Parent = workspace.Game.Entities.CashBundle
	local v_u_16 = Instance.new("ClickDetector")
	v_u_16.MaxActivationDistance = 12
	v_u_16.Parent = v_u_14
	local v17 = v_u_2.Guis.BillboardGuis.CashBillboard:Clone()
	v17.MoneyLabel.Text = string.format("\240\159\141\172 %s", v_u_6(p_u_11))
	v17.MoneyLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
	v17.MoneyLabel.UIGradient:Destroy()
	v17.Parent = v_u_14
	local v_u_18 = v_u_9.new()
	local function v_u_20()
		-- upvalues: (copy) v_u_14, (ref) v_u_8, (copy) p_u_11, (ref) v_u_5, (ref) v_u_7, (ref) v_u_18
		if v_u_14 and v_u_14.Parent then
			v_u_8.FireServer("collectCandy", p_u_11)
			v_u_5(v_u_14.CFrame.Position, 1, "Candy")
			local v19 = v_u_7.newSound("candyCollect")
			v19:attachToPart(v_u_14)
			v19:play()
			v_u_18:DoCleaning()
			v_u_18 = nil
			v_u_14:Destroy()
		end
	end
	if p12 == nil then
		task.defer(function()
			-- upvalues: (ref) p_u_13, (copy) v_u_14
			p_u_13 = p_u_13 or 1
			local v21 = math.random(-22, 22)
			local v22 = math.random(10, 25)
			local v23 = math.random
			local v24 = Vector3.new(v21, v22, v23(-22, 22)) * p_u_13
			v_u_14.AssemblyLinearVelocity = v24
			v_u_14.AssemblyAngularVelocity = v24
		end)
	end
	task.delay(1, function()
		-- upvalues: (ref) v_u_18, (copy) v_u_16, (ref) v_u_3, (copy) v_u_20, (copy) v_u_14
		v_u_18:GiveTask(v_u_16.MouseClick:Connect(function(p25)
			-- upvalues: (ref) v_u_3, (ref) v_u_20
			if p25 == v_u_3 then
				v_u_20()
			end
		end))
		v_u_18:GiveTask(v_u_14.Touched:Connect(function(p26)
			-- upvalues: (ref) v_u_3, (ref) v_u_20
			if p26:IsDescendantOf(v_u_3.Character) then
				v_u_20()
			end
		end))
	end)
end
function v1.Spawn(p28, p29, p30, p31)
	-- upvalues: (copy) v_u_27
	for _ = 1, math.max(1, p28 or 1) do
		v_u_27(p29, p30, nil, p31)
	end
end
function v1.SpawnSingle(p32, p33)
	-- upvalues: (copy) v_u_27
	v_u_27(p32, math.max(1, p33 or 1), Vector3.new(0, 0, 0))
end
return v1