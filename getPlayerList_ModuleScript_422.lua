-- getPlayerList (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v_u_1 = require(script.Parent.getPlayerFromPartialName)
local v_u_2 = game:GetService("Players")
return function(p3, p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v5 = string.lower(p4)
	local v6 = {}
	for v7 in string.gmatch(v5, "[^%s,]+") do
		table.insert(v6, v7)
	end
	local v8 = {}
	for v9 = 1, #v6 do
		if v6[v9] == "others" or v6[v9] == "all" then
			local v10 = v_u_2:GetPlayers()
			for v11 = 1, #v10 do
				if v6[v9] ~= "others" or v10[v11] ~= p3 then
					local v12 = v10[v11]
					table.insert(v10, v12)
				end
			end
		else
			if v6[v9] == "me" then
				v6[v9] = p3.name
			end
			local v13 = v_u_1(v6[v9])
			if v13 then
				table.insert(v8, v13)
			end
		end
	end
	return v8
end