-- StickyHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = v1.Models.Particles
local v_u_6 = require(v1.devv).load
local v_u_7 = v_u_6("Maid")
local v_u_8 = v_u_6("GUID")
v_u_6("v3sfx")
local v_u_9 = v_u_6("Signal")
local v_u_10 = v_u_6("v3items")
local v_u_11 = v_u_6("v3sound")
local v_u_12 = v_u_6("RetrieveModel")
local v_u_13 = {}
local function v_u_18(p14)
	-- upvalues: (copy) v_u_12
	local v15 = v_u_12(p14, "Items"):Clone()
	local _ = v15.PrimaryPart
	for _, v16 in ipairs(v15:GetDescendants()) do
		if v16:IsA("BasePart") then
			if v16 ~= v15.PrimaryPart then
				local v17 = Instance.new("WeldConstraint")
				v17.Part0 = v15.PrimaryPart
				v17.Part1 = v16
				v17.Parent = v16
			end
			v16.Anchored = false
			v16.CanCollide = false
		end
	end
	return v15
end
function v_u_13.Throw(p_u_19, p_u_20, p_u_21, p_u_22, p_u_23)
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_18, (copy) v_u_2, (copy) v_u_5, (copy) v_u_7, (copy) v_u_11, (copy) v_u_6, (copy) v_u_3
	local v24 = p_u_19.Character
	if v24 and (v24.Parent and v24:FindFirstChild("RightHand")) then
		local v25 = Vector3.new()
		local v26 = (p_u_20 == "Tomahawk" or p_u_20 == "Ninja Star") and Vector3.new(0, 0.5, 0) or v25
		local v27 = v24.RightHand.Position + v26
		local v28 = (p_u_23 - v27).Unit
		local v_u_29 = p_u_19 == v_u_4
		local v_u_30, _ = v_u_10.getItemData(p_u_20)
		local v31 = v_u_30.modelName or p_u_20
		local v_u_32 = v_u_30.isC4
		local v_u_33 = nil
		local v_u_34 = nil
		local v_u_35 = v_u_8()
		if v_u_29 then
			task.spawn(function()
				-- upvalues: (ref) v_u_33, (ref) v_u_34, (ref) v_u_9, (copy) v_u_35, (copy) p_u_20, (copy) p_u_21, (copy) p_u_22, (copy) p_u_23
				local v36, v37 = v_u_9.InvokeServer("throwSticky", v_u_35, p_u_20, p_u_21, p_u_22, p_u_23)
				v_u_33 = v36
				v_u_34 = v37
			end)
		end
		local v38 = v_u_30.thrownOffset or CFrame.new()
		local v_u_39 = v_u_18(v31)
		v_u_39:PivotTo(CFrame.new(v27, v27 + v28) * v38)
		v_u_39:SetAttribute("OwnerName", p_u_19.Name)
		v_u_39:SetAttribute("itemName", p_u_20)
		v_u_39.Parent = workspace.Game.Local
		for _, v40 in ipairs(v_u_39:GetDescendants()) do
			if v40:IsA("BasePart") then
				v40.Massless = true
			end
		end
		v_u_2:AddTag(v_u_39, "Throwable")
		v_u_2:AddTag(v_u_39, "Sticky")
		local v41 = v_u_39.PrimaryPart
		local v_u_42
		if v_u_30.bladePartName then
			v_u_42 = v_u_39[v_u_30.bladePartName] or v41
		else
			v_u_42 = v41
		end
		local v_u_43 = false
		local v_u_44
		if v_u_30.hasTrail then
			local v_u_45 = v_u_5.ThrowableTrail:Clone()
			v_u_45.Parent = workspace.Game.Local
			local v46 = Instance.new("Weld")
			v46.Parent = v_u_45
			v46.Part0 = v_u_45
			v46.Part1 = v41
			task.delay(10, function()
				-- upvalues: (ref) v_u_45
				if v_u_45 then
					v_u_45:Destroy()
				end
			end)
			v_u_44 = v_u_45
		else
			v_u_44 = nil
		end
		v41.AssemblyLinearVelocity = p_u_22
		local v47 = v_u_30.thrownRotVelocity
		if v47 then
			v_u_39.PrimaryPart.AssemblyAngularVelocity = v47
		end
		local v_u_48 = v_u_7.new()
		local v_u_49 = os.clock()
		local v_u_50 = OverlapParams.new({ v24 }, Enum.RaycastFilterType.Blacklist, 50, "Default")
		local function v_u_61(p_u_51)
			-- upvalues: (ref) v_u_43, (copy) p_u_19, (copy) v_u_29, (copy) v_u_39, (copy) v_u_32, (ref) v_u_2, (copy) v_u_30, (ref) v_u_11, (copy) p_u_20, (ref) v_u_6, (ref) v_u_3, (ref) v_u_33, (ref) v_u_9, (ref) v_u_34, (copy) v_u_35, (ref) v_u_44, (copy) v_u_48
			if not v_u_43 and (p_u_51 ~= nil and (p_u_51.Transparency < 1 and (p_u_51.CanCollide and not (p_u_51:IsDescendantOf(p_u_19.Character) or (p_u_51:IsDescendantOf(workspace.Game.Local) or p_u_51:IsDescendantOf(workspace.Game.Drones)))))) then
				v_u_43 = true
				if v_u_29 then
					local v52 = v_u_39.PrimaryPart.CFrame
					local v_u_53 = v52:toObjectSpace(p_u_51.CFrame)
					local v54 = Instance.new("Weld")
					v54.Part0 = v_u_39.PrimaryPart
					v54.Part1 = p_u_51
					v54.Parent = v_u_39.PrimaryPart
					v54.C0 = v_u_53
					if v_u_32 then
						v_u_2:AddTag(v_u_39, "C4")
					end
					local v_u_55 = Instance.new("Attachment")
					v_u_55.WorldCFrame = v52
					v_u_55.Parent = workspace.Terrain
					if v_u_30.impactSound then
						local v56 = v_u_11.newSound(v_u_30.impactSound)
						v56:attachToPart(v_u_55)
						v56:play()
					end
					if p_u_20 == "Snowball" and (p_u_19.Character and p_u_19.Character.PrimaryPart) then
						local v57 = (v_u_55.WorldPosition - p_u_19.Character.PrimaryPart.Position).Unit
						local v58 = {
							["material"] = Enum.Material.Snow,
							["hit"] = p_u_51,
							["position"] = v_u_55.WorldPosition + v57 * -2,
							["normal"] = v57 * -1
						}
						v_u_6("v3effect").NewEffect("impact", v58):Create()
					end
					task.delay(1, function()
						-- upvalues: (copy) v_u_55
						v_u_55:Destroy()
					end)
					task.spawn(function()
						-- upvalues: (ref) v_u_3, (ref) v_u_33, (ref) v_u_39, (ref) v_u_9, (ref) v_u_34, (ref) v_u_35, (copy) p_u_51, (copy) v_u_53, (ref) v_u_44
						repeat
							v_u_3.Heartbeat:Wait()
						until v_u_33 ~= nil
						if v_u_33 == true then
							local v59 = v_u_39.PrimaryPart and v_u_39.PrimaryPart.CFrame or CFrame.new()
							local v60 = v_u_9.InvokeServer("hitSticky", v_u_34 or v_u_35, p_u_51, v_u_53, v59)
							if v60 or not v60 then
								v_u_39:Destroy()
								if v_u_44 then
									v_u_44.Anchored = true
									return
								end
							end
						else
							v_u_39:Destroy()
							if v_u_44 then
								v_u_44.Anchored = true
							end
						end
					end)
				else
					if v_u_44 then
						v_u_44.Anchored = true
					end
					v_u_39:Destroy()
				end
				v_u_48:DoCleaning()
				return true
			end
		end
		v_u_48:GiveTask(v41.Touched:Connect(function(p62)
			-- upvalues: (copy) v_u_61
			if p62:IsA("Terrain") then
				v_u_61(p62)
			end
		end))
		v_u_48:GiveTask(v_u_3.Stepped:Connect(function()
			-- upvalues: (copy) v_u_49, (copy) v_u_42, (copy) v_u_48, (copy) v_u_50, (copy) v_u_61
			if os.clock() - v_u_49 >= 10 or not v_u_42 then
				v_u_48:DoCleaning()
			else
				local v63 = workspace:GetPartsInPart(v_u_42, v_u_50)
				for _, v64 in ipairs(v63) do
					if v_u_61(v64) then
						break
					end
				end
			end
		end))
	end
end
local v_u_65 = {}
function v_u_13.Add(p66)
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_65, (copy) v_u_4, (copy) v_u_11
	local v67 = p66:GetAttribute("OwnerName")
	local v68 = p66:GetAttribute("itemName")
	local v69 = v_u_2:HasTag(p66, "C4")
	local v70 = v_u_10.getItemData(v68).maxLifetime or 60
	v_u_65[p66] = {
		["placedAt"] = os.clock(),
		["lifetime"] = v70,
		["ownerName"] = v67,
		["itemName"] = v68,
		["isC4"] = v69
	}
	if v69 and v67 ~= v_u_4.Name then
		local v71 = v_u_11.newSound("c4Hit")
		v71:attachToPart(p66.PrimaryPart)
		v71:play()
	end
end
function v_u_13.Remove(p72)
	-- upvalues: (copy) v_u_65
	v_u_65[p72] = nil
end
function v_u_13._doC4Loop()
	-- upvalues: (copy) v_u_65
	local v73 = false
	while true do
		v73 = not v73
		local v74 = v73 and Color3.fromRGB(167, 0, 0) or Color3.new(0, 0, 0)
		for v75, v76 in pairs(v_u_65) do
			if os.clock() > v76.placedAt + v76.lifetime then
				v75:Destroy()
			elseif v76.isC4 and v75 ~= nil then
				if v75.Parent ~= nil then
					local v77 = v75:FindFirstChild("Light")
					if v77 then
						v77.Color = v74
					end
				end
			end
		end
		task.wait(0.5)
	end
end
function v_u_13.Initialize()
	-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_2
	v_u_9.LinkSignal("replicateThrow", v_u_13.Throw)
	v_u_2:GetInstanceAddedSignal("Sticky"):Connect(v_u_13.Add)
	v_u_2:GetInstanceRemovedSignal("Sticky"):Connect(v_u_13.Remove)
	for _, v78 in ipairs(v_u_2:GetTagged("Sticky")) do
		task.spawn(v_u_13.Add, v78)
	end
	task.defer(v_u_13._doC4Loop)
end
return v_u_13