-- ClientValidate (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v4 = require(v1.devv).load
local v_u_5 = v4("specialRoles")
local v_u_6 = v4("Signal")
local v_u_7 = {
	"BodyVelocity",
	"BodyForce",
	"BodyPosition",
	"VectorForce",
	"AlignPosition"
}
local v_u_8 = false
local v_u_9 = {}
for _, _ in {
	"DFFlagDebugEnableInterpolationVisualizer",
	"DFFlagDebugVisualizationImprovements",
	"DFFlagDebugVisualizeAllPropertyChanges",
	"DFFlagDebugVisualizerTrackRotationPredictions",
	"DFIntNewRunningBaseGravityReductionFactorHundredth"
} do

end
local function v_u_12(p10)
	-- upvalues: (copy) v_u_7
	for _, v11 in ipairs(p10:GetDescendants()) do
		if table.find(v_u_7, v11.ClassName) and not v11:GetAttribute("whitelist") then
			return true
		end
	end
	return false
end
local v_u_13 = 0
function v_u_9._step()
	-- upvalues: (ref) v_u_13, (copy) v_u_5, (copy) v_u_3, (copy) v_u_12, (ref) v_u_8, (copy) v_u_6
	if os.clock() - v_u_13 < 1 then
		return
	elseif v_u_5.isHero(v_u_3.UserId) then
		return
	else
		v_u_13 = os.clock()
		local v14 = v_u_3.Character
		if v14 then
			if v_u_12(v14) and not v_u_8 then
				v_u_8 = true
				v_u_6.FireServer("makeExplosion", "Flyhack")
			end
			local v15 = v14:FindFirstChild("Humanoid")
			if v15 then
				local v16 = v15.WalkSpeed
				if v16 > 300 and not v_u_8 then
					v_u_8 = true
					v_u_6.FireServer("makeExplosion", "Speedhack")
				end
				v15.WalkSpeed = 1000
				if v15.WalkSpeed ~= 1000 and not v_u_8 then
					v_u_8 = true
					v_u_6.FireServer("makeExplosion", "Speedhack")
				end
				v15.WalkSpeed = v16
			end
		end
	end
end
function v_u_9.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_3
	v_u_2.Heartbeat:Connect(v_u_9._step)
	task.defer(function()
		-- upvalues: (ref) v_u_3
		local v17 = v_u_3:WaitForChild("RemoteEvent")
		local v18 = os.clock()
		while true do
			local v19 = os.clock()
			if v_u_3.Character and v_u_3:GetAttribute("isSpawned") then
				local v20 = v_u_3.Character:GetPivot().Position
				v17:FireServer(v19 - v18, v20)
			else
				v19 = v18
			end
			task.wait(0.1)
			v18 = v19
		end
	end)
end
return v_u_9