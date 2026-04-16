-- FitViewport (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

return function(p1, p2, p3, p4, p5)
	local v6, v7 = p2:GetBoundingBox()
	local v8 = p1.FieldOfView
	local v9 = p4 or CFrame.Angles(0, 1.5707963267948966, 0)
	local v10 = p3 or CFrame.new()
	local v11 = v9:VectorToObjectSpace(v7)
	local v12 = v11.X
	math.abs(v12)
	local v13 = v11.Y
	local v14 = math.abs(v13)
	local v15 = v11.Z
	local v16 = math.abs(v15)
	local v17 = v8 / 2
	local v18 = math.rad(v17)
	local v19 = v14 / (math.tan(v18) * 2) + v16 / 2
	p1.CFrame = v6 * v10 * v9 * CFrame.new(0, 0, v19 * (p5 or 1))
end