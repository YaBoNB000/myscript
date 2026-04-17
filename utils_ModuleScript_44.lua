-- utils (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > FurniturePlacer
-- Original

return {
	["GetCorners"] = function(p1, p2)
		local v3 = p2 * 0.5
		local v4 = {}
		for v5 = -1, 1, 2 do
			for v6 = -1, 1, 2 do
				local v7 = (p1 * CFrame.new(v3 * Vector3.new(v5, 0, v6))).Position
				table.insert(v4, v7)
			end
		end
		return v4
	end,
	["IsPointInPartIgnoreY"] = function(p8, p9, p10)
		local v11 = p9.CFrame:PointToObjectSpace(p8)
		local v12 = p9.Size.X * 0.5 + (p10 or 0)
		local v13 = p9.Size.Z * 0.5 + (p10 or 0)
		local v14 = v11.X
		if math.abs(v14) <= v12 then
			local v15 = v11.Z
			if math.abs(v15) <= v13 then
				return true
			end
		end
		return false
	end
}