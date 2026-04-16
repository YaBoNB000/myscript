-- Blur (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load("Maid")
local v_u_2 = game:GetService("SoundService")
local v3 = game:GetService("Lighting")
local v_u_4 = Instance.new("BlurEffect")
v_u_4.Name = "Blur"
v_u_4.Enabled = false
v_u_4.Size = 0
v_u_4.Parent = v3
local v_u_5 = game:GetService("TweenService")
local v_u_6 = nil
local v_u_7 = v1.new()
return function(p8)
	-- upvalues: (ref) v_u_6, (copy) v_u_4, (copy) v_u_2, (copy) v_u_5, (copy) v_u_7
	if v_u_6 then
		v_u_6:Pause()
	end
	if p8 then
		v_u_4.Enabled = true
		v_u_2.AmbientReverb = Enum.ReverbType.UnderWater
		v_u_6 = v_u_5:Create(v_u_4, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			["Size"] = 16
		})
		v_u_7:GiveTask(v_u_6.Completed:Connect(function()
			-- upvalues: (ref) v_u_7
			v_u_7:DoCleaning()
		end))
		v_u_6:Play()
	elseif not p8 then
		v_u_2.AmbientReverb = Enum.ReverbType.NoReverb
		v_u_6 = v_u_5:Create(v_u_4, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			["Size"] = 0
		})
		v_u_7:GiveTask(v_u_6.Completed:Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_7
			v_u_4.Enabled = false
			v_u_7:DoCleaning()
		end))
		v_u_6:Play()
	end
end