-- FurniturePlacer (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
game:GetService("StarterGui")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v_u_6 = v_u_5:GetMouse()
local v_u_7 = workspace.CurrentCamera
local v_u_8 = require(v_u_2.devv).load
local v_u_9 = v_u_8("PartHighligher")
local v_u_10 = v_u_8("RetrieveModel")
local v_u_11 = v_u_8("skateUtils")
local v_u_12 = v_u_8("makeToast")
local v_u_13 = v_u_8("v3sound")
local v_u_14 = v_u_8("Signal")
local v_u_15 = v_u_8("Maid")
local v_u_16 = require(script.utils)
local v_u_17 = { "Trampoline" }
local function v_u_22(p18, p19)
	-- upvalues: (copy) v_u_16
	local v20 = p19.Model:FindFirstChild("Floor")
	if not v20 then
		return false
	end
	for _, v21 in ipairs(v20:GetChildren()) do
		if v21:IsA("BasePart") and v_u_16.IsPointInPartIgnoreY(p18, v21, 2) then
			return true
		end
	end
	return false
end
function v_u_1.new()
	-- upvalues: (copy) v_u_1, (copy) v_u_9, (copy) v_u_15
	local v23 = {
		["__index"] = v_u_1
	}
	local v24 = setmetatable({}, v23)
	v24._model = nil
	v24._building = nil
	v24._originalParent = nil
	v24._originalCFrame = nil
	v24._rotation = table.create(3, 0)
	v24._lastRotation = table.create(3, 0)
	v24._lastCFrame = CFrame.new()
	v24._placeGui = nil
	v24._isMoving = false
	v24._isOldModel = false
	v24._canPlace = true
	v24._corners = {}
	v24._floors = {}
	v24._lastClicked = os.clock()
	v24._handles = nil
	v24._initialHandleCFrame = nil
	v24._isDragging = false
	v24._highlighter = v_u_9.new()
	v24._maid = v_u_15.new()
	return v24
end
function v_u_1.Start(p_u_25, p_u_26, p_u_27, p_u_28, p29)
	-- upvalues: (copy) v_u_5, (copy) v_u_17, (copy) v_u_12, (copy) v_u_11, (copy) v_u_14, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_2, (copy) v_u_3, (copy) v_u_13, (copy) v_u_4
	if p_u_25._model and p_u_25._model.Name == p_u_26 then
		p_u_25:Stop()
		return false
	end
	if v_u_5:GetAttribute("placementMode") == "Advanced" and table.find(v_u_17, p_u_26) then
		p_u_25:Stop()
		v_u_12("You cannot use advanced building on this furniture!", "red", 3)
		return false
	end
	if v_u_11.OnBike(v_u_5) then
		v_u_14.FireServer("getOffBike")
		task.defer(function()
			-- upvalues: (ref) v_u_5
			local v30 = v_u_5.Character
			if v30 then
				v30 = v30:FindFirstChild("Humanoid")
			end
			if v30 then
				for _, v31 in v30:GetPlayingAnimationTracks() do
					v31:Stop(0)
				end
			end
		end)
	end
	if p_u_28 then
		local v32 = p_u_28:GetAttribute("furnitureName") or p_u_28.Name
		local v33 = p_u_28:GetAttribute("isSpinning")
		if v33 ~= nil and v33 then
			p_u_25:Stop()
			return false
		end
		local v34 = v_u_5.Character
		if v34 then
			v34 = v34:FindFirstChild("Humanoid")
		end
		if v34 and v34.SeatPart ~= nil then
			v34.Sit = false
		end
		local v35 = 0
		local v36 = 0
		for _, v37 in p_u_28:GetDescendants() do
			if v37:IsA("Seat") or v37:IsA("VehicleSeat") then
				v35 = v35 + 1
				if v37.Occupant ~= nil then
					v36 = v36 + 1
				end
			elseif v37:IsA("ClickDetector") then
				v37.MaxActivationDistance = 0
			end
		end
		if v32 == "SlotMachine" then
			local v38 = p_u_28:FindFirstChild("ProximityPrompt", true)
			if p_u_28 and v38.Enabled then
				v38.Enabled = false
				p_u_28:SetAttribute("hasPromptEnabled", true)
			end
		end
		if v32 == "SlotMachine" and v36 > 0 then
			p_u_25:Stop()
			return false
		end
		if v32 == "ColorSpinner" then
			if p_u_28:GetAttribute("isSpinning") then
				return false
			end
			for _, v39 in p_u_28.Spinner:GetDescendants() do
				if v39:IsA("BasePart") then
					v39.Transparency = 1
				end
			end
		end
		if v35 > 0 then
			v_u_14.InvokeServer("actionFurniture", p_u_27, "disableSeats")
		end
	end
	p_u_25:Stop()
	p_u_25._buildType = v_u_8("ClientHouse").BuildDetection:GetBuildType()
	local v_u_40 = p_u_25._building
	if not v_u_40 then
		print("No building")
		return false
	end
	if p_u_28 then
		local v41 = p_u_28:GetAttribute("rx") or 0
		local v42 = p_u_28:GetAttribute("ry") or 0
		local v43 = p_u_28:GetAttribute("rz") or 0
		p_u_25._rotation = { v41 * 3.141592653589793, v42 * 3.141592653589793, v43 * 3.141592653589793 }
		p_u_25._lastRotation = table.clone(p_u_25._rotation)
		p_u_25._originalParent = p_u_28.Parent
		p_u_25._originalCFrame = p_u_28:GetPivot()
	end
	local v_u_44 = p_u_28 or v_u_10(p_u_26, "Furniture"):Clone()
	v_u_44.Parent = v_u_7
	if p_u_28 or p29 then
		if p29 then
			v_u_44:PivotTo(p29)
		end
	else
		local v45 = p_u_25:_getSpawnCFrame(p_u_26)
		if not v45 then
			p_u_25:Stop()
			v_u_12("You cannot place furniture here!", "red", 3)
			if v_u_44 and v_u_44.Parent then
				v_u_44:Destroy()
			end
			return
		end
		for _, v46 in ipairs(v_u_44:GetDescendants()) do
			if v46:IsA("Seat") or v46:IsA("VehicleSeat") then
				v46:Destroy()
			end
		end
		v_u_44:PivotTo(v45)
	end
	local v47 = v_u_5:GetAttribute("placementMode") or "Basic"
	local v48 = v_u_5:GetAttribute("placementTool") or "Move"
	local v_u_49 = nil
	local v50 = nil
	local v51 = nil
	if v47 == "Basic" then
		v_u_49 = v_u_2.Guis.BillboardGuis.PlaceBillboard:Clone()
		v_u_49.Adornee = v_u_44.PrimaryPart
		v_u_49.Parent = v_u_5.PlayerGui
	elseif v47 == "Advanced" then
		v51 = v_u_2.Guis.BillboardGuis.AdvancedPlaceBillboard:Clone()
		v51.Adornee = v_u_44.PrimaryPart
		v51.Parent = v_u_5.PlayerGui
		if v48 == "Move" then
			v50 = Instance.new("Handles")
			v50.Color3 = Color3.new(1, 0.576379, 0)
			v50.Style = Enum.HandlesStyle.Movement
			v50.Visible = true
			v50.Adornee = v_u_44.PrimaryPart
			v50.Parent = v_u_5.PlayerGui
		elseif v48 == "Rotate" then
			v50 = Instance.new("ArcHandles")
			v50.Color3 = Color3.new(0, 0.666667, 1)
			v50.Visible = true
			v50.Adornee = v_u_44.PrimaryPart
			v50.Parent = v_u_5.PlayerGui
		end
		p_u_25._advancedPlaceGui = v51
	end
	if v_u_3.GamepadEnabled and v_u_49 then
		v_u_49.Holder.Rotate.Visible = false
		v_u_49.Holder.Pickup.Visible = false
	end
	for _, v52 in ipairs(v_u_44:GetDescendants()) do
		if v52:IsA("BasePart") then
			v52.Anchored = true
			v52.CollisionGroupId = 1
		end
	end
	p_u_25._isOldModel = p_u_28 ~= nil
	p_u_25._model = v_u_44
	p_u_25._placeGui = v_u_49
	p_u_25._handles = v50
	p_u_25._highlighter:SetModel(v_u_44)
	v_u_5:SetAttribute("isPlacingFurniture", true)
	local function v_u_72()
		-- upvalues: (copy) p_u_25, (copy) v_u_44, (copy) p_u_27, (copy) p_u_26, (ref) v_u_7, (ref) v_u_14, (ref) v_u_8, (copy) v_u_40, (ref) v_u_12, (ref) v_u_13
		if p_u_25._canPlace then
			if v_u_44 and v_u_44.Parent then
				if p_u_27 then
					local v53 = v_u_44:GetAttribute("furnitureName")
					if v53 then
						if v53 == "PunchingBag" then
							for _, v54 in v_u_44.Bag:GetChildren() do
								if v54:IsA("BasePart") then
									v54.Anchored = false
								end
							end
						elseif v53 == "TrophyShelf" then
							for _, v55 in v_u_44:GetDescendants() do
								if v55:IsA("ClickDetector") then
									v55.MaxActivationDistance = v55:GetAttribute("maxActivationDistance") or 10
								end
							end
						elseif v53 == "SlotMachine" and (v_u_44 and v_u_44:GetAttribute("hasPromptEnabled")) then
							v_u_44:SetAttribute("hasPromptEnabled", nil)
							local v56 = v_u_44:FindFirstChild("ProximityPrompt", true)
							if v56 then
								v56.Enabled = true
							end
						end
					end
					if not p_u_25._isOldModel and p_u_26 ~= "TrophyShelf" then
						local v_u_57 = v_u_44:Clone()
						v_u_57.Parent = v_u_7
						task.delay(0.5, function()
							-- upvalues: (copy) v_u_57
							v_u_57:Destroy()
						end)
					end
					local v58 = p_u_25._rotation[1] / 3.141592653589793
					local v59 = p_u_25._rotation[2] / 3.141592653589793
					local v60 = p_u_25._rotation[3] / 3.141592653589793
					v_u_14.InvokeServer("moveFurniture", p_u_27, v_u_44:GetPivot(), v58, v59, v60)
				else
					local v61 = v_u_8("furniture")
					local v62 = v61[v_u_44.Name]
					if v62 then
						v62 = v61[v_u_44.Name].limit
					end
					if v62 then
						local v63 = 0
						for _, v64 in v_u_40.Furniture:GetChildren() do
							if v64 and v64:GetAttribute("furnitureName") == v_u_44.Name then
								v63 = v63 + 1
							end
						end
						if v62 <= v63 then
							v_u_12(string.format("You have reached your limit! (%s/%s)", v63, v62), "red", 3)
							return
						end
					end
					if not p_u_25._isOldModel and p_u_26 ~= "TrophyShelf" then
						local v_u_65 = v_u_44:Clone()
						v_u_65.Parent = v_u_7
						task.delay(0.5, function()
							-- upvalues: (copy) v_u_65
							v_u_65:Destroy()
						end)
					end
					local v66 = p_u_25._rotation[1] / 3.141592653589793
					local v67 = p_u_25._rotation[2] / 3.141592653589793
					local v68 = p_u_25._rotation[3] / 3.141592653589793
					local v69, v70 = v_u_14.InvokeServer("placeFurniture", v_u_44.Name, v_u_44:GetPivot(), v66, v67, v68)
					if v69 then
						v_u_8("ClientHouse").Furniture.onFurniturePlaced:Fire(v_u_44.Name, v70)
					end
				end
				local v71 = v_u_13.newSound("itemPlaced")
				v71.isUI = true
				v71:play()
				p_u_25:Stop()
			end
		else
			return
		end
	end
	local function v_u_82()
		-- upvalues: (copy) p_u_28, (copy) p_u_27, (copy) v_u_44, (ref) v_u_8, (ref) v_u_12, (ref) v_u_14, (ref) v_u_13, (copy) p_u_25
		local v73 = p_u_28
		if v73 then
			v73 = p_u_27
		end
		local v74 = v73 and p_u_28:GetAttribute("furnitureName") or v_u_44.Name
		local v75 = v_u_8("furniture")
		if v75[v74] and v75[v74].furnitureType == "GemDisplay" then
			local v76 = 0
			for _, v77 in v_u_44:GetChildren() do
				if string.find(v77.Name, "GemPlacement") and v77:GetAttribute("gemName") then
					v76 = v76 + 1
				end
			end
			if v76 > 0 then
				v_u_12("You need to pickup your gems first!", "red", 3)
				return
			end
		end
		if p_u_28 then
			p_u_28:Destroy()
		end
		local v78 = v_u_8("ClientHouse")
		if v73 then
			local v79, v80 = v_u_14.InvokeServer("pickupFurniture", p_u_27)
			if v79 then
				v78.Furniture.onFurniturePicked:Fire(v74, v80, v73)
			end
		else
			v78.Furniture.onFurniturePicked:Fire(v74, nil, false)
		end
		local v81 = v_u_13.newSound("itemDestroyed")
		v81.isUI = true
		v81:play()
		p_u_25:Stop()
	end
	local function v_u_84()
		-- upvalues: (copy) p_u_25, (copy) p_u_28, (ref) v_u_3, (ref) v_u_8, (ref) v_u_49
		p_u_25._isMoving = false
		if p_u_28 and p_u_28.Parent then
			p_u_28:SetAttribute("isMoving", nil)
		end
		if v_u_3.GamepadEnabled then
			local v83 = v_u_8("GuiLoader").Get("BuildMenu")
			if v83 then
				v83.Holder.Console.Visible = false
				return
			end
		elseif v_u_49 then
			if not v_u_49:FindFirstChild("Holder") then
				return
			end
			v_u_49.Holder.Rotate.Visible = true
			v_u_49.Holder.Pickup.Visible = true
		end
	end
	local function v86()
		-- upvalues: (copy) v_u_44, (copy) p_u_25, (copy) p_u_28, (copy) p_u_27, (copy) p_u_26
		local v85
		if v_u_44 and v_u_44.Parent then
			v85 = v_u_44:GetPivot()
		else
			v85 = nil
		end
		p_u_25:Stop()
		p_u_25._rotation = table.create(3, 0)
		p_u_25._lastRotation = table.create(3, 0)
		if p_u_28 then
			if v_u_44 and (v_u_44.Parent and p_u_27) then
				p_u_25:Start(p_u_26, p_u_27, p_u_28)
				return
			end
		elseif p_u_26 then
			p_u_25:Start(p_u_26, nil, nil, v85)
		end
	end
	p_u_25._maid:GiveTask(v_u_5:GetAttributeChangedSignal("placementMode"):Connect(v86))
	p_u_25._maid:GiveTask(v_u_5:GetAttributeChangedSignal("placementTool"):Connect(v86))
	if v_u_49 then
		p_u_25._maid:GiveTask(v_u_4.Heartbeat:Connect(function()
			-- upvalues: (copy) p_u_25
			p_u_25:_step()
		end))
		local v87 = v_u_49.Holder
		if v_u_3.TouchEnabled then
			p_u_25._maid:GiveTask(v87.Move.Button.MouseButton1Down:Connect(function()
				-- upvalues: (copy) p_u_25, (copy) p_u_28, (ref) v_u_3, (ref) v_u_49
				p_u_25._isMoving = true
				if p_u_28 and p_u_28.Parent then
					p_u_28:SetAttribute("isMoving", true)
				end
				if not v_u_3.GamepadEnabled and v_u_49 then
					if not v_u_49:FindFirstChild("Holder") then
						return
					end
					v_u_49.Holder.Rotate.Visible = false
					v_u_49.Holder.Pickup.Visible = false
				end
			end))
			p_u_25._maid:GiveTask(v87.Rotate.Button.MouseButton1Down:Connect(function()
				-- upvalues: (copy) p_u_25
				p_u_25._rotation[2] = (p_u_25._rotation[2] + 1.5707963267948966) % 6.283185307179586
			end))
			p_u_25._maid:GiveTask(v87.Pickup.Button.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_82
				v_u_82()
			end))
			p_u_25._maid:GiveTask(v_u_3.TouchEnded:Connect(function()
				-- upvalues: (ref) v_u_5, (copy) v_u_84
				local v88 = v_u_5.Character
				if v88 then
					v88 = v88:FindFirstChild("Humanoid")
				end
				if v88 and v88.MoveDirection.Magnitude <= 0 then
					v_u_84()
				end
			end))
			task.defer(function()
				-- upvalues: (copy) p_u_25, (ref) v_u_3, (copy) v_u_72
				p_u_25._maid:GiveTask(v_u_3.TouchTapInWorld:Connect(function(_, p89)
					-- upvalues: (ref) v_u_72
					if not p89 then
						v_u_72()
					end
				end))
			end)
		elseif v_u_3.GamepadEnabled then
			task.delay(0.1, function()
				-- upvalues: (copy) p_u_25, (ref) v_u_3, (copy) p_u_28, (ref) v_u_49, (copy) v_u_84, (copy) v_u_72, (copy) v_u_82
				p_u_25._maid:GiveTask(v_u_3.InputBegan:Connect(function(p90, _)
					-- upvalues: (ref) p_u_25, (ref) p_u_28, (ref) v_u_3, (ref) v_u_49
					if p90.UserInputType == Enum.UserInputType.Gamepad1 and (p90.KeyCode == Enum.KeyCode.ButtonR2 and not p_u_25._isMoving) then
						p_u_25._lastClicked = os.clock()
						p_u_25._isMoving = true
						if p_u_28 and p_u_28.Parent then
							p_u_28:SetAttribute("isMoving", true)
						end
						if not v_u_3.GamepadEnabled and v_u_49 then
							if not v_u_49:FindFirstChild("Holder") then
								return
							end
							v_u_49.Holder.Rotate.Visible = false
							v_u_49.Holder.Pickup.Visible = false
						end
					end
				end))
				p_u_25._maid:GiveTask(v_u_3.InputEnded:Connect(function(p91, _)
					-- upvalues: (ref) p_u_25, (ref) v_u_84, (ref) v_u_72
					if p91.UserInputType == Enum.UserInputType.Gamepad1 and (p91.KeyCode == Enum.KeyCode.ButtonR2 and p_u_25._isMoving) then
						v_u_84()
						task.defer(function()
							-- upvalues: (ref) v_u_72
							v_u_72()
						end)
					end
				end))
				p_u_25._maid:GiveTask(v_u_3.InputBegan:Connect(function(p92, _)
					-- upvalues: (ref) p_u_25, (ref) v_u_84, (ref) v_u_82
					if p92.UserInputType == Enum.UserInputType.Gamepad1 then
						if p92.KeyCode == Enum.KeyCode.ButtonX and p_u_25._isMoving then
							p_u_25._rotation[2] = (p_u_25._rotation[2] + 1.5707963267948966) % 6.283185307179586
							p_u_25._lastRotation = table.clone(p_u_25._rotation)
							return
						end
						if p92.KeyCode == Enum.KeyCode.ButtonY then
							v_u_84()
							v_u_82()
						end
					end
				end))
			end)
		else
			p_u_25._maid:GiveTask(v87.Move.Button.InputBegan:Connect(function(p93)
				-- upvalues: (copy) p_u_25, (copy) p_u_28, (ref) v_u_3, (ref) v_u_49
				if p93.UserInputType == Enum.UserInputType.MouseButton1 and true or p93.UserInputType == Enum.UserInputType.Touch then
					p_u_25._isMoving = true
					if p_u_28 and p_u_28.Parent then
						p_u_28:SetAttribute("isMoving", true)
					end
					if not v_u_3.GamepadEnabled and v_u_49 then
						if not v_u_49:FindFirstChild("Holder") then
							return
						end
						v_u_49.Holder.Rotate.Visible = false
						v_u_49.Holder.Pickup.Visible = false
					end
				end
			end))
			p_u_25._maid:GiveTask(v87.Move.Button.InputEnded:Connect(function(p94)
				-- upvalues: (copy) v_u_84
				if p94.UserInputType == Enum.UserInputType.MouseButton1 and true or p94.UserInputType == Enum.UserInputType.Touch then
					v_u_84()
				end
			end))
			p_u_25._maid:GiveTask(v87.Rotate.Button.InputBegan:Connect(function(p95)
				-- upvalues: (copy) p_u_25
				if p95.UserInputType == Enum.UserInputType.MouseButton1 and true or p95.UserInputType == Enum.UserInputType.Touch then
					p_u_25._rotation[2] = (p_u_25._rotation[2] + 1.5707963267948966) % 6.283185307179586
				end
			end))
			p_u_25._maid:GiveTask(v87.Pickup.Button.InputBegan:Connect(function(p96)
				-- upvalues: (copy) v_u_82
				if p96.UserInputType == Enum.UserInputType.MouseButton1 and true or p96.UserInputType == Enum.UserInputType.Touch then
					v_u_82()
				end
			end))
			p_u_25._maid:GiveTask(v_u_3.InputBegan:Connect(function(p97, p98)
				-- upvalues: (copy) p_u_25
				if not p98 and (p97.KeyCode == Enum.KeyCode.R and p_u_25._isMoving) then
					p_u_25._rotation[2] = (p_u_25._rotation[2] + 1.5707963267948966) % 6.283185307179586
					p_u_25._lastRotation = table.clone(p_u_25._rotation)
				end
			end))
		end
	elseif v50 then
		p_u_25._maid:GiveTask(v_u_4.Heartbeat:Connect(function()
			-- upvalues: (copy) p_u_25
			p_u_25:_stepHandles()
		end))
		if v48 == "Move" then
			p_u_25._maid:GiveTask(v50.MouseDrag:Connect(function(p99, p100)
				-- upvalues: (copy) p_u_25, (copy) v_u_44, (ref) v_u_5
				if p_u_25._isDragging then
					if not (v_u_44 and v_u_44.Parent) then
						return
					end
					if not p_u_25._initialHandleCFrame then
						p_u_25._initialHandleCFrame = v_u_44:GetPivot()
					end
					local v101 = v_u_5:GetAttribute("placementGrid") or 0.1
					local v102 = Vector3.FromNormalId(p99) * p100
					local v103, v104, v105 = CFrame.new(v102):ToOrientation()
					local v106 = CFrame.new
					local v107 = v102.X / v101
					local v108 = math.round(v107) * v101
					local v109 = v102.Y / v101
					local v110 = math.round(v109) * v101
					local v111 = v102.Z / v101
					local v112 = v106(v108, v110, math.round(v111) * v101) * CFrame.fromOrientation(v103, v104, v105)
					v_u_44:PivotTo(p_u_25._initialHandleCFrame * v112)
				end
			end))
		elseif v48 == "Rotate" then
			p_u_25._maid:GiveTask(v50.MouseDrag:Connect(function(p113, p114, _)
				-- upvalues: (copy) p_u_25, (copy) v_u_44, (ref) v_u_5
				if p_u_25._isDragging then
					if not (v_u_44 and v_u_44.Parent) then
						return
					end
					if not p_u_25._initialHandleCFrame then
						p_u_25._initialHandleCFrame = v_u_44:GetPivot()
					end
					local v115 = v_u_5:GetAttribute("placementRotation") or 1.5707963267948966
					local v116 = p114 / v115
					local v117 = math.round(v116) * v115
					if p113 == Enum.Axis.X then
						p_u_25._rotation[1] = v117
						v_u_44:PivotTo(p_u_25._initialHandleCFrame * CFrame.Angles(v117, 0, 0))
						return
					end
					if p113 == Enum.Axis.Y then
						p_u_25._rotation[2] = v117
						v_u_44:PivotTo(p_u_25._initialHandleCFrame * CFrame.Angles(0, v117, 0))
						return
					end
					if p113 == Enum.Axis.Z then
						p_u_25._rotation[3] = v117
						v_u_44:PivotTo(p_u_25._initialHandleCFrame * CFrame.Angles(0, 0, v117))
					end
				end
			end))
		end
		p_u_25._maid:GiveTask(v50.MouseButton1Down:Connect(function()
			-- upvalues: (copy) p_u_25, (ref) v_u_3, (ref) v_u_5, (ref) v_u_7
			p_u_25._isDragging = true
			if v_u_3.TouchEnabled then
				local v_u_118 = false
				pcall(function()
					-- upvalues: (ref) v_u_5, (copy) v_u_118, (ref) v_u_7
					require(v_u_5.PlayerScripts:WaitForChild("PlayerModule")):GetControls():Enable(v_u_118)
					v_u_7.CameraType = v_u_118 and Enum.CameraType.Custom or Enum.CameraType.Scriptable
				end)
			end
		end))
		local function v120()
			-- upvalues: (copy) p_u_25, (ref) v_u_3, (ref) v_u_5, (ref) v_u_7
			p_u_25._initialHandleCFrame = nil
			p_u_25._isDragging = false
			if v_u_3.TouchEnabled then
				local v_u_119 = true
				pcall(function()
					-- upvalues: (ref) v_u_5, (copy) v_u_119, (ref) v_u_7
					require(v_u_5.PlayerScripts:WaitForChild("PlayerModule")):GetControls():Enable(v_u_119)
					v_u_7.CameraType = v_u_119 and Enum.CameraType.Custom or Enum.CameraType.Scriptable
				end)
			end
		end
		p_u_25._maid:GiveTask(v50.MouseButton1Up:Connect(v120))
		local v121 = v51.Holder
		if v_u_3.TouchEnabled then
			p_u_25._maid:GiveTask(v_u_3.TouchEnded:Connect(function()
				-- upvalues: (copy) p_u_25, (ref) v_u_3, (ref) v_u_5, (ref) v_u_7
				p_u_25._initialHandleCFrame = nil
				p_u_25._isDragging = false
				if v_u_3.TouchEnabled then
					local v_u_122 = true
					pcall(function()
						-- upvalues: (ref) v_u_5, (copy) v_u_122, (ref) v_u_7
						require(v_u_5.PlayerScripts:WaitForChild("PlayerModule")):GetControls():Enable(v_u_122)
						v_u_7.CameraType = v_u_122 and Enum.CameraType.Custom or Enum.CameraType.Scriptable
					end)
				end
			end))
			p_u_25._maid:GiveTask(v121.Pickup.Button.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_82
				v_u_82()
			end))
		else
			p_u_25._maid:GiveTask(v_u_3.InputEnded:Connect(function(p123)
				-- upvalues: (copy) p_u_25, (ref) v_u_3, (ref) v_u_5, (ref) v_u_7
				if p123.UserInputType == Enum.UserInputType.MouseButton1 then
					p_u_25._initialHandleCFrame = nil
					p_u_25._isDragging = false
					if v_u_3.TouchEnabled then
						local v_u_124 = true
						pcall(function()
							-- upvalues: (ref) v_u_5, (copy) v_u_124, (ref) v_u_7
							require(v_u_5.PlayerScripts:WaitForChild("PlayerModule")):GetControls():Enable(v_u_124)
							v_u_7.CameraType = v_u_124 and Enum.CameraType.Custom or Enum.CameraType.Scriptable
						end)
					end
				end
			end))
			p_u_25._maid:GiveTask(v121.Pickup.Button.InputBegan:Connect(function(p125)
				-- upvalues: (copy) v_u_82
				if p125.UserInputType == Enum.UserInputType.MouseButton1 and true or p125.UserInputType == Enum.UserInputType.Touch then
					v_u_82()
				end
			end))
		end
	end
	if v_u_3.TouchEnabled then
		task.defer(function()
			-- upvalues: (copy) p_u_25, (ref) v_u_3, (copy) v_u_72
			p_u_25._maid:GiveTask(v_u_3.TouchTapInWorld:Connect(function(_, p126)
				-- upvalues: (ref) v_u_72
				if not p126 then
					v_u_72()
				end
			end))
		end)
	else
		task.defer(function()
			-- upvalues: (copy) p_u_25, (ref) v_u_3, (copy) v_u_72
			p_u_25._maid:GiveTask(v_u_3.InputBegan:Connect(function(p127, p128)
				-- upvalues: (ref) v_u_72
				if not p128 and p127.UserInputType == Enum.UserInputType.MouseButton1 then
					v_u_72()
				end
			end))
		end)
	end
	return true
end
function v_u_1.Stop(p129)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_7
	p129._maid:DoCleaning()
	v_u_5:SetAttribute("isPlacingFurniture", nil)
	if p129._model then
		if p129._isOldModel then
			for _, v130 in ipairs(p129._model:GetDescendants()) do
				if v130:IsA("BasePart") then
					v130.CollisionGroupId = 0
				end
			end
			if p129._model and p129._model.Parent then
				if not p129._canPlace then
					if p129._originalCFrame then
						p129._model:PivotTo(p129._originalCFrame)
					end
					if p129._highlighter then
						p129._highlighter:Reset()
					end
				end
				p129._model.Parent = p129._originalParent
				if not p129._canPlace and p129._originalCFrame then
					local v131 = p129._model:GetAttribute("furnitureName")
					if v131 and v131 == "SlotMachine" then
						local v_u_132 = p129._model.Name
						task.defer(function()
							-- upvalues: (ref) v_u_8, (copy) v_u_132
							v_u_8("ClientHouse").BuildWindow.onSlotMachinePlaced:Fire(v_u_132)
						end)
					end
				end
			end
		else
			p129._model:Destroy()
		end
		p129._model = nil
	end
	p129._buildType = nil
	p129._isMoving = false
	p129._canPlace = true
	p129._isOldModel = false
	p129._originalParent = nil
	p129._originalCFrame = nil
	p129._lastCFrame = CFrame.new()
	p129._corners = {}
	if p129._placeGui then
		p129._placeGui:Destroy()
		p129._placeGui = nil
	end
	if p129._handles then
		p129._handles:Destroy()
		p129._handles = nil
	end
	if p129._advancedPlaceGui then
		p129._advancedPlaceGui:Destroy()
		p129._advancedPlaceGui = nil
	end
	local v_u_133 = true
	pcall(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_133, (ref) v_u_7
		require(v_u_5.PlayerScripts:WaitForChild("PlayerModule")):GetControls():Enable(v_u_133)
		v_u_7.CameraType = v_u_133 and Enum.CameraType.Custom or Enum.CameraType.Scriptable
	end)
	task.defer(function()
		-- upvalues: (ref) v_u_8
		v_u_8("ClientHouse").Furniture.onFurnitureUpdated:Fire()
	end)
end
function v_u_1.SetBuilding(p134, p135)
	p134._building = p135
end
function v_u_1.GetModel(p136)
	return p136._model
end
function v_u_1.Destroy(p137)
	p137:Stop()
end
local v_u_138 = {}
function v_u_1._drawDebugCorners(p139)
	-- upvalues: (copy) v_u_138
	for _, v140 in ipairs(v_u_138) do
		v140:Destroy()
	end
	local v141 = p139._model:GetPivot().Rotation
	for _, v142 in ipairs(p139._corners) do
		local v143 = Instance.new("Part")
		v143.Anchored = true
		v143.CanCollide = false
		v143.CastShadow = false
		v143.Size = Vector3.new(0.5, 0.5, 0.5)
		v143.BrickColor = BrickColor.Green()
		v143.CFrame = CFrame.new(v142) * v141
		v143.Parent = workspace
		local v144 = v_u_138
		table.insert(v144, v143)
	end
end
function v_u_1._step(p145)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_6, (copy) v_u_16, (copy) v_u_22
	local v146 = p145._model
	if v146 then
		local v147 = v_u_5.Character
		if v147 then
			v147 = v147:FindFirstChild("Humanoid")
		end
		if v147 then
			if v_u_8("ClientHouse").BuildDetection:GetBuildType() == p145._buildType then
				local _ = v_u_3.TouchEnabled and v147.MoveDirection.Magnitude <= 0
				local v148 = true
				local _ = v_u_3.GamepadEnabled and os.clock() - p145._lastClicked > 0.3
				local v149 = true
				local v150 = true
				if p145._isMoving then
					if not (v148 and v149) then
						return
					end
					local v151 = v_u_6.UnitRay
					local v152 = p145:_raycast(v151.Origin, v151.Direction * 250)
					local v153 = v_u_3.GamepadEnabled and v_u_8("GuiLoader").Get("BuildMenu")
					if v153 then
						v153.Holder.Console.Visible = true
					end
					if v152 then
						local v154 = v152.Instance
						local v155 = v146.PrimaryPart
						if not v155 then
							return
						end
						local v156 = v155.CFrame:VectorToObjectSpace(v152.Normal)
						local v157 = (v155.Size * v156).Magnitude * 0.5
						local v158 = v152.Position + v152.Normal * v157
						local v159 = v_u_5:GetAttribute("placementMode") == "Advanced" and (v_u_5:GetAttribute("placementGrid") or 0.1) or 0.1
						local v160 = v154.CFrame:PointToObjectSpace(v158)
						local v161 = v160.X / v159
						local v162 = math.round(v161) * v159
						local v163 = v160.Y / v159
						local v164 = math.round(v163) * v159
						local v165 = v160.Z / v159
						local v166 = math.round(v165) * v159
						local v167 = v154.CFrame:ToWorldSpace(CFrame.new(v162, v164, v166))
						local _, v168 = v167:ToOrientation()
						local v169 = CFrame.new(v167.Position) * CFrame.fromOrientation(0, v168, 0) * CFrame.Angles(0, p145._rotation[2], 0)
						if v169 ~= p145._lastCFrame then
							p145._corners = v_u_16.GetCorners(v169, v155.Size)
							p145._lastCFrame = v169
						end
						local v170 = p145._building
						if v154:IsDescendantOf(v170.Model) or v154:IsDescendantOf(v170.Furniture) then
							if v154.Name == "Floor" or v154.Name == "Ceiling" then
								p145._canPlace = not p145:_wallCollisionCheck(v154)
							else
								p145._canPlace = (v154.Name == "InteriorWall" or v154:GetAttribute("isPlaceable") == true) and true or v154:IsDescendantOf(v170.Furniture)
							end
						else
							p145._canPlace = false
						end
						local v171 = p145._canPlace
						if v171 then
							if v154.Color == Color3.fromRGB(0, 16, 176) then
								v171 = false
							else
								v171 = v_u_22(v167.Position, v170)
							end
						end
						p145._canPlace = v171
						if v_u_3.TouchEnabled and v147.MoveDirection.Magnitude > 0 then
							v150 = false
						else
							v146:PivotTo(v169)
						end
					end
				elseif p145._rotation[2] ~= p145._lastRotation[2] then
					local v172 = v146:GetPivot() * CFrame.Angles(0, 1.5707963267948966, 0)
					if v172 ~= p145._lastCFrame then
						p145._corners = v_u_16.GetCorners(v172, v146.PrimaryPart.Size)
						p145._lastCFrame = v172
					end
					p145._canPlace = not p145:_wallCollisionCheck()
					p145._lastRotation = table.clone(p145._rotation)
					v146:PivotTo(v172)
				end
				if v150 and v146 then
					if p145._canPlace then
						p145._highlighter:Reset()
						return
					end
					p145._highlighter:SetColor(Color3.new(1, 0, 0))
					p145._highlighter:SetTransparency(0.5)
				end
			else
				p145:Stop()
			end
		else
			return
		end
	else
		return
	end
end
function v_u_1._stepHandles(p173)
	-- upvalues: (copy) v_u_5, (copy) v_u_16, (copy) v_u_22
	local v174 = p173._model
	if v174 then
		local v175 = v_u_5.Character
		if v175 then
			v175 = v175:FindFirstChild("Humanoid")
		end
		if v175 then
			local v176 = true
			if p173._isDragging then
				local v177 = v174.PrimaryPart
				if not v177 then
					return
				end
				local v178 = v174:GetPivot()
				if v178 == p173._lastCFrame then
					v176 = false
				else
					p173._corners = v_u_16.GetCorners(v178, v177.Size)
					p173._lastCFrame = v178
				end
				local v179 = p173._building
				local v180 = v179.Model.Floor
				local v181 = v179.Model.Ceiling
				local v182 = 0
				local v183 = false
				for _, v184 in v180:GetChildren() do
					local v185 = v178.Position.Y - v177.Size.Y * 0.5 - v184.Position.Y
					if math.abs(v185) <= 15 then
						for _, v186 in p173._corners do
							if v_u_16.IsPointInPartIgnoreY(v186, v184) then
								v182 = v182 + 1
							end
						end
					end
				end
				local v187 = #p173._corners <= v182 and true or v183
				if not v187 then
					local v188 = 0
					for _, v189 in v181:GetChildren() do
						local v190 = v178.Position.Y - v177.Size.Y * 0.5 - v189.Position.Y
						if math.abs(v190) <= 15 then
							for _, v191 in p173._corners do
								if v_u_16.IsPointInPartIgnoreY(v191, v189) then
									v188 = v188 + 1
								end
							end
						end
					end
					if #p173._corners <= v188 then
						v187 = true
					end
				end
				p173._canPlace = v_u_22(v178.Position, v179) and v187
			end
			if v176 and v174 then
				if p173._canPlace then
					p173._highlighter:Reset()
					return
				end
				p173._highlighter:SetColor(Color3.new(1, 0, 0))
				p173._highlighter:SetTransparency(0.5)
			end
		end
	else
		return
	end
end
function v_u_1._getSpawnCFrame(p192, p193)
	-- upvalues: (copy) v_u_5, (copy) v_u_10
	local v194 = v_u_5.Character
	local v195
	if v194 then
		v195 = v194.PrimaryPart
	else
		v195 = v194
	end
	if v195 then
		local v196 = v_u_10(p193, "Furniture")
		local v197 = v195.CFrame * CFrame.new(0, -v194.Humanoid.HipHeight, 0)
		local v198 = p192:_raycast(v197.Position, Vector3.new(-0, -10, -0))
		if v198 then
			local v199 = v198.Instance.Parent.Name
			local v200 = p192._building
			local v201 = v198.Instance
			local v202 = v198.Position
			if v199 == "Floor" or v201:IsDescendantOf(v200.Furniture) then
				if v199 == "Floor" and not v201:IsDescendantOf(v200.Model) then
					return nil
				else
					local v203 = v197.X
					local v204 = v202.Y + v196:GetExtentsSize().Y * 0.5
					local v205 = v197.Z
					local v206 = Vector3.new(v203, v204, v205)
					local v207 = v201.CFrame:PointToObjectSpace(v206)
					local v208 = v201.CFrame:ToWorldSpace(CFrame.new(v207))
					local _, v209 = v208:ToOrientation()
					if v_u_5:GetAttribute("placementMode") == "Advanced" then
						return CFrame.new(v208.Position)
					else
						return CFrame.new(v208.Position) * CFrame.fromOrientation(0, v209, 0) * CFrame.Angles(0, p192._rotation[2], 0)
					end
				end
			else
				return nil
			end
		else
			return nil
		end
	else
		return
	end
end
function v_u_1._raycast(p210, p211, p212)
	-- upvalues: (copy) v_u_8
	local v213 = p210._building
	if not v213 then
		return nil
	end
	local v214 = RaycastParams.new()
	v214.FilterType = Enum.RaycastFilterType.Include
	local v215 = { v213 }
	if v_u_8("ClientHouse").BuildDetection:GetBuildType() == "base" then
		for _, v216 in v213.Parent.Parent.Rooms:GetChildren() do
			table.insert(v215, v216)
		end
	end
	v214.FilterDescendantsInstances = v215
	v214.IgnoreWater = true
	return workspace:Raycast(p211, p212, v214)
end
function v_u_1._wallCollisionCheck(p217, p218)
	-- upvalues: (copy) v_u_4, (copy) v_u_16
	if not p217._corners then
		return false
	end
	if not p217._model then
		return false
	end
	local v219 = 0
	local v220 = #p217._corners
	local v221 = p217._building
	local v222 = v221.Model.Floor
	local v223 = v221.Model.Ceiling
	local v224 = {}
	local v225 = {}
	local v226
	if p218 then
		v226 = p218
	else
		local _ = p217._model.PrimaryPart.Size.Y
		for _, v227 in ipairs(v222:GetChildren()) do
			if v227:IsA("BasePart") and v227.Name ~= "Base" then
				local v228 = p217._model.PrimaryPart.Position.Y - p217._model.PrimaryPart.Size.Y * 0.5 - v227.Position.Y
				local v229 = {
					["floorPart"] = v227,
					["difference"] = math.abs(v228)
				}
				table.insert(v224, v229)
			end
		end
		table.sort(v224, function(p230, p231)
			return p230.difference < p231.difference
		end)
		v226 = v224[1]
		if v226 then
			v226 = v224[1].floorPart
		end
	end
	if not v226 then
		return false
	end
	if p218 == nil or p218.Name == "Floor" then
		for _, v232 in v222:GetChildren() do
			local v233 = v232.Position.Y
			local v234 = math.floor(v233)
			local v235 = v226.Position.Y
			if v234 == math.floor(v235) then
				table.insert(v225, v232)
			end
		end
	elseif p218.Name == "Ceiling" then
		for _, v236 in v223:GetChildren() do
			local v237 = v236.Position.Y
			local v238 = math.floor(v237)
			local v239 = v226.Position.Y
			if v238 == math.floor(v239) then
				table.insert(v225, v236)
			end
		end
	end
	for _, v240 in v225 do
		if v_u_4:IsStudio() then
			local v241 = v240.Size
			local v242
			if v241.Y < v241.X then
				v242 = v241.Y < v241.Z
			else
				v242 = false
			end
		end
		for _, v243 in p217._corners do
			if v_u_16.IsPointInPartIgnoreY(v243, v240) then
				v219 = v219 + 1
			end
		end
		if v220 <= v219 then
			break
		end
	end
	return v220 > v219
end
return v_u_1