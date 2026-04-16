-- nextBotEffects (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v_u_3 = v2("CameraShakeHandler")
local v_u_4 = v2("FOVController")
local v_u_5 = v2("v3sound")
game:GetService("SoundService")
game:GetService("TweenService")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("Lighting"):FindFirstChild("nextBotColorCorrection")
v_u_7.Enabled = false
local v_u_8 = game:GetService("Players").LocalPlayer
local v_u_9 = {}
local v_u_10 = nil
function v_u_9._doShake(p11)
	-- upvalues: (copy) v_u_3
	local v12 = v_u_3.Get()
	local v13 = {
		1.5,
		15,
		0.04,
		0.08,
		0.5,
		3
	}
	for v14, v15 in pairs(v13) do
		v13[v14] = v15 * p11
	end
	v12:ShakeOnce(unpack(v13))
end
local function v_u_21()
	-- upvalues: (copy) v_u_8
	if v_u_8.Character and v_u_8.Character.PrimaryPart then
		local v16 = nil
		local v17 = nil
		for _, v18 in ipairs(workspace.NextBots:GetChildren()) do
			local v19
			if v18 then
				v19 = v18:FindFirstChild("HumanoidRootPart")
			else
				v19 = v18
			end
			if v19 then
				local v20 = v_u_8:DistanceFromCharacter(v19.Position)
				if v20 <= 40 then
					if v16 then
						if v20 < v17 then
							v17 = v20
							v16 = v18
						end
					else
						v17 = v20
						v16 = v18
					end
				end
			end
		end
		return v16, v17
	end
end
local v_u_22 = false
function v_u_9._step()
	-- upvalues: (ref) v_u_10, (copy) v_u_7, (ref) v_u_22, (copy) v_u_4, (copy) v_u_21, (copy) v_u_9
	local function v24(p23)
		-- upvalues: (ref) v_u_7
		v_u_7.Brightness = -0.05 * p23
		v_u_7.Contrast = 0.25 * p23
		v_u_7.Saturation = -0.25 * p23
		v_u_7.TintColor = Color3.new(1, 1, 1):lerp(Color3.new(1, 0.4, 0.4), p23)
		v_u_7.Enabled = true
	end
	if workspace.NextBots:GetChildren() == 0 then
		v_u_10.Volume = 0
		v_u_10:Stop()
		v_u_7.Enabled = false
		if v_u_22 then
			v_u_22 = false
			v_u_4.removeConstraint("nextbot")
		end
	else
		local v25, v26 = v_u_21()
		if v25 then
			local v27 = 1 - v26 / 40
			v_u_10.Volume = v27 * 0.033
			v24(v27)
			if v_u_22 or v27 <= 0.5 then
				if v_u_22 and v27 <= 0.5 then
					v_u_22 = false
					v_u_4.removeConstraint("nextbot")
				end
			else
				v_u_22 = true
				v_u_4.addConstraint("nextbot", 50, 0.05, true, 2)
			end
			if not v_u_10.IsPlaying then
				v_u_10:Play()
			end
			if v27 > 0.3 then
				v_u_9._doShake(v27)
				return
			end
		else
			v_u_10.Volume = 0
			v_u_10:Stop()
			v_u_7.Enabled = false
			if v_u_22 then
				v_u_22 = false
				v_u_4.removeConstraint("nextbot")
			end
		end
	end
end
function v_u_9.Initialize()
	-- upvalues: (ref) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_9
	task.defer(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_5, (ref) v_u_6, (ref) v_u_9
		v_u_10 = v_u_5.newLocalSound("nextBotChase")
		v_u_6.Heartbeat:Connect(v_u_9._step)
	end)
end
return v_u_9