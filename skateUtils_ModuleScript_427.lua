-- skateUtils (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > gameSpecific
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = workspace.CurrentCamera
require(v2.devv).load("Signal")
function v1.CanPlaceBoard(p5)
	if p5 then
		local v6 = p5.Character
		if v6 then
			v6 = v6.PrimaryPart
		end
		if v6 then
			local v7 = RaycastParams.new()
			v7.FilterType = Enum.RaycastFilterType.Exclude
			v7.FilterDescendantsInstances = { p5.Character }
			local v8 = workspace:Raycast(v6.Position, Vector3.new(-0, -12, -0), v7)
			return v8 and v8.Instance and true or false
		end
	end
end
function v1.OnBoard(p9)
	return workspace.Game.Skateboards:FindFirstChild(p9.Name) ~= nil
end
function v1.OnBike(p10)
	for _, v11 in workspace.Game.Bikes:GetChildren() do
		if v11:GetAttribute("driver") == p10.Name then
			return true
		end
	end
	return false
end
function v1.GetHoverboardRaycast(p12, _)
	-- upvalues: (copy) v_u_3
	local v13 = RaycastParams.new()
	v13.FilterType = Enum.RaycastFilterType.Exclude
	v13.FilterDescendantsInstances = { v_u_3.Character, p12, workspace.Game.Local }
	if p12:IsA("Model") then
		p12 = p12.PrimaryPart
	end
	local v14 = p12.Position
	local v15 = v_u_3.Character
	if v15 then
		v15 = v15.PrimaryPart
	end
	if v15 then
		v14 = v15.Position
	end
	local v16 = v14 + Vector3.new(0, 1, 0)
	return workspace:Raycast(v16, -p12.CFrame.UpVector * 5 * 5, v13)
end
function v1.GetFloorNormal(p17, p18)
	-- upvalues: (copy) v_u_3
	local v19 = RaycastParams.new()
	v19.FilterType = Enum.RaycastFilterType.Exclude
	v19.FilterDescendantsInstances = { v_u_3.Character, p17, workspace.Game.Local }
	if p17:IsA("Model") then
		p17 = p17.PrimaryPart
	end
	local v20 = p18 and 5 or 1
	local v21 = (p17.CFrame * CFrame.new(0, 0, -2)).Position
	if p18 then
		v21 = v21 + Vector3.new(0, 5, 0)
	end
	local v22 = workspace:Raycast(v21, -p17.CFrame.UpVector * 5 * v20, v19)
	if v22 then
		local v23 = v22.Normal
		if v23:Cross(Vector3.new(0, 1, 0)):Cross(v23).Magnitude == 0 then
			local v24 = p17.Position
			local v25 = workspace:Raycast(v24, -p17.CFrame.UpVector * 5 * v20, v19)
			if v25 then
				local v26 = v25.Position
				local v27 = v22.Position
				if v27.Y - v26.Y > 0 then
					local v28 = (v26 + v27) * 0.5
					return CFrame.lookAt(v28, v27).UpVector
				end
			end
		end
	end
	if v22 then
		v22 = v22.Normal
	end
	return v22
end
function v1.GetRotationFromNormal(p29, p30, p31)
	local v32 = p30:Cross(p31)
	return CFrame.fromMatrix(p29, v32.Unit, p31).Rotation
end
function v1.GetAccurateMoveDirection(p33)
	-- upvalues: (copy) v_u_4
	local v34 = CFrame.lookAt(Vector3.new(), p33)
	local v35 = v_u_4.CFrame.LookVector * Vector3.new(1, 0, 1)
	return (CFrame.lookAt(v34.Position, v34.Position + v35) * v34).LookVector
end
function v1.SetHumanoidEnabled(p36, p37, p38)
	if p38 then
		return
	else
		local v39 = p36.Character
		local v40
		if v39 then
			v40 = v39:FindFirstChild("Humanoid")
		else
			v40 = v39
		end
		if v40 then
			local v41 = v39:FindFirstChild("Animate")
			if v41 then
				v41.Enabled = p37
			end
			for _, v42 in ipairs(v40:GetPlayingAnimationTracks()) do
				v42:Stop(0)
			end
			for _, v43 in pairs(Enum.HumanoidStateType:GetEnumItems()) do
				if v43 ~= Enum.HumanoidStateType.Physics and (v43 ~= Enum.HumanoidStateType.Dead and (v43 ~= Enum.HumanoidStateType.None and (v43 ~= Enum.HumanoidStateType.RunningNoPhysics and v43 ~= Enum.HumanoidStateType.StrafingNoPhysics))) then
					v40:SetStateEnabled(v43, p37)
				end
			end
			v40:ChangeState(p37 and Enum.HumanoidStateType.GettingUp or Enum.HumanoidStateType.Physics)
		end
	end
end
return v1