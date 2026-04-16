-- ClientRagdoll (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v_u_1("RagdollRigging")
v_u_1("Signal")
local v_u_3 = v_u_1("SetCollisionGroup")
local v_u_4 = v_u_1("ClientReplicator")
local v_u_5 = v_u_1("Signal")
local v_u_6 = {
	["isRagdolled"] = false
}
local v_u_7 = game:GetService("Players").LocalPlayer
local v_u_8 = game:GetService("ProximityPromptService")
local v_u_9 = game:GetService("RunService")
local function v_u_13(p10, p11)
	if p10 and p10.Parent then
		for _, v12 in pairs(Enum.HumanoidStateType:GetEnumItems()) do
			if v12 ~= Enum.HumanoidStateType.Physics and (v12 ~= Enum.HumanoidStateType.Dead and (v12 ~= Enum.HumanoidStateType.None and (v12 ~= Enum.HumanoidStateType.RunningNoPhysics and (v12 ~= Enum.HumanoidStateType.StrafingNoPhysics and (p10 and p10.Parent))))) then
				p10:SetStateEnabled(v12, not p11)
			end
		end
		p10:ChangeState(p11 and Enum.HumanoidStateType.Physics or Enum.HumanoidStateType.GettingUp)
	end
end
function v_u_6.SetRagdoll(p14, p_u_15)
	-- upvalues: (copy) v_u_13, (copy) v_u_2, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_8
	local v16 = p14.Character
	local v17
	if v16 then
		v17 = v16:FindFirstChildOfClass("Humanoid")
	else
		v17 = v16
	end
	local v18
	if v17 then
		v18 = v17:FindFirstChildWhichIsA("Animator")
	else
		v18 = v17
	end
	v_u_13(v17, p_u_15)
	local v19 = v_u_2.setEnabledMotors(v16, v17.RigType, not p_u_15)
	if p_u_15 then
		v_u_3(v16, 3)
		if v18 then
			v18:ApplyJointVelocities(v19)
			coroutine.wrap(v_u_2.easeJointFriction)(v16, 0.2)
		end
	else
		v_u_3(v16, 2)
		local v20 = v16:FindFirstChild("HumanoidRootPart")
		if v20 then
			v20.CFrame = v20.CFrame + Vector3.new(0, 2, 0)
		end
	end
	if p14 == v_u_7 then
		v_u_6.isRagdolled = p_u_15
		v_u_5.FireServer("setRagdoll", p_u_15)
		v_u_4.Set(p14, "ragdolled", p_u_15)
		v_u_4.Replicate("ragdolled")
		v_u_7:SetAttribute("isRagdoll", p_u_15)
		v_u_8.Enabled = not p_u_15
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_8, (copy) p_u_15
			v_u_8.Enabled = not p_u_15
		end)
	end
end
function v_u_6.SetStun(_, _, p21, _)
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	if p21 > 0 then
		if v_u_6.isRagdolled == false then
			v_u_6.SetRagdoll(v_u_7, true)
			return
		end
	elseif p21 <= 0 and v_u_6.isRagdolled == true then
		v_u_6.SetRagdoll(v_u_7, false)
	end
end
function v_u_6._taserHit(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_7
	v_u_1("ClientBike").Stop()
	v_u_4.Set(v_u_7, "stun", 3.5)
end
local v_u_22 = tick()
function v_u_6.Heartbeat()
	-- upvalues: (ref) v_u_22, (copy) v_u_4, (copy) v_u_7
	local v23 = tick() - v_u_22
	v_u_22 = tick()
	local v24 = v_u_4.Get(v_u_7, "stun") - v23
	local v25 = math.max(v24, 0)
	v_u_4.Set(v_u_7, "stun", v25)
end
function v_u_6.Initialize()
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7, (copy) v_u_5
	v_u_9.Heartbeat:Connect(v_u_6.Heartbeat)
	v_u_4.AddUpdateFunc(v_u_7, "stun", "stunHandler", v_u_6.SetStun)
	v_u_5.LinkSignal("taserHit", v_u_6._taserHit)
end
return v_u_6