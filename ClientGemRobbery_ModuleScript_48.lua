-- ClientGemRobbery (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.devv).load
local v_u_4 = v3("LODCheck")
local v_u_5 = v3("triangle")
local v_u_6 = v3("v3sound")
local v_u_7 = v3("Signal")
local v_u_8 = v3("Maid")
local v_u_9 = {}
local function v_u_31(p10, p11)
	-- upvalues: (copy) v_u_8, (copy) v_u_5
	local v_u_12 = v_u_8.new()
	local v13 = p11.Position
	local v14 = {
		["x"] = p10.X,
		["y"] = p10.Y,
		["z"] = p10.Z
	}
	local v15 = {
		["Color"] = Color3.fromRGB(159, 166, 171),
		["Material"] = Enum.Material.ForceField,
		["Transparency"] = 0,
		["Reflectance"] = 0,
		["Size"] = p10
	}
	local v16 = nil
	local v17 = v14.x >= v14.y and v14.x >= v14.z and "x" or (v14.y >= v14.x and v14.y >= v14.z and "y" or (v14.z >= v14.x and v14.z >= v14.y and "z" or nil))
	local v18
	if v17 == "x" then
		v18 = v14.y >= v14.z and "z" or "y"
	elseif v17 == "y" then
		v18 = v14.x >= v14.z and "z" or "x"
	else
		v18 = v17 == "z" and (v14.y >= v14.x and "x" or "y") or v16
	end
	local v19 = nil
	local v20 = nil
	local v21 = nil
	local v22 = nil
	if v18 == "x" then
		v19 = (p11 * CFrame.new(0, -v14.y / 2, v14.z / 2)).p
		v20 = (p11 * CFrame.new(0, v14.y / 2, v14.z / 2)).p
		v21 = (p11 * CFrame.new(0, -v14.y / 2, -v14.z / 2)).p
		v22 = (p11 * CFrame.new(0, v14.y / 2, -v14.z / 2)).p
	elseif v18 == "y" then
		v19 = (p11 * CFrame.new(-v14.x / 2, 0, v14.z / 2)).p
		v20 = (p11 * CFrame.new(v14.x / 2, 0, v14.z / 2)).p
		v21 = (p11 * CFrame.new(-v14.x / 2, 0, -v14.z / 2)).p
		v22 = (p11 * CFrame.new(v14.x / 2, 0, -v14.z / 2)).p
	elseif v18 == "z" then
		v19 = (p11 * CFrame.new(-v14.x / 2, v14.y / 2, 0)).p
		v20 = (p11 * CFrame.new(v14.x / 2, v14.y / 2, 0)).p
		v21 = (p11 * CFrame.new(-v14.x / 2, -v14.y / 2, 0)).p
		v22 = (p11 * CFrame.new(v14.x / 2, -v14.y / 2, 0)).p
	end
	if math.random() < 0.95 then
		local v_u_23, v_u_24 = v_u_5(v15, v13, v19, v20, workspace.Game.Local)
		v_u_23.CollisionGroupId = 5
		v_u_24.CollisionGroupId = 5
		v_u_12:GiveTask(function()
			-- upvalues: (copy) v_u_23, (copy) v_u_24
			if v_u_23 then
				v_u_23:Destroy()
			end
			if v_u_24 then
				v_u_24:Destroy()
			end
		end)
	end
	if math.random() < 0.95 then
		local v_u_25, v_u_26 = v_u_5(v15, v13, v20, v22, workspace.Game.Local)
		v_u_25.CollisionGroupId = 5
		v_u_26.CollisionGroupId = 5
		v_u_12:GiveTask(function()
			-- upvalues: (copy) v_u_25, (copy) v_u_26
			if v_u_25 then
				v_u_25:Destroy()
			end
			if v_u_26 then
				v_u_26:Destroy()
			end
		end)
	end
	if math.random() < 0.95 then
		local v_u_27, v_u_28 = v_u_5(v15, v13, v19, v21, workspace.Game.Local)
		v_u_27.CollisionGroupId = 5
		v_u_28.CollisionGroupId = 5
		v_u_12:GiveTask(function()
			-- upvalues: (copy) v_u_27, (copy) v_u_28
			if v_u_27 then
				v_u_27:Destroy()
			end
			if v_u_28 then
				v_u_28:Destroy()
			end
		end)
	end
	if math.random() < 0.95 then
		local v_u_29, v_u_30 = v_u_5(v15, v13, v21, v22, workspace.Game.Local)
		v_u_29.CollisionGroupId = 5
		v_u_30.CollisionGroupId = 5
		v_u_12:GiveTask(function()
			-- upvalues: (copy) v_u_29, (copy) v_u_30
			if v_u_29 then
				v_u_29:Destroy()
			end
			if v_u_30 then
				v_u_30:Destroy()
			end
		end)
	end
	task.delay(8, function()
		-- upvalues: (copy) v_u_12
		v_u_12:DoCleaning()
	end)
end
function v_u_9._valuableCaseBroken(p32)
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_4, (copy) v_u_31
	local v33
	if p32 then
		v33 = p32:FindFirstChild("Glass")
	else
		v33 = p32
	end
	if p32 and v33 then
		local v34 = v_u_6.newSound("glassShatter")
		v34.playbackSpeed = math.random(8, 12) / 10
		v34:attachToPart(v33)
		v34:play()
		if v_u_1:GetAttribute("destruction") and v_u_4(p32:GetPivot().Position, 80, 40) then
			local v35 = v33.Size.X
			local v36 = v33.Size.Y
			local v37 = v_u_31
			local v38 = v33.Size
			local v39 = v36 * 0.95
			v37(v38 - Vector3.new(0, v39, 0), v33.CFrame * CFrame.new(0, v36 * 0.5, 0))
			local v40 = v_u_31
			local v41 = v33.Size
			local v42 = v35 * 0.95
			v40(v41 - Vector3.new(v42, 0, 0), v33.CFrame * CFrame.new(v35 * 0.5, 0, 0))
			local v43 = v_u_31
			local v44 = v33.Size
			local v45 = v35 * 0.95
			v43(v44 - Vector3.new(v45, 0, 0), v33.CFrame * CFrame.new(v35 * -0.5, 0, 0))
		end
	else
		return
	end
end
function v_u_9.Initialize()
	-- upvalues: (copy) v_u_7, (copy) v_u_9
	v_u_7.LinkSignal("valuableCaseBroken", v_u_9._valuableCaseBroken)
end
return v_u_9