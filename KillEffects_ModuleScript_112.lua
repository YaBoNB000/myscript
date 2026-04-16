-- KillEffects (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load("Signal")
local v_u_3 = {}
local v4 = {}
for _, v5 in script.kill:GetChildren() do
	v_u_3[v5.Name] = require(v5)
end
local v_u_6 = {}
for _, v7 in script.knock:GetChildren() do
	v_u_6[v7.Name] = require(v7)
end
function v4.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6
	v_u_2.LinkSignal("killEffect", function(p8, p9, p10, p11, p12)
		-- upvalues: (ref) v_u_3
		if v_u_3[p9] then
			v_u_3[p9](p8, p10, p11, p12)
		end
	end)
	v_u_2.LinkSignal("knockEffect", function(p13, p14, p15, p16, p17)
		-- upvalues: (ref) v_u_6
		if v_u_6[p14] then
			v_u_6[p14](p13, p15, p16, p17)
		end
	end)
end
return v4