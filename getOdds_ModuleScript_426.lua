-- getOdds (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > probability
-- Original

return function(p1)
	if not p1 then
		return {}
	end
	local v2 = 0
	for _, v3 in pairs(p1) do
		if typeof(v3) == "number" then
			v2 = v2 + v3
		end
	end
	if v2 <= 0 then
		return {}
	end
	local v4 = {}
	for v5, v6 in pairs(p1) do
		if typeof(v6) == "number" and v6 > 0 then
			v4[v5] = v6 / v2 * 100
		end
	end
	return v4
end