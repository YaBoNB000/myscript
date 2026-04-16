-- PartHighligher (ModuleScript)
-- ReplicatedStorage > devv > shared > Objects
-- Original

local v_u_19 = {
	["new"] = function()
		-- upvalues: (copy) v_u_19
		local v1 = {
			["__index"] = v_u_19
		}
		local v2 = setmetatable({}, v1)
		v2._cache = {}
		return v2
	end,
	["SetModel"] = function(p_u_3, p4, p5)
		p_u_3._cache = {}
		local function v8(p6)
			-- upvalues: (copy) p_u_3
			for _, v7 in p6:GetDescendants() do
				if v7:IsA("BasePart") and (v7.Name ~= "Hitbox" and v7.Transparency ~= 1) then
					p_u_3._cache[v7] = {
						["color"] = v7.Color,
						["transparency"] = v7.Transparency
					}
				end
			end
		end
		v8(p4)
		for _, v9 in p5 or {} do
			v8(v9)
		end
	end,
	["SetColor"] = function(p10, p11)
		for v12 in p10._cache do
			v12.Color = p11
		end
	end,
	["SetTransparency"] = function(p13, _)
		for v14, v15 in p13._cache do
			v14.Transparency = v15.transparency
		end
	end,
	["Reset"] = function(p16)
		for v17, v18 in p16._cache do
			v17.Color = v18.color
			v17.Transparency = v18.transparency
		end
	end
}
return v_u_19