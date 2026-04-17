-- SphereCastAvg (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("Raycast")
local v_u_3 = v1("averageTable")
return function(p_u_4, p_u_5, p_u_6, p_u_7)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_8 = {}
	local v_u_17, v_u_18 = (function()
		-- upvalues: (copy) p_u_6, (ref) v_u_2, (copy) p_u_4, (copy) p_u_5
		local v9 = RaycastParams.new()
		v9.FilterDescendantsInstances = p_u_6
		v9.FilterType = Enum.RaycastFilterType.Whitelist
		v9.IgnoreWater = true
		local v10 = v_u_2
		local v11 = p_u_4
		local v12 = -p_u_5
		local v13 = v10(v11, Vector3.new(0, v12, 0), v9).Position
		local v14 = v_u_2
		local v15 = 2 * p_u_5
		local v16 = (v14(v13, Vector3.new(0, v15, 0), v9).Position.Y - v13.Y) / 2
		return v13 + Vector3.new(0, v16, 0), v16
	end)()
	local function v26(p19, p20)
		-- upvalues: (copy) p_u_7, (copy) p_u_6, (ref) v_u_2, (copy) v_u_17, (copy) v_u_18, (copy) v_u_8
		local v21 = 6.283185307179586 / p_u_7
		local v22 = math.ceil(v21)
		local v23 = RaycastParams.new()
		v23.FilterDescendantsInstances = p_u_6
		v23.FilterType = Enum.RaycastFilterType.Whitelist
		v23.IgnoreWater = true
		local v24 = (v_u_2(v_u_17, (CFrame.new(v_u_17) * CFrame.Angles(p20 == "x" and true or (p20 == "xz" and (p19 * v22 or 0) or 0), p20 == "y" and (p19 * v22 or 0) or 0, p20 == "z" and true or (p20 == "xz" and (p19 * v22 or 0) or 0)) * CFrame.new(v_u_18, 0, 0)).Position - v_u_17, v23).Position - v_u_17).magnitude
		local v25 = v_u_8
		return table.insert(v25, v24)
	end
	for v27 = 1, p_u_7 do
		v26(v27, "x")
	end
	for v28 = 1, p_u_7 do
		v26(v28, "y")
	end
	for v29 = 1, p_u_7 do
		v26(v29, "z")
	end
	for v30 = 1, p_u_7 do
		v26(v30, "xz")
	end
	local v31 = v_u_3(v_u_8) / p_u_5
	return math.clamp(v31, 0, 1)
end