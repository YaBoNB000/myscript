-- makeDialog (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("object")
local v_u_2 = {}
for _, v3 in pairs(script.types:GetChildren()) do
	v_u_2[v3.Name] = require(v3)
end
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v5 = p4.super and v_u_2[p4.super] and v_u_1(v_u_2[p4.super]) or v_u_1(v_u_2.dialog)
	for v6, v7 in pairs(p4) do
		v5[v6] = v7
	end
	return v5
end