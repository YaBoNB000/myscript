-- GetLocalUTCTime (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > time
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load("Signal")
local v_u_3 = 0
task.spawn(function()
	-- upvalues: (copy) v_u_2, (ref) v_u_3
	local v4 = v_u_2.InvokeServer("GetServerTime")
	if v4 and typeof(v4) == "number" then
		v_u_3 = os.difftime(os.time(), v4)
	end
end)
return function()
	-- upvalues: (ref) v_u_3
	return os.time() - v_u_3
end