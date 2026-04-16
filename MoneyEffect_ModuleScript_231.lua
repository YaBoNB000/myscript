-- MoneyEffect (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v_u_1.devv).load
local v_u_6 = Random.new()
local function v_u_16(p7, p8, p9, p10, p11)
	local v12 = p7 + (p8 - p7) * p11
	local v13 = p8 + (p9 - p8) * p11
	local v14 = p9 + (p10 - p9) * p11
	local v15 = v12 + (v13 - v12) * p11
	return v15 + (v13 + (v14 - v13) * p11 - v15) * p11
end
local function v_u_48(p_u_17, p18, p19)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_16
	local v_u_20 = v_u_4.Character
	if v_u_20 then
		v_u_20 = v_u_20:FindFirstChild("HumanoidRootPart")
	end
	if v_u_20 then
		local v_u_21 = p19 or "Cash"
		for v22 = 1, p18 or 18 + v_u_6:NextInteger(-1, 2) do
			task.spawn(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_1, (copy) v_u_21, (copy) p_u_17, (ref) v_u_2, (ref) v_u_3, (copy) v_u_20, (ref) v_u_16
				local v23 = 6.283185307179586 * v_u_6:NextNumber()
				local v24 = math.cos(v23)
				local v25 = math.sin(v23)
				local v26 = 12 + (v_u_6:NextNumber() * 2 - 1)
				local v27 = 4 + (v_u_6:NextNumber() * 2 - 1)
				local v28 = 9 + (v_u_6:NextNumber() * 2 - 1) * 1.5
				local v29 = v24 * v26
				local v30 = -v28 * 0.5
				local v31 = v25 * v26
				local v_u_32 = Vector3.new(v29, v30, v31)
				local v33 = v24 * v27
				local v34 = v28 * 1.2
				local v35 = v25 * v27
				local v_u_36 = Vector3.new(v33, v34, v35)
				local v_u_37 = v_u_1.Models.Other[v_u_21]:Clone()
				v_u_37.CanCollide = false
				v_u_37:PivotTo(CFrame.new(p_u_17))
				v_u_37.Parent = workspace
				local v_u_38 = 6.283185307179586 * v_u_6:NextNumber()
				local v_u_39 = 6.283185307179586 * v_u_6:NextNumber()
				local v_u_40 = 6.283185307179586 * v_u_6:NextNumber()
				local v_u_41 = 0
				local v_u_42 = nil
				task.delay(0.5, function()
					-- upvalues: (ref) v_u_2, (copy) v_u_37
					v_u_2:Create(v_u_37, TweenInfo.new(1, Enum.EasingStyle.Quad), {
						["Size"] = v_u_37.Size * 0.5
					}):Play()
				end)
				v_u_42 = v_u_3.Heartbeat:Connect(function(p43)
					-- upvalues: (ref) v_u_41, (ref) v_u_42, (copy) v_u_37, (ref) p_u_17, (copy) v_u_32, (copy) v_u_36, (ref) v_u_20, (ref) v_u_38, (ref) v_u_39, (ref) v_u_40, (ref) v_u_16
					v_u_41 = v_u_41 + p43 * 0.8
					if v_u_41 >= 1 then
						v_u_42:Disconnect()
						v_u_42 = nil
						v_u_37:Destroy()
					end
					local v44 = p_u_17
					local v45 = p_u_17 + v_u_32
					local v46 = p_u_17 + v_u_36
					local v47 = v_u_20.Position
					v_u_38 = v_u_38 + 0.008726646259971648
					v_u_39 = v_u_39 + 0.008726646259971648
					v_u_40 = v_u_40 + 0.008726646259971648
					v_u_37:PivotTo(CFrame.new((v_u_16(v44, v45, v46, v47, v_u_41))) * CFrame.Angles(v_u_38, v_u_39, v_u_40))
				end)
			end)
			if v22 > 1 and v22 % 2 == 0 then
				task.wait(0.07)
			end
		end
	end
end
task.defer(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_48
	v_u_5("Signal").LinkSignal("grabMoneyEffect", v_u_48)
end)
return v_u_48