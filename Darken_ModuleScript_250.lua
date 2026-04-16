-- Darken (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load("Maid")
game:GetService("SoundService")
local v2 = game:GetService("Lighting")
local v_u_3 = Instance.new("ColorCorrectionEffect")
v_u_3.Name = "DarkenEffect"
v_u_3.Enabled = false
v_u_3.Parent = v2
local v_u_4 = game:GetService("TweenService")
local v_u_5 = nil
local v_u_6 = v1.new()
return function(p7)
	-- upvalues: (ref) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
	if v_u_5 then
		v_u_5:Pause()
	end
	if p7 then
		v_u_3.Enabled = true
		v_u_5 = v_u_4:Create(v_u_3, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			["Brightness"] = -0.15,
			["Saturation"] = -0.15,
			["TintColor"] = Color3.fromRGB(180, 180, 180)
		})
		v_u_6:GiveTask(v_u_5.Completed:Connect(function()
			-- upvalues: (ref) v_u_6
			v_u_6:DoCleaning()
		end))
		v_u_5:Play()
	elseif not p7 then
		v_u_5 = v_u_4:Create(v_u_3, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			["Brightness"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		})
		v_u_6:GiveTask(v_u_5.Completed:Connect(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_6
			v_u_3.Enabled = false
			v_u_6:DoCleaning()
		end))
		v_u_5:Play()
	end
end