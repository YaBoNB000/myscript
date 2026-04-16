-- playLocalSound (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > audio
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v_u_3 = v2("v3sound")
local function v10(p4, p5, p6)
	-- upvalues: (copy) v_u_3
	local v7 = v_u_3.newSound(p4, p5)
	v7.isGlobal = true
	if p6 then
		for v8, v9 in pairs(p6) do
			v7[v8] = v9
		end
	end
	v7:play()
end
v2("Signal").LinkSignal("playLocalSound", v10)
return v10