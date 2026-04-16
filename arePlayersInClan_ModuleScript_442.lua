-- arePlayersInClan (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > teams
-- Original

return function(p1, p2)
	local v3 = p1:GetAttribute("clanId")
	local v4 = p2:GetAttribute("clanId")
	if v3 then
		if v4 then
			v4 = v3 == v4
		end
	else
		v4 = v3
	end
	return v4
end