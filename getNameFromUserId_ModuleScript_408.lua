-- getNameFromUserId (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v_u_1 = game:GetService("Players")
local v_u_2 = {}
return function(p3)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if not p3 then
		return "???"
	end
	local v_u_4 = tonumber(p3)
	if v_u_4 <= 0 then
		return "???"
	end
	if v_u_2[v_u_4] then
		return v_u_2[v_u_4]
	end
	local v5, v6 = pcall(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_4
		return v_u_1:GetNameFromUserIdAsync(v_u_4)
	end)
	if not (v5 and v6) then
		return "???"
	end
	v_u_2[v_u_4] = v6
	return v6
end