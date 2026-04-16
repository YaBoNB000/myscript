-- ClientEconomy (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v6 = require(v_u_2.devv).load
local v_u_7 = v6("MoneyEffect")
local v_u_8 = v6("v3sound")
local v_u_9 = v6("Signal")
local v_u_10 = v6("Maid")
v_u_1.atmsInitialized = false
function v_u_1.MakeLocalCash(p_u_11, p_u_12, p13, p14, p_u_15)
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7, (copy) v_u_5
	local v_u_16 = v_u_2.Models.Entities.CashBundle.SmallCashBundle:Clone()
	local v17 = p14 or 120
	for _, v18 in v_u_16:GetDescendants() do
		if v18:IsA("BasePart") then
			v18.CanCollide = true
			v18.CanTouch = true
			v18.CanQuery = true
			v18.Anchored = false
		end
	end
	v_u_16:PivotTo(p_u_12 * CFrame.new(0, 0, -0.5))
	v_u_16.Parent = workspace.Game.Entities.CashBundle
	local v19 = Instance.new("ClickDetector")
	v19.MaxActivationDistance = 12
	v19.Parent = v_u_16
	local v20 = v_u_2.Guis.BillboardGuis.CashBillboard:Clone()
	v20.MoneyLabel.Text = "$" .. p13
	v20.Parent = v_u_16.PrimaryPart
	local v_u_21 = v_u_10.new()
	v_u_21:GiveTask(v_u_16)
	v_u_21:GiveTask(v19.MouseClick:Connect(function(p22)
		-- upvalues: (ref) v_u_5, (copy) v_u_16, (ref) v_u_9, (copy) p_u_11, (ref) v_u_7, (copy) v_u_21
		if p22 == v_u_5 then
			if v_u_16 then
				if not v_u_16.Parent then
					return
				end
				v_u_9.FireServer("takeLocalCash", p_u_11)
				v_u_7(v_u_16.PrimaryPart.CFrame.Position, 1)
				v_u_21:DoCleaning()
			end
		end
	end))
	v_u_21:GiveTask(v_u_16.PrimaryPart.Touched:Connect(function(p23)
		-- upvalues: (ref) v_u_5, (copy) v_u_16, (ref) v_u_9, (copy) p_u_11, (ref) v_u_7, (copy) v_u_21
		if p23:IsDescendantOf(v_u_5.Character) then
			if v_u_16 then
				if not v_u_16.Parent then
					return
				end
				v_u_9.FireServer("takeLocalCash", p_u_11)
				v_u_7(v_u_16.PrimaryPart.CFrame.Position, 1)
				v_u_21:DoCleaning()
			end
		end
	end))
	task.defer(function()
		-- upvalues: (ref) p_u_15, (copy) p_u_12, (copy) v_u_16
		p_u_15 = p_u_15 or p_u_12.LookVector.Unit * math.random(15, 20)
		v_u_16.PrimaryPart.AssemblyLinearVelocity = p_u_15
		v_u_16.PrimaryPart.AssemblyAngularVelocity = p_u_15
	end)
	local v_u_24 = nil
	v_u_24 = task.delay(v17, function()
		-- upvalues: (ref) v_u_24, (copy) v_u_21
		v_u_24 = nil
		v_u_21:DoCleaning()
	end)
	v_u_21:GiveTask(function()
		-- upvalues: (ref) v_u_24
		if v_u_24 then
			task.cancel(v_u_24)
		end
	end)
end
function v_u_1.MakeLocalATM(p_u_25, p26, p27, p28)
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_4, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9
	if p27 > 0 then
		local v_u_29 = v_u_2.Models.Other.ATM:Clone()
		v_u_29:PivotTo(p26)
		v_u_29:SetAttribute("health", p27)
		v_u_29:SetAttribute("isDestroyed", false)
		v_u_29:SetAttribute("atmId", p_u_25)
		v_u_29.Parent = workspace.ATMs
		for _, v30 in v_u_29:GetChildren() do
			if v30:IsA("BasePart") and v30.Color == Color3.fromRGB(91, 154, 76) then
				v30.Color = p28
			end
		end
		local v_u_31 = v_u_29:GetPivot()
		local v_u_32 = 0
		local v_u_33 = v_u_10.new()
		local function v_u_41()
			-- upvalues: (copy) v_u_29, (ref) v_u_3, (ref) v_u_8, (copy) v_u_33
			if v_u_29 then
				local v34 = v_u_29:FindFirstChild("Screen")
				local v35 = v_u_29:FindFirstChild("ThreeDTextObject")
				local v36 = v_u_29:FindFirstChild("Main")
				local v37
				if v36 then
					v37 = v36:FindFirstChild("Attachment")
				else
					v37 = v36
				end
				if v34 and (v35 and (v36 and v37)) then
					v_u_3:Create(v_u_29.Screen, TweenInfo.new(0.1), {
						["Color"] = Color3.new(1, 0, 0)
					}):Play()
					for _, v38 in v35:GetChildren() do
						v_u_3:Create(v38, TweenInfo.new(0.1), {
							["Color"] = math.random() > 0.5 and Color3.new(0, 0, 0) or Color3.fromRGB(27, 58, 18)
						}):Play()
					end
					local v39 = v_u_8.newSound("printer")
					v39:attachToPart(v_u_29.PrimaryPart)
					v39.playbackSpeed = 0.8
					v39.vol = 1.2
					v39:play()
					for _, v40 in v37:GetChildren() do
						if v40:IsA("ParticleEmitter") then
							v40.Enabled = true
						end
					end
					v37.Specks:Emit()
					if v_u_29.PrimaryPart then
						v_u_29.PrimaryPart.Anchored = false
					end
					task.delay(20, function()
						-- upvalues: (ref) v_u_33
						v_u_33:DoCleaning()
					end)
				end
			else
				return
			end
		end
		v_u_33:GiveTask(v_u_29:GetAttributeChangedSignal("health"):Connect(function()
			-- upvalues: (copy) v_u_29, (copy) v_u_41, (ref) v_u_9, (copy) p_u_25, (ref) v_u_32, (ref) v_u_4, (copy) v_u_31, (copy) v_u_33
			if v_u_29:GetAttribute("isDestroyed") then
				return
			else
				local v42 = v_u_29:GetAttribute("health")
				if v42 <= 0 then
					v_u_29:SetAttribute("isDestroyed", true)
					v_u_41()
					v_u_9.FireServer("setATMHealth", p_u_25, v42)
				else
					v_u_9.FireServer("setATMHealth", p_u_25, v42)
					if os.clock() - v_u_32 > 0.4 then
						v_u_32 = os.clock()
						local v_u_43 = nil
						v_u_43 = v_u_4.Heartbeat:Connect(function()
							-- upvalues: (ref) v_u_29, (ref) v_u_43, (ref) v_u_32, (ref) v_u_31
							if not (v_u_29 and (v_u_29.PrimaryPart and v_u_29.PrimaryPart.Anchored)) then
								v_u_43:Disconnect()
							end
							if os.clock() - v_u_32 > 0.4 then
								v_u_43:Disconnect()
								v_u_29:PivotTo(v_u_31)
							else
								local v44 = 1 - (os.clock() - v_u_32) / 0.4
								local v45 = os.clock() * 10
								local v46 = math.sin(v45) * 0.35 * v44
								v_u_29:PivotTo(v_u_31 * CFrame.new(v46, 0, v46))
							end
						end)
						v_u_33:GiveTask(v_u_43)
					end
				end
			end
		end))
		v_u_33:GiveTask(v_u_29)
		return v_u_29
	end
end
local v_u_47 = {
	{
		["spawnChance"] = 1,
		["dropChance"] = 0.6,
		["color"] = Color3.fromRGB(91, 154, 76),
		["amount"] = NumberRange.new(15, 30)
	},
	{
		["spawnChance"] = 0.25,
		["dropChance"] = 0.6,
		["color"] = Color3.fromRGB(13, 105, 172),
		["amount"] = NumberRange.new(25, 40)
	},
	{
		["spawnChance"] = 0.1,
		["dropChance"] = 0.5,
		["color"] = Color3.fromRGB(89, 34, 89),
		["amount"] = NumberRange.new(35, 50)
	},
	{
		["spawnChance"] = 0.03,
		["dropChance"] = 0.5,
		["color"] = Color3.fromRGB(255, 163, 5),
		["amount"] = NumberRange.new(50, 150)
	},
	{
		["spawnChance"] = 0.01,
		["dropChance"] = 0.5,
		["color"] = Color3.fromRGB(117, 18, 18),
		["amount"] = NumberRange.new(150, 300)
	}
}
function v_u_1.RespawnATMs(p48)
	-- upvalues: (copy) v_u_47, (copy) v_u_1
	for v49, v50 in p48 do
		if v50.isDestroyed then
			return
		end
		local v51 = v_u_47[v50.variation or 1].color
		local v52 = v50.cframe
		local v53 = v50.health
		v_u_1.MakeLocalATM(v49, v52, v53, v51)
	end
end
function v_u_1.InitATMs()
	-- upvalues: (copy) v_u_9, (copy) v_u_1
	while true do
		local v54 = v_u_9.InvokeServer("getATMData")
		if v54 then
			break
		end
		task.wait(5)
	end
	v_u_1.atmsInitialized = true
	v_u_1.RespawnATMs(v54)
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	task.spawn(v_u_1.InitATMs)
	v_u_9.LinkSignal("respawnATMs", v_u_1.RespawnATMs)
	v_u_9.LinkSignal("spawnLocalCash", v_u_1.MakeLocalCash)
end
return v_u_1