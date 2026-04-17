-- shallowCopy (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > table
-- Original

return function(p1)
	if type(p1) ~= "table" then
		return p1
	end
	local v2 = {}
	for v3, v4 in pairs(p1) do
		v2[v3] = v4
	end
	return v2
end