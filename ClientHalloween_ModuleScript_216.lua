-- ClientHalloween (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Halloween
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v3 = require(v2.devv).load
local v_u_4 = v3("LimitedEvents")
local v_u_5 = v3("EventMob")
local v_u_6 = v3("Signal")
v3("Maid")
local v_u_7 = require(script.Parent.EventCandy)
Random.new()
local function v_u_12(p8)
	-- upvalues: (copy) v_u_5
	for _, v9 in p8 do
		local v10 = v9.spawnName
		if not workspace.Halloween:FindFirstChild(v10) then
			local v11 = workspace.MobSpawns[v10].Position
			v_u_5.new(v9.mobName, v10, v11)
		end
	end
end
local function v_u_20(p13, ...)
	-- upvalues: (copy) v_u_7
	if p13 == "spawn" then
		local v14, v15 = ...
		for v16 = 1, #v15 do
			v_u_7.SpawnSingle(CFrame.new(v15[v16]) * CFrame.Angles(6.283185307179586 * math.random(), 6.283185307179586 * math.random(), 6.283185307179586 * math.random()), v14)
		end
	elseif p13 == "explode" then
		local v17, v18, v19 = ...
		v_u_7.Spawn(v17, CFrame.new(v19 + Vector3.new(0, 1, 0)) * CFrame.Angles(0, 6.283185307179586 * math.random(), 0), v18, 1.33)
	end
end
local function v_u_21()
	-- upvalues: (copy) v_u_4
	while task.wait(1) do
		if not v_u_4.IsActive("Halloween") then
			workspace.Halloween:ClearAllChildren()
			return
		end
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_6, (copy) v_u_12, (copy) v_u_20, (copy) v_u_21
	v_u_6.LinkSignal("updateMobs", v_u_12)
	v_u_6.LinkSignal("spawnCandy", v_u_20)
	task.spawn(v_u_21)
end
return v1