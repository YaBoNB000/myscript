-- solve (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ParabolicBeamHandler
-- Original

return function(p1, p2, p3, p4)
	local v5 = 0.5 * p1 * p4 * p4 + p2 * p4 + p3
	local v6 = v5 - (p1 * p4 * p4 + p2 * p4) / 3
	local v7 = (0.125 * p1 * p4 * p4 + 0.5 * p2 * p4 + p3 - 0.125 * (p3 + v5)) / 0.375 - v6
	local v8 = (v7 - p3).magnitude
	local v9 = (v6 - v5).magnitude
	local v10 = (p3 - v5).unit
	local v11 = (v7 - p3).unit
	local v12 = v11:Cross(v10).unit
	local v13 = (v6 - v5).unit
	local v14 = v13:Cross(v10).unit
	local v15 = v12:Cross(v11).unit
	local v16 = CFrame.new(p3.x, p3.y, p3.z, v11.x, v12.x, v15.x, v11.y, v12.y, v15.y, v11.z, v12.z, v15.z)
	local v17 = CFrame.new(v5.x, v5.y, v5.z, v13.x, v14.x, v15.x, v13.y, v14.y, v15.y, v13.z, v14.z, v15.z)
	return v8, -v9, v16, v17
end