-- flingPlayer (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v_u_1("sleep")
v_u_1("Promise")
local v_u_3 = v_u_1("ClientRagdoll")
local v4 = v_u_1("Signal")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Players").LocalPlayer
local function v_u_10(p7)
	local v8 = 0
	for _, v9 in ipairs(p7:GetDescendants()) do
		if v9:IsA("BasePart") then
			v8 = v8 + v9:GetMass()
		end
	end
	return v8
end
local function v25()
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_5, (copy) v_u_3, (copy) v_u_2, (copy) v_u_10
	local v11 = v_u_6.Character
	if v11 and (v11:FindFirstChild("HumanoidRootPart") and v11:FindFirstChild("Humanoid")) then
		local v12 = v11.Humanoid
		local v13 = v11.HumanoidRootPart
		if v13 ~= nil and v13:FindFirstChildOfClass("BodyVelocity") then
			return
		end
		local v14 = v_u_1("v3item")
		local v15 = v14.inventory
		if v15 then
			v15 = v14.inventory.getEquipped()
		end
		if v15 and (v15.name == "Skateboard" or (v15.name == "Hoverboard" or (v15.name == "Segway" or v15.name == "Witch Broom"))) then
			v14.inventory.unequipAll(true)
			v_u_5.Heartbeat:Wait()
		end
		v_u_1("ClientBike").Stop()
		if v12:GetState() ~= Enum.HumanoidStateType.Dead then
			v_u_3.SetRagdoll(v_u_6, true)
			v_u_2(4):doneCall(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_6
				v_u_3.SetRagdoll(v_u_6, false)
			end)
		end
		local v16 = 1 + (1 - v_u_6:GetAttribute("strength")) * 2
		local v17 = math.clamp(v16, 1, 3)
		local v18 = math.random(-10, 10) / 10
		local v19 = math.random(-10, 10) / 10
		local v20 = Vector3.new(v18, 1, v19).Unit
		local v21 = v_u_10(v11)
		local v22 = v17 * 4
		local v23 = v20 * v21 * v22 * Vector3.new(1, 1, 1)
		local v_u_24 = Instance.new("BodyVelocity")
		v_u_24:SetAttribute("whitelist", true)
		v_u_24.Velocity = v23
		v_u_24.MaxForce = Vector3.new(1, 1, 1) * (1 / 0)
		v_u_24.Parent = v13
		task.delay(1, function()
			-- upvalues: (copy) v_u_24
			v_u_24:Destroy()
		end)
	end
end
v4.LinkSignal("flingPlayer", v25)
return v25