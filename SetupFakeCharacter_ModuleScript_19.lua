-- SetupFakeCharacter (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > IKHandler
-- Original

return function(p1)
	p1.Archivable = true
	local v2 = p1:Clone()
	p1.Archivable = false
	v2.HumanoidRootPart.Anchored = true
	v2.HumanoidRootPart.CFrame = CFrame.new(0, 10000, 0)
	local v3 = v2:FindFirstChild("ForceField")
	if v3 then
		v3:Destroy()
	end
	for _, v4 in ipairs(Enum.HumanoidStateType:GetEnumItems()) do
		if v4 ~= Enum.HumanoidStateType.Physics and v4 ~= Enum.HumanoidStateType.None then
			v2.Humanoid:SetStateEnabled(v4, false)
		end
	end
	v2.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	v2.Parent = workspace
	for _, v5 in ipairs(v2:GetDescendants()) do
		if v5:IsA("BasePart") then
			v5.Transparency = 1
			v5.Anchored = true
			v5.CanCollide = false
			v5.CanQuery = false
			v5.CanTouch = false
			v5.CollisionGroupId = 1
			v5.CastShadow = false
		elseif v5:IsA("Motor6D") or (v5:IsA("Motor") or (v5:IsA("Decal") or (v5:IsA("HingeConstraint") or (v5:IsA("BallSocketConstraint") or v5:IsA("NoCollisionConstraint"))))) then
			v5:Destroy()
		end
	end
	for _, v6 in ipairs(v2:GetDescendants()) do
		if v6:IsA("Accessory") or (v6:IsA("Script") or (v6:IsA("LocalScript") or (v6:IsA("Beam") or (v6:IsA("ForceField") or v6:IsA("ParticleEmitter"))))) then
			v6:Destroy()
		end
	end
	local v7 = {
		["model"] = v2,
		["humanoid"] = v2.Humanoid,
		["parts"] = {}
	}
	local v8 = v7.parts
	v8.rightupperarm = v2.RightUpperArm
	v8.leftupperarm = v2.LeftUpperArm
	v8.rightlowerarm = v2.RightLowerArm
	v8.leftlowerarm = v2.LeftLowerArm
	v8.righthand = v2.RightHand
	v8.lefthand = v2.LeftHand
	v8.rightupperleg = v2.RightUpperLeg
	v8.leftupperleg = v2.LeftUpperLeg
	v8.rightlowerleg = v2.RightLowerLeg
	v8.leftlowerleg = v2.LeftLowerLeg
	v8.rightfoot = v2.RightFoot
	v8.leftfoot = v2.LeftFoot
	v8.uppertorso = v2.UpperTorso
	return v7
end