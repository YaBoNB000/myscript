-- v3vehicle (ModuleScript)
-- ReplicatedStorage > devv > client > Objects
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load
local v_u_3 = v_u_2("HumanoidReadyUtil")
local v_u_4 = v_u_2("GetCharacterMass")
local v_u_5 = v_u_2("ClientRagdoll")
local v_u_6 = v_u_2("legacyImpulse")
v_u_2("getRootModel")
v_u_2("shallowCopy")
v_u_2("printTable")
local v_u_7 = v_u_2("deepCopy")
local v_u_8 = v_u_2("FFCChain")
v_u_2("v3sound")
v_u_2("Promise")
v_u_2("Signal")
local v_u_9 = v_u_2("object")
local v_u_10 = v_u_2("Signal")
local v_u_11 = v_u_2("spring")
local v_u_12 = v_u_2("state")
local v_u_13 = v_u_2("clean")
local v_u_14 = v_u_2("sleep")
local v_u_15 = v_u_2("Maid")
v_u_2("GUID")
v_u_12.vehicles = {}
v_u_12.vehiclesByGUID = {}
local v_u_16 = game:GetService("ProximityPromptService")
local v_u_17 = game:GetService("Players").LocalPlayer
local v_u_18 = {}
local v_u_19 = {
	["Car"] = require(script.bin.Car),
	["Heli"] = require(script.bin.Heli)
}
local v_u_20 = require(script.bin.baseVehicle)
local function v_u_24(p21, p22)
	for _, v23 in ipairs(p21:GetDescendants()) do
		if v23:IsA("ProximityPrompt") then
			v23.Enabled = p22
		end
	end
end
local function v_u_30(p25, p26)
	-- upvalues: (copy) v_u_24, (copy) v_u_17
	local v27 = p25.model
	if p26 and p26.Occupant then
		v_u_24(p26, false)
	elseif p26 and not p26.Occupant then
		v_u_24(p26, true)
	end
	if p26 and p26.Occupant then
		if v_u_17.Character and (v_u_17.Character:FindFirstChild("Humanoid") and p26.Occupant == v_u_17.Character.Humanoid) then
			p25.replicator:deactivate()
			local v28 = {
				["model"] = v27,
				["driversSeat"] = p26,
				["pilotsSeat"] = p26,
				["vehicle"] = p25,
				[string.lower(p25.type)] = p25
			}
			p25.controller:activate(v28)
			return
		end
	else
		local v29 = {
			["model"] = v27,
			[string.lower(p25.type)] = p25
		}
		p25.replicator:activate(v29)
	end
end
function v_u_18.NewVehicle(p_u_31)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_19, (copy) v_u_9, (copy) v_u_20, (copy) v_u_15, (copy) v_u_11, (copy) v_u_24, (copy) v_u_30, (copy) v_u_12, (copy) v_u_10
	local v32 = p_u_31.Name
	local v33 = p_u_31:WaitForChild("GUID").Value
	local v34 = v_u_2("v3vehicles")
	local v35 = v34.vehicles[v32].type
	local v36 = v_u_7(v34.vehicles[v32].data)
	local v_u_37 = v_u_9(v_u_19[v35] or v_u_20):new()
	v_u_37.type = v35
	for v38, v39 in pairs(v36) do
		v_u_37[v38] = v39
	end
	v_u_37.maid = v_u_15.new()
	v_u_37.masked = false
	v_u_37.guid = v33
	v_u_37.sounds = {}
	v_u_37.model = p_u_31
	v_u_37.particles = {}
	local v40 = {
		["FrontLeft"] = {
			["animSpring"] = v_u_11.new(0.15, 2, 0),
			["collisionSpringOffset"] = 0,
			["collisionSpringGoal"] = 0,
			["externalOffset"] = 0
		},
		["FrontRight"] = {
			["animSpring"] = v_u_11.new(0.15, 2, 0),
			["collisionSpringOffset"] = 0,
			["collisionSpringGoal"] = 0,
			["externalOffset"] = 0
		},
		["Front"] = {
			["animSpring"] = v_u_11.new(0.15, 2, 0),
			["collisionSpringOffset"] = 0,
			["collisionSpringGoal"] = 0,
			["externalOffset"] = 0
		}
	}
	if v35 ~= "Heli" then
		v40.BackLeft = {
			["animSpring"] = v_u_11.new(0.15, 2, 0),
			["collisionSpringOffset"] = 0,
			["collisionSpringGoal"] = 0,
			["externalOffset"] = 0
		}
		v40.BackRight = {
			["animSpring"] = v_u_11.new(0.15, 2, 0),
			["collisionSpringOffset"] = 0,
			["collisionSpringGoal"] = 0,
			["externalOffset"] = 0
		}
		v40.Back = {
			["animSpring"] = v_u_11.new(0.15, 2, 0),
			["collisionSpringOffset"] = 0,
			["collisionSpringGoal"] = 0,
			["externalOffset"] = 0
		}
		v40.Top = {
			["animSpring"] = v_u_11.new(0.15, 2, 0),
			["collisionSpringOffset"] = 0,
			["collisionSpringGoal"] = 0,
			["externalOffset"] = 0
		}
	end
	v40.Left = {
		["animSpring"] = v_u_11.new(0.15, 2, 0),
		["collisionSpringOffset"] = 0,
		["collisionSpringGoal"] = 0,
		["externalOffset"] = 0
	}
	v_u_37.boneOffsets = v40
	local function v_u_43()
		-- upvalues: (copy) p_u_31, (ref) v_u_37, (ref) v_u_24
		local v41 = p_u_31
		if v41 then
			v41 = p_u_31:FindFirstChild("Seats")
		end
		if v41 then
			for _, v42 in ipairs(v41:GetChildren()) do
				if v42.Name ~= "DriversSeat" and v42.Name ~= "PilotsSeat" then
					if v42 and v42.Occupant then
						v_u_24(v42, false)
					elseif v42 and not v42.Occupant then
						v_u_24(v42, true)
					end
				end
			end
		end
	end
	for _, v_u_44 in ipairs(p_u_31.Seats:GetChildren()) do
		local v45 = v_u_44.Name == "DriversSeat" and true or v_u_44.Name == "PilotsSeat"
		v_u_24(v_u_44, true)
		if v45 then
			v_u_37.driversSeat = v_u_44
			v_u_37.pilotsSeat = v_u_44
			v_u_44:GetPropertyChangedSignal("Occupant"):Connect(function()
				-- upvalues: (copy) v_u_43, (ref) v_u_30, (ref) v_u_37, (copy) v_u_44
				v_u_43()
				v_u_30(v_u_37, v_u_44)
			end)
			v_u_30(v_u_37, v_u_44)
		else
			v_u_44:GetPropertyChangedSignal("Occupant"):Connect(function()
				-- upvalues: (copy) v_u_43, (ref) v_u_37, (copy) v_u_44, (ref) v_u_24
				v_u_43()
				local v46 = v_u_44
				if v46 and v46.Occupant then
					v_u_24(v46, false)
				elseif v46 and not v46.Occupant then
					v_u_24(v46, true)
				end
			end)
			if v_u_44 and v_u_44.Occupant then
				v_u_24(v_u_44, false)
			elseif v_u_44 and not v_u_44.Occupant then
				v_u_24(v_u_44, true)
			end
		end
	end
	v_u_12.vehicles[p_u_31] = v_u_37
	v_u_12.vehiclesByGUID[v_u_37.guid] = v_u_37
	v_u_10.FireServer("requestVehicleProperties", p_u_31)
	return v_u_37
end
local function v_u_48(p47)
	-- upvalues: (copy) v_u_12, (copy) v_u_18
	if v_u_12.vehicles[p47] == nil then
		v_u_18.NewVehicle(p47)
	end
end
local function v_u_54(p49)
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	local v50 = v_u_12.vehicles[p49]
	if v50 then
		v50.maid:DoCleaning()
		local v51 = v50.guid
		if v50.particles then
			for v52, v53 in pairs(v50.particles) do
				if v53.clean then
					v53:clean()
				end
				v50.particles[v52] = nil
			end
			v50.particles = nil
		end
		v_u_12.vehicles[p49] = nil
		v_u_12.vehiclesByGUID[v51] = nil
		v_u_13(v_u_12.vehicles[p49])
		v_u_13(v_u_12.vehiclesByGUID[v51])
	end
end
local v_u_55 = 0
local function v_u_66(p56)
	-- upvalues: (copy) v_u_17, (ref) v_u_55, (copy) v_u_5, (copy) v_u_14, (copy) v_u_4
	local v57 = v_u_17.Character
	local v58
	if v57 then
		v58 = v57:FindFirstChild("Humanoid")
	else
		v58 = v57
	end
	local v59
	if v57 then
		v59 = v57:FindFirstChild("HumanoidRootPart")
	else
		v59 = v57
	end
	if os.clock() - v_u_55 >= 2 and (v57 and (v58 and (v59 and (v_u_17:DistanceFromCharacter(p56.PrimaryPart.Position) <= 50 and v58.SeatPart == nil)))) then
		v_u_55 = os.clock()
		local v60 = p56.PrimaryPart.Velocity.magnitude
		local v61 = math.min(100, v60) / 100
		if v58:GetState() ~= Enum.HumanoidStateType.Dead then
			v_u_5.SetRagdoll(v_u_17, true)
			v_u_14(v61 * 1 + 2):doneCall(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_17
				v_u_5.SetRagdoll(v_u_17, false)
			end)
		end
		local v62 = (v59.Position - p56.PrimaryPart.Position).Unit
		local v63 = v_u_4(v57)
		local v64 = math.random(850, 1000) / 100 * v61
		local v_u_65 = Instance.new("BodyVelocity")
		v_u_65:SetAttribute("whitelist", true)
		v_u_65.Velocity = v62 * v63 * v64
		v_u_65.MaxForce = Vector3.new(1, 1, 1) * (1 / 0)
		v_u_65.Parent = v59
		task.delay(0.25, function()
			-- upvalues: (copy) v_u_65
			v_u_65:Destroy()
		end)
	end
end
local v_u_67 = 0
local function v_u_78(p68, p69)
	-- upvalues: (copy) v_u_17, (ref) v_u_67, (copy) v_u_8, (copy) v_u_6
	local v70 = v_u_17.Character
	local v71
	if v70 then
		v71 = v70:FindFirstChild("Humanoid")
	else
		v71 = v70
	end
	local v72
	if v71 then
		v72 = v71.SeatPart
	else
		v72 = v71
	end
	if os.clock() - v_u_67 >= 1 and (v70 and (v71 and (v72 and v72:IsA("VehicleSeat")))) then
		v_u_67 = os.clock()
		local v73 = v72.Parent.Parent
		local v74 = p68.PrimaryPart.Velocity.magnitude
		local _ = math.min(200, v74) / 200
		local _ = p68.PrimaryPart.CFrame.LookVector:Dot(v73.PrimaryPart.CFrame.LookVector) <= 0.9
		local v75 = p69 or p68.PrimaryPart.Position
		local v76 = p68.PrimaryPart.CFrame.LookVector
		local v77 = p68.PrimaryPart.Velocity * 0.5
		v_u_6(v_u_8(v73, "Body", "Exterior"), v75, v76, v77, 0.1)
	end
end
local function v_u_84(p79, p80)
	-- upvalues: (copy) v_u_12
	local v81 = v_u_12.vehicles[p79]
	local v82
	if p80 then
		v82 = p80.guid
	else
		v82 = p80
	end
	local v83 = v_u_12.worldPropsByGUID[v82] or v_u_12.worldSubpropsByGUID[v82]
	if v83 and v83.vehicleImpactHitreg then
		v83:vehicleImpactHitreg(v81, p80.pos)
	end
end
local function v_u_85()
	-- upvalues: (copy) v_u_17
	if v_u_17.Character then
		v_u_17.Character:PivotTo(CFrame.new(v_u_17.Character.PrimaryPart.Position + Vector3.new(0, 7, 0)))
	end
end
function v_u_18.Initialize()
	-- upvalues: (copy) v_u_10, (copy) v_u_78, (copy) v_u_66, (copy) v_u_84, (copy) v_u_85, (copy) v_u_48, (copy) v_u_54, (copy) v_u_12, (copy) v_u_18, (copy) v_u_3, (copy) v_u_17, (copy) v_u_16
	v_u_10.LinkSignal("vehicleVehicleImpact", v_u_78)
	v_u_10.LinkSignal("vehiclePlayerImpact", v_u_66)
	v_u_10.LinkSignal("vehiclePropImpact", v_u_84)
	v_u_10.LinkSignal("exitVehicle", v_u_85)
	local v86 = workspace.Game.Vehicles
	v86.ChildAdded:Connect(v_u_48)
	v86.ChildRemoved:Connect(v_u_54)
	for _, v87 in pairs(v86:GetChildren()) do
		if v_u_12.vehicles[v87] == nil then
			v_u_18.NewVehicle(v87)
		end
	end
	v_u_10.FireServer("vehiclePropertyBuilder")
	v_u_3.registerHumanoidReady(function(p88, _, p_u_89)
		-- upvalues: (ref) v_u_17, (ref) v_u_16
		if p88 == v_u_17 then
			local v_u_90 = nil
			local v_u_91 = nil
			v_u_16.Enabled = true
			v_u_90 = p_u_89:GetPropertyChangedSignal("SeatPart"):Connect(function()
				-- upvalues: (copy) p_u_89, (ref) v_u_16
				if p_u_89.SeatPart and not (p_u_89.SeatPart:IsDescendantOf(workspace.Map.Buildings) or (p_u_89.SeatPart:IsDescendantOf(workspace.RecordingStudio) or (p_u_89.SeatPart:IsDescendantOf(workspace.ServerFurniture) or (p_u_89.SeatPart:IsDescendantOf(workspace.HousingPlots) or p_u_89.SeatPart:IsDescendantOf(workspace.Game.Bikes))))) then
					v_u_16.Enabled = false
				else
					v_u_16.Enabled = true
				end
			end)
			v_u_91 = p_u_89.Died:Connect(function()
				-- upvalues: (ref) v_u_90, (ref) v_u_91, (ref) v_u_16
				v_u_90:Disconnect()
				v_u_91:Disconnect()
				task.defer(function()
					-- upvalues: (ref) v_u_16
					v_u_16.Enabled = false
				end)
			end)
		end
	end)
end
return v_u_18