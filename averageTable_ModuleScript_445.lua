-- averageTable (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > table
-- Original

return function(p1)
	if not p1 then
		return 0
	end
	if #p1 <= 0 then
		return 0
	end
	local v2 = 0
	for v3 = 1, #p1 do
		v2 = v2 + p1[v3]
	end
	return v2 / #p1
end