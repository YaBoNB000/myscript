-- GetFriends (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.devv).load("Promise")
return function(p_u_4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	assert(p_u_4, "No player")
	if p_u_4.UserId <= 0 then
		return v_u_3.resolve({})
	end
	local v_u_5 = {}
	return v_u_3.new(function(p_u_6, p_u_7)
		-- upvalues: (ref) v_u_3, (ref) v_u_2, (copy) p_u_4, (copy) v_u_5
		v_u_3.try(function()
			-- upvalues: (ref) v_u_2, (ref) p_u_4
			return v_u_2:GetFriendsAsync(p_u_4.UserId)
		end):andThen(function(p8)
			-- upvalues: (ref) v_u_5, (copy) p_u_6
			while true do
				local v9 = p8:GetCurrentPage()
				for _, v10 in pairs(v9) do
					local v11 = v_u_5
					local v12 = {
						["userId"] = v10.Id,
						["username"] = v10.Username
					}
					table.insert(v11, v12)
				end
				if not p8.IsFinished then
					p8:AdvanceToNextPageAsync()
				end
				if p8.IsFinished then
					p_u_6(v_u_5)
					return
				end
			end
		end):catch(function()
			-- upvalues: (copy) p_u_7
			p_u_7()
		end)
	end)
end