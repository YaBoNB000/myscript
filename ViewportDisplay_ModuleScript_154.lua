-- ViewportDisplay (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = {}
game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("Players").LocalPlayer
local v_u_5 = v4:GetMouse()
v4:WaitForChild("PlayerGui")
local v_u_6 = require(game:GetService("ReplicatedStorage").devv).load("Maid")
local v_u_7 = require(script.Config)
local v_u_8 = v_u_2.TouchEnabled
function v_u_1.new(p9, p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_7, (copy) v_u_6
	local v11 = p9 ~= nil
	assert(v11, "No model")
	local v12 = p9.PrimaryPart ~= nil
	assert(v12, "PrimaryPart does not exist")
	local v13 = p10 ~= nil
	assert(v13, "No ViewportFrame")
	local v14 = p10.ClassName == "ViewportFrame"
	assert(v14, "Invalid ViewportFrame")
	local v15 = {
		["__index"] = v_u_1
	}
	local v16 = setmetatable({}, v15)
	v16.model = p9
	v16.viewportFrame = p10
	v16._defaultRotation = v_u_7.DEFAULT_ROTATION
	v16._currentRotation = v16._defaultRotation
	v16._targetRotation = v16._defaultRotation
	v16._lastRotation = Vector2.new(0, 0)
	v16._cameraCFrame = CFrame.new()
	v16._cameraOffset = CFrame.new()
	v16._drag = Vector2.new(0, 0)
	v16._lastPosition = Vector2.new(0, 0)
	v16._delta = Vector2.new(0, 0)
	v16._zoom = 1
	v16._isDragging = false
	v16._maid = v_u_6.new()
	v16:_bindModel()
	return v16
end
function v_u_1.SetDefaultRotation(p17, p18)
	local v19 = typeof(p18) == "Vector2"
	assert(v19, "newRotation must be a Vector2")
	p17._defaultAngle = p18
	p17:_mouseUp()
end
function v_u_1.SetZoom(p20, p21)
	local v22 = p21 > 0
	assert(v22, "Zoom factor must be greater than 0")
	p20._zoom = p21
	p20:_bindModel()
end
function v_u_1.SetModel(p23, p24)
	local v25 = p24 ~= nil
	assert(v25, "No model")
	local v26 = p24.PrimaryPart ~= nil
	assert(v26, "PrimaryPart does not exist")
	if p23.model ~= nil then
		p23.model:Destroy()
	end
	p23.model = p24
	p23:_bindModel()
end
function v_u_1.Enable(p_u_27)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3
	p_u_27._currentAngle = p_u_27._defaultAngle
	local function v_u_39()
		-- upvalues: (copy) p_u_27, (ref) v_u_2, (ref) v_u_7, (ref) v_u_8
		if p_u_27._isDragging then
			local v28 = v_u_2:GetMouseLocation()
			local v29 = (p_u_27._lastPosition or v28) - v28
			local v30 = Vector2.new
			local v31 = v29.X
			local v32 = -v_u_7.MAX_DELTA
			local v33 = v_u_7.MAX_DELTA
			local v34 = math.clamp(v31, v32, v33)
			local v35 = v29.Y
			local v36 = -v_u_7.MAX_DELTA
			local v37 = v_u_7.MAX_DELTA
			local v38 = v30(v34, (math.clamp(v35, v36, v37)))
			if v_u_8 then
				v38 = v38 * 10
			end
			p_u_27._delta = v38.Magnitude > 1 and v38 and v38 or Vector2.new(0, 0)
			p_u_27._lastPosition = v28
		end
	end
	p_u_27._maid:GiveTask(v_u_2.InputChanged:Connect(function(p40, _)
		-- upvalues: (copy) v_u_39
		if p40.UserInputType == Enum.UserInputType.MouseMovement then
			v_u_39()
		end
	end))
	p_u_27._maid:GiveTask(v_u_2.InputBegan:Connect(function(p41, _)
		-- upvalues: (copy) p_u_27, (ref) v_u_2
		if p41.UserInputType == Enum.UserInputType.MouseButton1 then
			p_u_27:_mouseDown(v_u_2:GetMouseLocation())
		end
	end))
	p_u_27._maid:GiveTask(v_u_2.InputEnded:Connect(function(p42, _)
		-- upvalues: (copy) p_u_27
		if p42.UserInputType == Enum.UserInputType.MouseButton1 then
			p_u_27:_mouseUp()
		end
	end))
	p_u_27._maid:GiveTask(v_u_5.Button1Up:Connect(function()
		-- upvalues: (copy) p_u_27
		p_u_27:_mouseUp()
	end))
	p_u_27._maid:GiveTask(v_u_2.TouchStarted:Connect(function()
		-- upvalues: (copy) p_u_27, (ref) v_u_2
		p_u_27:_mouseDown(v_u_2:GetMouseLocation())
	end))
	p_u_27._maid:GiveTask(v_u_2.TouchEnded:Connect(function()
		-- upvalues: (copy) p_u_27
		p_u_27:_mouseUp()
	end))
	p_u_27._maid:GiveTask(v_u_2.TouchMoved:Connect(function()
		-- upvalues: (copy) v_u_39
		v_u_39()
	end))
	p_u_27._maid:GiveTask(v_u_3.RenderStepped:Connect(function()
		-- upvalues: (copy) p_u_27
		p_u_27:_step()
	end))
end
function v_u_1.Disable(p43)
	p43._maid:DoCleaning()
	p43:_mouseUp()
end
function v_u_1.Destroy(p44)
	p44:Disable()
	for _, v45 in ipairs(p44.viewportFrame:GetDescendants()) do
		v45:Destroy()
	end
	p44.model = nil
	p44.viewportFrame = nil
end
function v_u_1._bindModel(p46)
	local v47 = p46.model
	v47:PivotTo(CFrame.new())
	local v48, v49 = v47:GetBoundingBox()
	local v50, v51 = p46:_getViewportComponents()
	local v52 = v47:FindFirstChild("Humanoid")
	if v52 ~= nil then
		v52.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		v52.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
	end
	v47.Parent = v50
	local v53 = v51.FieldOfView
	local v54 = v49.Magnitude * 0.5
	local v55 = math.rad(v53) * 0.5
	local v56 = (v54 / math.tan(v55) + v54) * (1 / p46._zoom)
	local _ = v48 * CFrame.Angles(0, 3.141592653589793, 0)
	p46._cameraCFrame = v51.CFrame
	p46._cameraOffset = v56
	p46:_updateCamera()
end
function v_u_1._step(p57)
	-- upvalues: (copy) v_u_7
	p57._currentRotation = p57._currentRotation + Vector2.new(((p57._targetRotation.X - p57._currentRotation.X + 3.141592653589793) % 6.283185307179586 - 3.141592653589793) * v_u_7.SPIN_SPEED, ((p57._targetRotation.Y - p57._currentRotation.Y + 3.141592653589793) % 6.283185307179586 - 3.141592653589793) * v_u_7.SPIN_SPEED)
	p57:_updateCamera()
end
function v_u_1._mouseDown(p58, p59)
	p58._drag = Vector2.new(p59.X, p59.Y)
	p58._lastRotation = p58._currentRotation
	p58._isDragging = true
end
function v_u_1._mouseUp(p60)
	-- upvalues: (copy) v_u_7
	if v_u_7.DOES_SNAP == true then
		p60._targetRotation = p60._defaultRotation
	end
	p60._drag = Vector2.new(0, 0)
	p60._lastPosition = nil
	p60._lastRotation = Vector2.new(0, 0)
	p60._delta = Vector2.new()
	p60._isDragging = false
end
function v_u_1._updateCamera(p61)
	-- upvalues: (copy) v_u_7
	local _, v62 = p61:_getViewportComponents()
	p61._targetRotation = Vector2.new(p61._delta.Y * v_u_7.SPIN_SPEED, p61._delta.X * v_u_7.SPIN_SPEED)
	local v63 = p61.model:GetBoundingBox()
	local v64 = p61._currentRotation.X
	local v65 = p61._currentRotation.Y
	local v66 = v62.CFrame - v62.CFrame.p
	local v67 = v66:VectorToObjectSpace(v62.CFrame.UpVector)
	p61._cameraCFrame = v66
	p61._cameraCFrame = p61._cameraCFrame * CFrame.fromAxisAngle(v67, v65)
	p61._cameraCFrame = p61._cameraCFrame * CFrame.Angles(v64, 0, 0)
	v62.CFrame = v63 * p61._cameraCFrame * CFrame.new(0, 0, p61._cameraOffset)
end
function v_u_1._getViewportComponents(p68)
	local v69 = p68.viewportFrame
	local v70 = v69:FindFirstChildOfClass("WorldModel")
	if v70 == nil then
		v70 = Instance.new("WorldModel")
		v70.Parent = v69
	end
	local v71 = v69:FindFirstChildOfClass("Camera")
	if v71 == nil then
		v71 = Instance.new("Camera")
		v71.FieldOfView = 1
		v71.CFrame = v71.CFrame * CFrame.new(0, 0, 0, -0.875551701, 0.351007402, -0.331963897, -0.0261858162, 0.651634216, 0.758078814, 0.482410282, 0.672431529, -0.561350107)
		v71.Parent = v69
		v69.CurrentCamera = v71
	end
	return v70, v71
end
return v_u_1