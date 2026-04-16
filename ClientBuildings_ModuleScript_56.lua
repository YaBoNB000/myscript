-- ClientBuildings (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v2 = {}
for _, v3 in ipairs(script:GetChildren()) do
	if v3:IsA("ModuleScript") then
		v_u_1[v3.Name] = require(v3)
	end
end
function v2.Initialize()
	-- upvalues: (copy) v_u_1
	for _, v4 in pairs(v_u_1) do
		task.spawn(v4.Initialize)
	end
end
return v2