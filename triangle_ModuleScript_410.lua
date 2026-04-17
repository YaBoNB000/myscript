-- triangle (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

local v_u_1 = Vector3.new
local v_u_2 = CFrame.new
local v_u_3 = math.abs
local v_u_4 = v_u_1().Cross
local v_u_5 = v_u_1().Dot
local v_u_6 = game.Clone
return function(p7, p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_1
	local v15 = p9 - p8
	local v16 = p10 - p8
	local v17 = p10 - p9
	local v18 = v15.magnitude
	local v19 = v16.magnitude
	local v20 = v17.magnitude
	local v21 = p14 or "triangle"
	if v20 < v18 and v19 < v18 then
		local v22 = p10
		p10 = p8
		p8 = p9
		p9 = v22
	elseif v20 < v19 then
		if v18 >= v19 then
			local v23 = p9
			p9 = p8
			p8 = v23
		end
	else
		local v24 = p9
		p9 = p8
		p8 = v24
	end
	local v25 = p8 - p9
	local v26 = p10 - p9
	local v27 = p10 - p8
	local v28 = v_u_4(v26, v25).unit
	local v29 = v21 == "triangle" and Instance.new("WedgePart") or Instance.new("Part")
	v29.Color = p7.Color
	v29.Material = p7.Material
	v29.Reflectance = p7.Reflectance
	v29.Transparency = p7.Transparency
	v29.Name = ""
	v29.Anchored = false
	v29.CanCollide = true
	v29.CollisionGroupId = 0
	v29.CFrame = v_u_2()
	v29.Size = p7.Size
	v29.BottomSurface = Enum.SurfaceType.Smooth
	v29.TopSurface = Enum.SurfaceType.Smooth
	local v30 = p12 or v_u_6(v29)
	local v31 = p13 or v_u_6(v29)
	local v32 = v_u_4(v27, v28).unit
	local v33 = v_u_3((v_u_5(v25, v32)))
	local v34 = v27.magnitude
	local v35 = {
		["X"] = p7.Size.X,
		["Y"] = p7.Size.Y,
		["Z"] = p7.Size.Z
	}
	local v36 = nil
	local v37 = v35.X >= v35.Y and v35.X >= v35.Z and "X" or (v35.Y >= v35.X and v35.Y >= v35.Z and "Y" or (v35.Z >= v35.X and v35.Z >= v35.Y and "Z" or nil))
	if v37 == "X" then
		local _ = v35.Y >= v35.Z and "Y" or "Z"
		v36 = v35.Y >= v35.Z and "Z" or "Y"
	elseif v37 == "Y" then
		local _ = v35.X >= v35.Z and "X" or "Z"
		v36 = v35.X >= v35.Z and "Z" or "X"
	elseif v37 == "Z" then
		local _ = v35.Y >= v35.X and "Y" or "X"
		v36 = v35.Y >= v35.X and "X" or "Y"
	end
	v30.Size = v_u_1(v35[v36], v_u_3((v_u_5(v25, v27))) / v34, v33)
	v31.Size = v_u_1(v35[v36], v33, v_u_3((v_u_5(v26, v27))) / v34)
	local v38 = -v27.unit
	local v39 = (p9 + p8) / 2
	local v40 = -v28
	local v41 = -v32
	v30.CFrame = v_u_2(v39.x, v39.y, v39.z, v40.x, v38.x, v41.x, v40.y, v38.y, v41.y, v40.z, v38.z, v41.z)
	local v42 = (p9 + p10) / 2
	local v43 = -v28
	v31.CFrame = v_u_2(v42.x, v42.y, v42.z, v43.x, v32.x, v38.x, v43.y, v32.y, v38.y, v43.z, v32.z, v38.z)
	v30.Parent = p11
	v31.Parent = p11
	return v30, v31
end