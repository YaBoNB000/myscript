-- printTable (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > table
-- Original

local function v_u_8(p1, p2)
	-- upvalues: (copy) v_u_8
	local v3 = type(p1) == "table"
	assert(v3)
	local v4 = p2 or 0
	local v5 = ""
	for _ = 1, v4 do
		v5 = v5 .. "__"
	end
	for v6, v7 in pairs(p1) do
		if type(v7) == "table" then
			print(v5, tostring(v6), typeof(v6), ",")
			v_u_8(v7, v4 + 1)
		else
			print(v5, tostring(v6), typeof(v6), ", ", (tostring(v7)))
		end
	end
end
return v_u_8