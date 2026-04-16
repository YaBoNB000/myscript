-- Bike (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientBike
-- Original

local v_u_1 = game:GetService("ProximityPromptService")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("UserInputService")
game:GetService("CollectionService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Players").LocalPlayer
local _ = workspace.CurrentCamera
local v7 = require(v_u_3.devv).load
v7("GetCharacterMass")
local v_u_8 = v7("playAnimation")
local v_u_9 = v7("dialogQueue")
local v_u_10 = v7("deltaAngle")
local v_u_11 = v7("skateUtils")
local v_u_12 = v7("makeDialog")
local v_u_13 = v7("GuiLoader")
v7("LODCheck")
v7("v3sound")
local v_u_14 = v7("Signal")
local v_u_15 = v7("Maid")
local v_u_16 = v7("DOF")
local v_u_17 = nil
local v_u_18 = false
local v_u_19 = {}
v_u_19.__index = v_u_19
function v_u_19.new(p20)
	-- upvalues: (copy) v_u_19, (copy) v_u_15
	local v21 = v_u_19
	local v22 = setmetatable({}, v21)
	v22._model = p20
	v22._maid = v_u_15.new()
	v22._thumbstickMove = nil
	v22._mass = 0
	v22._isOllieing = false
	v22._isBoost = false
	v22._lastOlly = 0
	v22._animations = {}
	v22:_init()
	return v22
end
function v_u_19.Destroy(p23)
	if p23._maid then
		p23._maid:DoCleaning()
		p23._maid = nil
	end
end
function v_u_19.Ollie(p24)
	if os.clock() - p24._lastOlly >= 1.5 then
		p24._lastOlly = os.clock()
		p24:_performOllie()
	end
end
function v_u_19._step(p25, _)
	-- upvalues: (copy) v_u_6, (ref) v_u_17, (copy) v_u_11, (copy) v_u_10
	local v26 = p25._model
	if v26 and (v26.Parent and v26.PrimaryPart) then
		local v27 = v26.PrimaryPart
		local v28 = v26:FindFirstChild("Handle")
		local v29 = v27:FindFirstChild("BodyForce")
		local v30 = v27:FindFirstChild("BodyGyro")
		if v29 and (v30 and v28) then
			local v31 = v_u_6.Character
			local v32
			if v31 then
				v32 = v31.PrimaryPart
			else
				v32 = v31
			end
			if v31 then
				v31 = v31:FindFirstChild("Humanoid")
			end
			if v32 and v31 then
				local v33 = v_u_17 and v_u_17:GetMoveVector() or v31.MoveDirection
				local v34 = (v27.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
				if p25._thumbstickMove then
					v33 = p25._thumbstickMove
				end
				local v35 = v33:Dot(v33) > 0
				if v35 then
					v33 = v_u_11.GetAccurateMoveDirection(v33)
				end
				local v36 = v_u_11.GetFloorNormal(v27) or Vector3.new(0, 1, 0)
				local v37 = v_u_11.GetRotationFromNormal(v27.Position, v30.CFrame.LookVector, v36)
				local v38 = v37:ToOrientation()
				local v39 = p25._isBoost
				local v40 = (v38 > 0 and (100 * ((1 + v38) * 1.5) or 100) or 100) * (v39 and 5 or 1)
				if v35 then
					v37 = CFrame.lookAt(v28.Position, v28.Position + v33) * CFrame.fromOrientation(v38, 0, 0)
				end
				local v41
				if math.abs(v34) > 0.5 and v35 then
					local v42 = v27.CFrame.LookVector
					local v43 = -v42.Z
					local v44 = v42.X
					local v45 = math.atan2(v43, v44)
					local v46
					if v35 then
						local v47 = -v33.Z
						local v48 = v33.X
						v46 = math.atan2(v47, v48) or v45
					else
						v46 = v45
					end
					local v49 = v_u_10(v46, v45)
					v41 = math.clamp(v49, -0.13962634015954636, 0.13962634015954636)
				else
					v41 = 0
				end
				if v34 < 40 then
					v29.Force = v33 * p25._mass * v40
				else
					v29.Force = Vector3.new(0, 0, 0)
				end
				v30.MaxTorque = Vector3.new(1, 1, 1) * (1 / 0)
				v30.D = 650
				v30.P = 5000
				v30.CFrame = v37
				local v50 = v27:FindFirstChild("Weld")
				if v50 then
					v50.C0 = v50.C1:Inverse() * CFrame.Angles(0, 0, -v41) * v50.C1
				end
				local v51 = math.abs(v34) > 0.5 and 1 + v34 / 40 * 4 or 0
				p25._animation:AdjustSpeed(v51)
				p25:_updateSound()
			end
		else
			return
		end
	else
		return
	end
end
function v_u_19._promptPickup(_, p52)
	-- upvalues: (ref) v_u_18, (copy) v_u_14, (copy) v_u_3, (copy) v_u_16, (copy) v_u_12, (copy) v_u_9
	if v_u_18 then
		return
	elseif p52 then
		v_u_14.FireServer("getOffBike")
	else
		local v53 = v_u_3.Guis.Dialog.TwoButtonDialog:Clone()
		v53.Frame.MiddleLabel.Text = "Do you want to stop riding this bike?"
		v53.Frame.MiddleLabel.TextScaled = false
		v53.Frame.MiddleLabel.TextSize = 32
		v53.Frame.MiddleLabel.LineHeight = 1.15
		v53.Frame.MiddleLabel:ClearAllChildren()
		v53.Frame.LowerLabel.Visible = false
		v53.Frame.UpperLabel.Visible = false
		v53.Frame.Button1.Text = "YES"
		v53.Frame.Button2.Text = "NO"
		v_u_16(true)
		v_u_18 = true
		v_u_9:Add((v_u_12({
			["super"] = "TwoButtonDialog",
			["UIObject"] = v53,
			["button1func"] = function()
				-- upvalues: (ref) v_u_14, (ref) v_u_18, (ref) v_u_16, (ref) v_u_9
				v_u_14.FireServer("getOffBike")
				v_u_18 = false
				v_u_16(false)
				v_u_9:Next()
			end,
			["button2func"] = function()
				-- upvalues: (ref) v_u_18, (ref) v_u_16, (ref) v_u_9
				v_u_18 = false
				v_u_16(false)
				v_u_9:Next()
			end,
			["closeFunc"] = function()
				-- upvalues: (ref) v_u_18, (ref) v_u_16
				v_u_18 = false
				v_u_16(false)
			end
		})))
	end
end
function v_u_19._performOllie(p_u_54)
	-- upvalues: (copy) v_u_11, (copy) v_u_6
	local v55 = p_u_54._model
	if v55 then
		v55 = v55.PrimaryPart
	end
	if v55 and v55.Parent then
		if v_u_11.CanPlaceBoard(v_u_6) then
			p_u_54._isOllieing = true
			p_u_54._isBoost = true
			local v_u_56 = Instance.new("BodyForce")
			v_u_56.Force = v55.CFrame.UpVector * p_u_54._mass * 610 * (workspace.Gravity / 196)
			v_u_56.Parent = v55
			task.delay(0.1, function()
				-- upvalues: (copy) p_u_54, (copy) v_u_56
				p_u_54._isBoost = false
				v_u_56:Destroy()
			end)
			task.delay(1, function()
				-- upvalues: (copy) p_u_54
				p_u_54._isOllieing = false
			end)
		end
	else
		return
	end
end
function v_u_19._updateSound(p57)
	-- upvalues: (copy) v_u_6
	local v58 = p57._model
	if v58 then
		local v59 = v58.Handle
		local v60 = (v59.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
		local v61 = v59:FindFirstChild("CruiseLoop")
		if v60 < 1 then
			if v61 then
				v61.Volume = 0
			end
		elseif v61 then
			local v62 = 0.9 * (v60 / 40) + 0.1
			v61.Volume = math.min(v62, 1) * 0.3 * (v_u_6:GetAttribute("VehicleVolume") or 1)
			v61.Pitch = 0.2500000000000001 * (v60 / 40) + 0.85
		end
	else
		return
	end
end
function v_u_19._init(p_u_63)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_13, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_11, (copy) v_u_1, (copy) v_u_5
	v_u_2:BindActionAtPriority("LockSeat", function(_, p64, p65)
		-- upvalues: (copy) p_u_63
		if p64 == Enum.UserInputState.End and p65.KeyCode == Enum.KeyCode.Space then
			p_u_63:Ollie()
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.ContextActionPriority.High.Value, Enum.PlayerActions.CharacterJump)
	p_u_63._maid:GiveTask(function()
		-- upvalues: (ref) v_u_2
		v_u_2:UnbindAction("LockSeat")
	end)
	if v_u_4.GamepadEnabled then
		v_u_2:BindActionAtPriority("BikeMove", function(_, p66, p67)
			-- upvalues: (copy) p_u_63
			if p66 == Enum.UserInputState.Cancel then
				return Enum.ContextActionResult.Sink
			end
			if p67.Position.Magnitude > 0.2 then
				local v68 = p_u_63
				local v69 = p67.Position.X
				local v70 = -p67.Position.Y
				v68._thumbstickMove = Vector3.new(v69, 0, v70)
			else
				p_u_63._thumbstickMove = Vector3.new(0, 0, 0)
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.High.Value + 1000, Enum.KeyCode.Thumbstick1)
		v_u_2:BindActionAtPriority("BikeJump", function(_, _)
			-- upvalues: (copy) p_u_63
			p_u_63:Ollie()
			return Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.High.Value + 1, Enum.KeyCode.ButtonA)
		v_u_2:BindActionAtPriority("BikeDiscard", function(_, p71)
			-- upvalues: (copy) p_u_63
			if p71 == Enum.UserInputState.Begin then
				p_u_63:_promptPickup(true)
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.High.Value + 1, Enum.KeyCode.ButtonX)
		p_u_63._maid:GiveTask(function()
			-- upvalues: (ref) v_u_2
			v_u_2:UnbindAction("BikeMove")
			v_u_2:UnbindAction("BikeJump")
			v_u_2:UnbindAction("BikeDiscard")
		end)
	end
	if v_u_4.TouchEnabled then
		local v_u_72 = v_u_13.Load(v_u_3.Guis.ScreenGuis.Skateboard, "Skateboard")
		v_u_72.Parent = v_u_6:WaitForChild("PlayerGui")
		if v_u_72 then
			v_u_72.Enabled = true
			v_u_72.Holder.Visible = true
			v_u_72.Holder.Ollie.Visible = true
			v_u_72.Holder.Float.Visible = false
			v_u_72.Holder.Pickup.Text = "Get Off"
			p_u_63._maid:GiveTask(v_u_72.Holder.Ollie.Activated:Connect(function()
				-- upvalues: (copy) p_u_63
				p_u_63:Ollie()
			end))
			p_u_63._maid:GiveTask(v_u_72.Holder.Pickup.Activated:Connect(function()
				-- upvalues: (copy) p_u_63
				p_u_63:_promptPickup(true)
			end))
			p_u_63._maid:GiveTask(function()
				-- upvalues: (copy) v_u_72
				if v_u_72 and v_u_72.Parent then
					v_u_72.Enabled = false
					v_u_72.Holder.Visible = false
				end
			end)
		end
	end
	p_u_63._animation = v_u_8("bikeRide", v_u_6.Character)
	p_u_63._animation:AdjustSpeed(0)
	p_u_63._maid:GiveTask(function()
		-- upvalues: (copy) p_u_63
		if p_u_63._animation then
			p_u_63._animation:Stop(0)
			p_u_63._animation = nil
		end
		local v73 = p_u_63._model
		if v73 then
			v73 = p_u_63._model.PrimaryPart
		end
		if v73 then
			v73.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			v73.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		end
	end)
	local v_u_74 = p_u_63._model:WaitForChild("Handle")
	v_u_74.CruiseLoop:Play()
	v_u_74.CruiseLoop.Volume = 0
	if v_u_4.TouchEnabled then
		local v75 = v_u_6.PlayerGui:FindFirstChild("TouchGui")
		if v75 then
			v75 = v75:FindFirstChild("TouchControlFrame")
		end
		if v75 then
			v75 = v75:FindFirstChild("JumpButton")
		end
		if v75 then
			v75.Visible = false
		end
	end
	p_u_63._maid:GiveTask(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_6
		if v_u_4.TouchEnabled then
			local v76 = v_u_6.PlayerGui:FindFirstChild("TouchGui")
			if v76 then
				v76 = v76:FindFirstChild("TouchControlFrame")
			end
			if v76 then
				v76 = v76:FindFirstChild("JumpButton")
			end
			if v76 then
				v76.Visible = true
			end
		end
	end)
	p_u_63._maid:GiveTask(function()
		-- upvalues: (copy) v_u_74, (ref) v_u_11, (ref) v_u_6, (ref) v_u_1
		if v_u_74 and v_u_74.Parent then
			v_u_74.CruiseLoop:Stop()
		end
		v_u_11.SetHumanoidEnabled(v_u_6, true)
		task.delay(0.05, function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			v_u_1.Enabled = true
			local v77 = v_u_6.Character
			if v77 then
				v77 = v77:FindFirstChild("Humanoid")
			end
			local v78 = v77 and (v77.SeatPart and v77.SeatPart:FindFirstChild("SeatWeld"))
			if v78 then
				v78:Destroy()
			end
		end)
	end)
	p_u_63._mass = 0
	for _, v79 in p_u_63._model:GetDescendants() do
		if v79:IsA("BasePart") then
			p_u_63._mass = p_u_63._mass + v79:GetMass()
		end
	end
	local _ = v_u_6.Character
	p_u_63._maid:GiveTask(v_u_4.InputEnded:Connect(function(p80, p81)
		-- upvalues: (copy) p_u_63
		if p81 then
			return
		elseif p80.UserInputType == Enum.UserInputType.MouseButton1 then
			p_u_63:_promptPickup()
		elseif p80.KeyCode == Enum.KeyCode.Backspace then
			p_u_63:_promptPickup(true)
		end
	end))
	p_u_63._maid:GiveTask(v_u_5.Heartbeat:Connect(function(p82)
		-- upvalues: (copy) p_u_63
		p_u_63:_step(p82)
	end))
end
task.spawn(function()
	-- upvalues: (copy) v_u_6, (ref) v_u_17
	local v83 = require(v_u_6:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"))
	repeat
		v_u_17 = v83:GetControls()
		task.wait(1)
	until v_u_17 ~= nil
end)
return v_u_19