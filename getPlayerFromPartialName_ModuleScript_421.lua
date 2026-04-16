-- getPlayerFromPartialName (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v_u_1 = game:GetService("Players")
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = string.lower(p2)
	local v4 = v_u_1:GetChildren()
	local v5 = {}
	for v6 = 1, #v4 do
		if string.lower(v4[v6].name):find(v3) then
			local v7 = v4[v6]
			table.insert(v5, v7)
		end
	end
	if #v5 == 1 then
		return v5[1]
	end
	if #v5 == 0 then
		print("No results for player name: " .. v3)
	else
		print("Multiple results for player name: " .. v3)
	end
	return nil
end