-- BikeReplication (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientBike
-- Original

local v1 = {}
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("RunService")
local v_u_5 = require(v3.devv).load("LODCheck")
local v_u_6 = {}
local function v_u_14(p7)
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	for v8, v9 in v_u_6 do
		if v8 and (v8.Parent and v8.PrimaryPart) then
			local v10 = v8.PrimaryPart
			if v_u_5(v10.Position, 100, 100) then
				local v11 = (v10.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
				if math.abs(v11) > 0.5 then
					v9.wheelRotation = v9.wheelRotation + v11 * 3.141592653589793 * p7 % 6.283185307179586
					for _, v12 in v9.pedals do
						if v12 and (v12.Parent and v12.PrimaryPart) then
							local v13 = v12.PrimaryPart:FindFirstChild("Weld")
							if v13 then
								v13.C0 = v13.C1:Inverse() * CFrame.Angles(-v9.wheelRotation * 0.1, 0, 0) * v13.C1
							end
						end
					end
				end
			end
		end
	end
end
local function v_u_16(p15)
	-- upvalues: (copy) v_u_6
	task.wait()
	v_u_6[p15] = {
		["wheelRotation"] = 0,
		["pedals"] = { p15:WaitForChild("FrontWheel"), p15:WaitForChild("RearWheel"), p15:WaitForChild("Pedals") }
	}
end
function v1.Initialize()
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_2, (copy) v_u_16, (copy) v_u_6
	v_u_4.Heartbeat:Connect(v_u_14)
	v_u_2:GetInstanceAddedSignal("Bike"):Connect(v_u_16)
	v_u_2:GetInstanceRemovedSignal("Bike"):Connect(function(p17)
		-- upvalues: (ref) v_u_6
		v_u_6[p17] = nil
	end)
	for _, v18 in v_u_2:GetTagged("Bike") do
		v_u_16(v18)
	end
end
return v1