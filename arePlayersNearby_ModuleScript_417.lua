-- arePlayersNearby (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v_u_1 = game:GetService("Players")
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = false
	for _, v5 in pairs(v_u_1:GetPlayers()) do
		if v5:DistanceFromCharacter(p2) < p3 then
			return true
		end
	end
	return v4
end