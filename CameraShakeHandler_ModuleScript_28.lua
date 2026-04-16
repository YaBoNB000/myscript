-- CameraShakeHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load("CameraShaker")
local v_u_2 = {
	["currentShake"] = CFrame.new()
}
local v_u_4 = v1.new(199, function(p3)
	-- upvalues: (copy) v_u_2
	v_u_2.currentShake = p3
	workspace.Camera.CFrame = workspace.Camera.CFrame * p3
end)
v_u_4:Start()
function v_u_2.Get()
	-- upvalues: (copy) v_u_4
	return v_u_4
end
function v_u_2.Initialize() end
return v_u_2