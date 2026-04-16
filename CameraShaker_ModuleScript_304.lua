-- CameraShaker (ModuleScript)
-- ReplicatedStorage > devv > vendor
-- Original

local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = debug.profilebegin
local v_u_3 = debug.profileend
local v4 = Vector3.new
local v_u_5 = CFrame.new
local v_u_6 = CFrame.Angles
local v_u_7 = math.rad
local v_u_8 = v4()
local v_u_9 = 0
local v_u_10 = require(script.CameraShakeInstance)
local v_u_11 = v_u_10.CameraShakeState
v_u_1.CameraShakeInstance = v_u_10
v_u_1.Presets = require(script.CameraShakePresets)
function v_u_1.new(p12, p13)
	-- upvalues: (copy) v_u_8, (copy) v_u_1
	local v14 = type(p12) == "number"
	assert(v14, "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)")
	local v15 = type(p13) == "function"
	assert(v15, "Callback must be a function")
	local v16 = {
		["_running"] = false,
		["_renderName"] = "CameraShaker",
		["_renderPriority"] = p12,
		["_posAddShake"] = v_u_8,
		["_rotAddShake"] = v_u_8,
		["_camShakeInstances"] = {},
		["_removeInstances"] = {},
		["_callback"] = p13
	}
	local v17 = v_u_1
	return setmetatable(v16, v17)
end
function v_u_1.Start(p_u_18)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if not p_u_18._running then
		p_u_18._running = true
		local v_u_19 = p_u_18._callback
		game:GetService("RunService"):BindToRenderStep(p_u_18._renderName, p_u_18._renderPriority, function(p20)
			-- upvalues: (ref) v_u_2, (copy) p_u_18, (ref) v_u_3, (copy) v_u_19
			v_u_2("CameraShakerUpdate")
			local v21 = p_u_18:Update(p20)
			v_u_3()
			v_u_19(v21)
		end)
	end
end
function v_u_1.Stop(p22)
	if p22._running then
		game:GetService("RunService"):UnbindFromRenderStep(p22._renderName)
		p22._running = false
	end
end
function v_u_1.StopSustained(p23, p24)
	for _, v25 in pairs(p23._camShakeInstances) do
		if v25.fadeOutDuration == 0 then
			v25:StartFadeOut(p24 or v25.fadeInDuration)
		end
	end
end
function v_u_1.Update(p26, p27)
	-- upvalues: (copy) v_u_8, (copy) v_u_11, (ref) v_u_9, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v28 = v_u_8
	local v29 = v_u_8
	local v30 = p26._camShakeInstances
	for v31 = 1, #v30 do
		local v32 = v30[v31]
		local v33 = v32:GetState()
		if v33 == v_u_11.Inactive and v32.DeleteOnInactive then
			p26._removeInstances[#p26._removeInstances + 1] = v31
		elseif v33 ~= v_u_11.Inactive then
			local v34 = v32:UpdateShake(p27)
			v28 = v28 + v34 * v32.PositionInfluence
			v29 = v29 + v34 * v32.RotationInfluence
		end
	end
	for v35 = #p26._removeInstances, 1, -1 do
		local v36 = p26._removeInstances[v35]
		table.remove(v30, v36)
		local v37 = v_u_9 - 1
		v_u_9 = math.max(v37, 0)
		p26._removeInstances[v35] = nil
	end
	return v_u_5(v28) * v_u_6(0, v_u_7(v29.Y), 0) * v_u_6(v_u_7(v29.X), 0, (v_u_7(v29.Z)))
end
function v_u_1.Shake(p38, p39)
	local v40
	if type(p39) == "table" then
		v40 = p39._camShakeInstance
	else
		v40 = false
	end
	assert(v40, "ShakeInstance must be of type CameraShakeInstance")
	p38._camShakeInstances[#p38._camShakeInstances + 1] = p39
	return p39
end
function v_u_1.ShakeSustain(p41, p42)
	local v43
	if type(p42) == "table" then
		v43 = p42._camShakeInstance
	else
		v43 = false
	end
	assert(v43, "ShakeInstance must be of type CameraShakeInstance")
	p41._camShakeInstances[#p41._camShakeInstances + 1] = p42
	p42:StartFadeIn(p42.fadeInDuration)
	return p42
end
function v_u_1.ShakeOnce(p44, p45, p46, p47, p48, p49, p50)
	-- upvalues: (ref) v_u_9, (copy) v_u_10
	v_u_9 = v_u_9 + 1
	if v_u_9 > 10 then
		return nil
	end
	local v51 = v_u_10.new(p45, p46, p47, p48)
	v51.PositionInfluence = typeof(p49) == "Vector3" and p49 and p49 or Vector3.new(0.15, 0.15, 0.15)
	v51.RotationInfluence = typeof(p50) == "Vector3" and p50 and p50 or Vector3.new(1, 1, 1)
	p44._camShakeInstances[#p44._camShakeInstances + 1] = v51
	return v51
end
function v_u_1.StartShake(p52, p53, p54, p55, p56, p57)
	-- upvalues: (copy) v_u_10
	local v58 = v_u_10.new(p53, p54, p55)
	v58.PositionInfluence = typeof(p56) == "Vector3" and p56 and p56 or Vector3.new(0.15, 0.15, 0.15)
	v58.RotationInfluence = typeof(p57) == "Vector3" and p57 and p57 or Vector3.new(1, 1, 1)
	v58:StartFadeIn(p55)
	p52._camShakeInstances[#p52._camShakeInstances + 1] = v58
	return v58
end
return v_u_1