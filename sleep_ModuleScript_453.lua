-- sleep (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > time
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("Promise")
return function(p2)
	-- upvalues: (copy) v_u_1
	return v_u_1.delay(p2)
end