-- CrystalBall (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientCarnival
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("RunService")
local v5 = require(v3.devv).load
local v_u_6 = v5("LODCheck")
local v_u_7 = v5("Maid")
local v_u_8 = {}
function v_u_1.BallAdded(p9)
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	if not v_u_8[p9] then
		local v10 = v_u_7.new()
		v_u_8[p9] = v10
		local v_u_11 = p9:FindFirstChild("Spinny", true)
		local v_u_12 = p9:FindFirstChild("Ball")
		local v_u_13 = v_u_12:GetPivot()
		local v_u_14 = v_u_13.Position
		local v_u_15 = false
		v10:GiveTask(v_u_4.Heartbeat:Connect(function(p16)
			-- upvalues: (ref) v_u_6, (copy) v_u_14, (ref) v_u_15, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13
			if v_u_6(v_u_14, 50, 50) then
				local v17
				if v_u_15 then
					local v18 = os.clock() * 35
					v17 = math.sin(v18) * 0.2 * 0.325
				else
					v17 = 0
				end
				local v19 = v_u_11
				v19.CFrame = v19.CFrame * CFrame.fromOrientation(p16 * 0.25, -p16 * 0.25, 0)
				v_u_12:PivotTo(v_u_13 * CFrame.new(v17, 0, -v17))
			end
		end))
		v10:GiveTask(v_u_12:GetAttributeChangedSignal("isShaking"):Connect(function()
			-- upvalues: (ref) v_u_15, (copy) v_u_12
			v_u_15 = v_u_12:GetAttribute("isShaking")
		end))
	end
end
function v_u_1.BallRemoved(p20)
	-- upvalues: (copy) v_u_8
	local v21 = v_u_8[p20]
	if v21 then
		v21:DoCleaning()
		v_u_8[p20] = nil
	end
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	v_u_2:GetInstanceAddedSignal("CrystalBall"):Connect(v_u_1.BallAdded)
	v_u_2:GetInstanceRemovedSignal("CrystalBall"):Connect(v_u_1.BallRemoved)
	for _, v22 in v_u_2:GetTagged("CrystalBall") do
		task.spawn(v_u_1.BallAdded, v22)
	end
end
return v_u_1