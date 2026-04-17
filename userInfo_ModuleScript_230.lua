-- userInfo (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > player
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local v_u_2 = game:GetService("Players")
local v_u_3 = {}
local v_u_11 = {
	["_cache"] = v_u_3,
	["_request"] = function(p4)
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		local v5 = v_u_1.InvokeServer("GetUserInfo", p4)
		if v5 then
			v_u_3[p4] = v5
			return v5
		end
		local v6 = 10
		repeat
			task.wait(5)
			v6 = v6 - 1
			local v7 = v_u_1.InvokeServer("GetUserInfo", p4)
		until v7 ~= nil or v6 <= 0
		if v7 then
			v_u_3[p4] = v7
			return v7
		end
	end,
	["GetUserInfo"] = function(p8)
		-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_11
		local v9
		if typeof(p8) == "number" then
			v9 = p8 == math.floor(p8)
		else
			v9 = false
		end
		assert(v9, "userId is not a valid integer for GetUserInfo")
		if v_u_3[p8] then
			return v_u_3[p8]
		end
		local v10 = v_u_2:GetPlayerByUserId(p8)
		if not v10 then
			return v_u_11._request(p8)
		end
		v_u_3[p8] = {
			["displayName"] = v10.DisplayName,
			["username"] = v10.Name
		}
		return v_u_3[p8]
	end
}
return v_u_11