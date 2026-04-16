-- makeDebris (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientDestruction
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("triangle")
local v_u_3 = v1("WeldConstraint")
local v_u_4 = v1("legacyImpulse")
return function(p5, _, p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v7 = p5.Position
	local v8 = {
		["x"] = p5.Size.X,
		["y"] = p5.Size.Y,
		["z"] = p5.Size.Z
	}
	local v9 = nil
	local v10 = v8.x >= v8.y and v8.x >= v8.z and "x" or (v8.y >= v8.x and v8.y >= v8.z and "y" or (v8.z >= v8.x and v8.z >= v8.y and "z" or nil))
	local v11
	if v10 == "x" then
		v11 = v8.y >= v8.z and "z" or "y"
	elseif v10 == "y" then
		v11 = v8.x >= v8.z and "z" or "x"
	else
		v11 = v10 == "z" and (v8.y >= v8.x and "x" or "y") or v9
	end
	local v12 = nil
	local v13 = nil
	local v14 = nil
	local v15 = nil
	if v11 == "x" then
		v12 = (p5.CFrame * CFrame.new(0, -v8.y / 2, v8.z / 2)).p
		v13 = (p5.CFrame * CFrame.new(0, v8.y / 2, v8.z / 2)).p
		v14 = (p5.CFrame * CFrame.new(0, -v8.y / 2, -v8.z / 2)).p
		v15 = (p5.CFrame * CFrame.new(0, v8.y / 2, -v8.z / 2)).p
	elseif v11 == "y" then
		v12 = (p5.CFrame * CFrame.new(-v8.x / 2, 0, v8.z / 2)).p
		v13 = (p5.CFrame * CFrame.new(v8.x / 2, 0, v8.z / 2)).p
		v14 = (p5.CFrame * CFrame.new(-v8.x / 2, 0, -v8.z / 2)).p
		v15 = (p5.CFrame * CFrame.new(v8.x / 2, 0, -v8.z / 2)).p
	elseif v11 == "z" then
		v12 = (p5.CFrame * CFrame.new(-v8.x / 2, v8.y / 2, 0)).p
		v13 = (p5.CFrame * CFrame.new(v8.x / 2, v8.y / 2, 0)).p
		v14 = (p5.CFrame * CFrame.new(-v8.x / 2, -v8.y / 2, 0)).p
		v15 = (p5.CFrame * CFrame.new(v8.x / 2, -v8.y / 2, 0)).p
	end
	local v16 = workspace.Game.Local.Debris
	local v17 = {}
	local v18 = p5.Size.Magnitude / 50
	local v19 = math.min(v18, 0.75) + 0.25
	if math.random() > 1 - v19 then
		local v20, v21 = v_u_2(p5, v7, v12, v13, v16, nil, nil, p6)
		v20.Transparency = 0
		v21.Transparency = 0
		v_u_3(v20, v21)
		v_u_4(v20, v7, nil, 1, 0.1, 1)
		table.insert(v17, v20)
		table.insert(v17, v21)
	end
	if math.random() > 1 - v19 then
		local v22, v23 = v_u_2(p5, v7, v13, v15, v16, nil, nil, p6)
		v22.Transparency = 0
		v23.Transparency = 0
		v_u_3(v22, v23)
		v_u_4(v22, v7, nil, 1, 0.1, 1)
		table.insert(v17, v22)
		table.insert(v17, v23)
	end
	if math.random() > 1 - v19 then
		local v24, v25 = v_u_2(p5, v7, v12, v14, v16, nil, nil, p6)
		v24.Transparency = 0
		v25.Transparency = 0
		v_u_3(v24, v25)
		v_u_4(v24, v7, nil, 1, 0.1, 1)
		table.insert(v17, v24)
		table.insert(v17, v25)
	end
	if math.random() > 1 - v19 then
		local v26, v27 = v_u_2(p5, v7, v14, v15, v16, nil, nil, p6)
		v26.Transparency = 0
		v27.Transparency = 0
		v_u_3(v26, v27)
		v_u_4(v26, v7, nil, 1, 0.1, 1)
		table.insert(v17, v26)
		table.insert(v17, v27)
	end
	return v17
end