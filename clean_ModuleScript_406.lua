-- clean (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > table
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
local function v_u_7(p2)
	-- upvalues: (copy) v_u_1, (copy) v_u_7
	local v3 = v_u_1("Promise")
	local v4 = v_u_1("Scheduler")
	if type(p2) == "table" then
		for v5, v6 in pairs(p2) do
			if v3.is(v6) or v4.IsTask(v6) then
				v6:cancel()
			end
			p2[v5] = nil
			v_u_7(v6)
		end
	elseif typeof(p2) == "RBXScriptSignal" then
		p2:Disconnect()
	end
end
return v_u_7