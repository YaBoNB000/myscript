-- tintScreen (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v2 = v1("Signal")
local v3 = v1("Maid")
local v4 = game:GetService("Lighting")
local v_u_5 = Instance.new("ColorCorrectionEffect")
v_u_5.Name = "Tint"
v_u_5.Enabled = false
v_u_5.TintColor = Color3.new(1, 1, 1)
v_u_5.Parent = v4
local v_u_6 = game:GetService("TweenService")
local v_u_7 = false
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = v3.new()
local function v_u_14(p11, p12, p13)
	-- upvalues: (ref) v_u_7, (copy) v_u_5, (ref) v_u_9, (copy) v_u_6, (copy) v_u_10
	v_u_7 = true
	v_u_5.TintColor = p11
	v_u_5.Enabled = true
	task.wait(p12)
	v_u_9 = v_u_6:Create(v_u_5, TweenInfo.new(p13), {
		["TintColor"] = Color3.new(1, 1, 1)
	})
	v_u_10:GiveTask(v_u_9.Completed:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_5, (ref) v_u_10
		v_u_7 = false
		v_u_5.Enabled = false
		v_u_10:DoCleaning()
	end))
	v_u_9:Play()
end
local function v15(...)
	-- upvalues: (ref) v_u_7, (ref) v_u_8, (copy) v_u_10, (ref) v_u_9, (copy) v_u_14
	if v_u_7 and v_u_8 then
		task.cancel(v_u_8)
	end
	v_u_10:DoCleaning()
	if v_u_9 then
		v_u_9:Pause()
	end
	v_u_8 = task.spawn(v_u_14, ...)
end
v2.LinkSignal("tintScreen", v15)
return v15