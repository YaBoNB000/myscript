-- weightedTable (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > probability
-- Original

local v_u_1 = Random.new()
return function(p2)
	-- upvalues: (copy) v_u_1
	if not p2 then
		return nil
	end
	local v3 = 0
	for _, v4 in pairs(p2) do
		if typeof(v4) == "number" then
			v3 = v3 + v4
		end
	end
	if v3 <= 0 then
		return nil
	end
	local v5 = v_u_1:NextNumber(0, v3)
	for v6, v7 in pairs(p2) do
		v3 = v3 - v7
		if v3 < v5 then
			return v6, v7
		end
	end
	return nil
end