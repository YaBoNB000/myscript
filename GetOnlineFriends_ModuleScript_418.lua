-- GetOnlineFriends (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load("Promise")
return function(p_u_3, p4)
	-- upvalues: (copy) v_u_2
	assert(p_u_3, "No player")
	if p_u_3.UserId <= 0 then
		return v_u_2.resolve({})
	end
	local v_u_5 = p4 or 200
	return v_u_2.try(function()
		-- upvalues: (copy) p_u_3, (ref) v_u_5
		return p_u_3:GetFriendsOnline(v_u_5)
	end)
end