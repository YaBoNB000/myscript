-- ClientAnalytics (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load("GameAnalytics")
return {
	["Initialize"] = function()
		-- upvalues: (copy) v_u_2
		task.defer(function()
			-- upvalues: (ref) v_u_2
			v_u_2:initClient()
		end)
	end
}