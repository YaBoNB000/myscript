-- DamageIndicator (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer.PlayerGui
local v_u_6 = workspace.CurrentCamera
local v7 = require(v_u_2.devv).load
local v_u_8 = v7("GUILoader")
local v_u_9 = v7("Signal")
local v_u_10 = nil
local v_u_11 = Vector3.new(0, 0, 0)
local v_u_12 = 0
local v_u_13 = TweenInfo.new(0.3, Enum.EasingStyle.Sine)
local function v_u_23()
	-- upvalues: (copy) v_u_6, (ref) v_u_11
	local v14 = v_u_6.CFrame.Position * Vector3.new(1, 0, 1)
	local v15 = v_u_11 * Vector3.new(1, 0, 1)
	local v16 = (v_u_6.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
	local v17 = (v14 - v15).Unit
	if v17 == Vector3.new(0, 0, 0) then
		v17 = v16
	end
	local v18 = v16:Dot(v17)
	local v19 = math.acos(v18)
	local v20 = math.deg(v19)
	local v21 = v16:Cross(v17).Y
	local v22 = math.asin(v21)
	if math.deg(v22) >= 0 then
		v20 = 360 - v20
	end
	return v20 + 180
end
function v_u_1.Show(p24, p25)
	-- upvalues: (ref) v_u_12, (ref) v_u_11, (copy) v_u_3, (ref) v_u_10, (copy) v_u_13
	v_u_12 = v_u_12 + 1
	v_u_11 = p24
	v_u_3:Create(v_u_10.Frame.ImageLabel, v_u_13, {
		["ImageTransparency"] = 0
	}):Play()
	local v_u_26 = v_u_12
	task.delay(p25 or 2, function()
		-- upvalues: (copy) v_u_26, (ref) v_u_12, (ref) v_u_3, (ref) v_u_10, (ref) v_u_13
		if v_u_26 == v_u_12 then
			v_u_3:Create(v_u_10.Frame.ImageLabel, v_u_13, {
				["ImageTransparency"] = 1
			}):Play()
		end
	end)
end
function v_u_1.Flash()
	-- upvalues: (copy) v_u_3, (ref) v_u_10
	v_u_3:Create(v_u_10.Damaged, TweenInfo.new(0.325, Enum.EasingStyle.Exponential), {
		["BackgroundTransparency"] = 0.25
	}):Play()
	task.delay(0.1, function()
		-- upvalues: (ref) v_u_3, (ref) v_u_10
		v_u_3:Create(v_u_10.Damaged, TweenInfo.new(0.325, Enum.EasingStyle.Exponential), {
			["BackgroundTransparency"] = 1
		}):Play()
	end)
end
function v_u_1.Initialize()
	-- upvalues: (ref) v_u_10, (copy) v_u_8, (copy) v_u_2, (copy) v_u_5, (copy) v_u_9, (copy) v_u_1, (copy) v_u_4, (ref) v_u_11, (copy) v_u_23
	v_u_10 = v_u_8.Load(v_u_2.Guis.ScreenGuis.DamageIndicator, "DamageIndicator")
	v_u_10.Parent = v_u_5
	v_u_9.LinkSignal("playerHit", function(p27, p28)
		-- upvalues: (ref) v_u_1
		if p27 then
			v_u_1.Show(p27)
		end
		if p28 then
			v_u_1.Flash()
		end
	end)
	v_u_4.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (ref) v_u_23
		if v_u_11.Magnitude > 0 then
			v_u_10.Frame.Rotation = v_u_23()
		end
	end)
end
return v_u_1