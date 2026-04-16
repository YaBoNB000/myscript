-- object (ModuleScript)
-- ReplicatedStorage > devv > shared > Objects
-- Original

return function(p1)
	local v2 = {}
	local v_u_3 = {
		["__index"] = v2
	}
	function v2.new(_)
		-- upvalues: (copy) v_u_3
		local v4 = {}
		local v5 = v_u_3
		setmetatable(v4, v5)
		return v4
	end
	if p1 then
		setmetatable(v2, {
			["__index"] = p1
		})
	end
	return v2
end