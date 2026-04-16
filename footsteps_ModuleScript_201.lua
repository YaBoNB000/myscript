-- footsteps (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
v1("Maid")
v1("v3sfx")
local v_u_2 = v1("Raycast")
local v_u_3 = v1("v3sound")
local v_u_4 = v1("ClientReplicator")
local v_u_5 = v1("nearbyPlayerUtil")
v1("HumanoidReadyUtil")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("Players")
local v_u_8 = v_u_7.LocalPlayer
local v_u_9 = require(script.nameFromMaterial)
local v_u_15 = {
	["_footRaycast"] = function(p10)
		-- upvalues: (copy) v_u_2
		if p10 then
			local v11 = p10.CFrame
			local v12 = v11 * CFrame.new(0, -1, 0).p - v11.p
			local v13 = RaycastParams.new()
			v13.FilterDescendantsInstances = { p10.Parent }
			v13.FilterType = Enum.RaycastFilterType.Exclude
			v13.IgnoreWater = true
			local v14 = v_u_2(v11.p, v12, v13)
			if v14 and v14.Material then
				return v14.Material
			end
		end
	end
}
local v_u_16 = {}
function v_u_15._footstep(p17)
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_16, (copy) v_u_15, (copy) v_u_9, (copy) v_u_3
	local v18 = p17.Character
	if v18 and v18.PrimaryPart then
		if p17 ~= v_u_8 then
			local v19 = v_u_5.PlayerDistCached(p17)
			if v19 and v19.dist > 100 then
				return
			end
		end
		local v20 = v18:FindFirstChild("Humanoid")
		if v20 then
			local v21 = v_u_4.Get(p17, "sprint") and 0.15 or 0.25
			if v_u_16[p17.UserId] then
				if os.clock() - v_u_16[p17.UserId] < v21 then
					return
				end
			else
				v_u_16[p17.UserId] = os.clock()
			end
			local v22 = v20:GetState()
			if v20.MoveDirection ~= Vector3.new(0, 0, 0) and (v22 == Enum.HumanoidStateType.Running and v18.PrimaryPart.Velocity.Magnitude >= 10) then
				v_u_16[p17.UserId] = os.clock()
				local v23 = v18:FindFirstChild("LeftFoot")
				local v24 = v18:FindFirstChild("RightFoot")
				if not (v23 and v24) then
					return
				end
				local v25 = v_u_8:GetAttribute("FootstepsVolume") or 0.6
				local v26 = v_u_9((v_u_15._footRaycast(v23)))
				if v26 then
					local v27 = v_u_3.newSound(v26)
					v27:attachToPart(v23)
					v27.playbackSpeed = math.random(8, 12) / 10
					v27.baseVol = v25
					v27:play()
				end
				local v28 = v_u_9((v_u_15._footRaycast(v24)))
				if v28 then
					local v29 = v_u_3.newSound(v28)
					v29:attachToPart(v24)
					v29.playbackSpeed = math.random(8, 12) / 10
					v29.baseVol = v25
					v29:play()
				end
			end
		end
	else
		return
	end
end
function v_u_15._heartbeat()
	-- upvalues: (copy) v_u_7, (copy) v_u_15
	for _, v30 in ipairs(v_u_7:GetPlayers()) do
		v_u_15._footstep(v30)
	end
end
function v_u_15.Initialize()
	-- upvalues: (copy) v_u_7, (copy) v_u_16, (copy) v_u_6, (copy) v_u_15
	v_u_7.PlayerRemoving:Connect(function(p31)
		-- upvalues: (ref) v_u_16
		v_u_16[p31.UserId] = nil
	end)
	v_u_6.Heartbeat:Connect(v_u_15._heartbeat)
end
return v_u_15