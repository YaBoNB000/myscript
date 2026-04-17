-- TimeHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Lighting")
local _ = game:GetService("Players").LocalPlayer
local v5 = require(v1.devv).load
local v6 = v5("Bindable")
v5("v3sound")
v5("Signal")
local v_u_7 = v5("tod")
local v_u_8 = require(script.config)
local v_u_9 = {
	["onTimeChanged"] = v6.new()
}
local v_u_10 = nil
local v_u_11 = {}
function v_u_9.GetCurrentTime()
	-- upvalues: (ref) v_u_10
	return v_u_10
end
function v_u_9.Tween(p12)
	-- upvalues: (ref) v_u_10, (copy) v_u_9, (copy) v_u_8, (copy) v_u_11, (copy) v_u_2, (copy) v_u_4
	if v_u_10 ~= p12 then
		v_u_10 = p12
		v_u_9.onTimeChanged:Fire(v_u_10)
		local v_u_13 = v_u_8.default
		local v_u_14 = v_u_8[v_u_10]
		for _, v15 in ipairs(v_u_11) do
			v15:Cancel()
		end
		if v_u_14 then
			local function v19(p16)
				-- upvalues: (copy) v_u_13, (copy) v_u_14
				local v17 = table.clone(v_u_13[p16])
				for v18, _ in pairs(v17) do
					if v_u_14[p16] and v_u_14[p16][v18] then
						v17[v18] = v_u_14[p16][v18]
					end
				end
				return v17
			end
			local v20 = TweenInfo.new(1)
			local v21 = v_u_4
			local v22 = v_u_2:Create(v21, v20, (v19(v21.Name)))
			local v23 = v_u_11
			table.insert(v23, v22)
			v22:Play()
			local v24 = v_u_4.Atmosphere
			local v25 = v_u_2:Create(v24, v20, (v19(v24.Name)))
			local v26 = v_u_11
			table.insert(v26, v25)
			v25:Play()
			local v27 = v_u_4.ColorCorrection
			local v28 = v_u_2:Create(v27, v20, (v19(v27.Name)))
			local v29 = v_u_11
			table.insert(v29, v28)
			v28:Play()
			local v30 = v_u_4.SunRays
			local v31 = v_u_2:Create(v30, v20, (v19(v30.Name)))
			local v32 = v_u_11
			table.insert(v32, v31)
			v31:Play()
			local v33 = v_u_4.Bloom
			local v34 = v_u_2:Create(v33, v20, (v19(v33.Name)))
			local v35 = v_u_11
			table.insert(v35, v34)
			v34:Play()
			local v36 = workspace.Terrain.Clouds
			local v37 = v_u_2:Create(v36, v20, (v19(v36.Name)))
			local v38 = v_u_11
			table.insert(v38, v37)
			v37:Play()
			v_u_4.ClockTime = v_u_14.ClockTime or v_u_13.ClockTime
			v_u_4.Sky.MoonTextureId = v_u_14.MoonTextureId or v_u_13.MoonTextureId
		end
	end
end
function v_u_9.Reset()
	-- upvalues: (ref) v_u_10
	v_u_10 = nil
end
local v_u_39 = os.clock()
function v_u_9._step()
	-- upvalues: (ref) v_u_39, (ref) v_u_10, (copy) v_u_7, (copy) v_u_9
	if os.clock() - v_u_39 < 1 then
		return
	elseif v_u_10 ~= "sewer" then
		v_u_39 = os.clock()
		local v40 = v_u_7.SERVER_MINUTE()
		local v41 = math.floor(v40)
		local v42 = v_u_7.TIME_DESCRIPTION(v41)
		local v43 = workspace.Game:GetAttribute("currentEvent") == "nextBotEvent" and "nextBotEvent" or v42
		v_u_9.Tween(v43)
	end
end
function v_u_9.Initialize()
	-- upvalues: (copy) v_u_3, (copy) v_u_9
	v_u_3.Heartbeat:Connect(v_u_9._step)
end
return v_u_9