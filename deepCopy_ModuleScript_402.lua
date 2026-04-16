-- deepCopy (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > table
-- Original

local function v_u_7(p1)
	-- upvalues: (copy) v_u_7
	if type(p1) ~= "table" then
		return p1
	end
	local v2 = {}
	for v3, v4 in next, p1 do
		v2[v_u_7(v3)] = v_u_7(v4)
	end
	local v5 = v_u_7
	local v6 = getmetatable(p1)
	setmetatable(v2, v5(v6))
	return v2
end
return v_u_7