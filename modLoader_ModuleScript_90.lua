-- modLoader (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > v3vehiclemods
-- Original

return function(p1, p2)
	local v3 = {}
	local v4 = {}
	for _, v5 in ipairs(p2) do
		local v6 = v3[v5.name] == nil
		assert(v6, "duplicate mod found!")
		local v7 = p1:new()
		for v8, v9 in pairs(v5) do
			v7[v8] = v9
		end
		table.insert(v4, v7)
		v3[v7.name] = v7
	end
	return {
		["mods"] = v4,
		["modsByName"] = v3
	}
end