-- Carousel (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientCarnival
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("RunService")
game:GetService("TweenService")
local v3 = game:GetService("UserInputService")
local v4 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local v5 = require(v4.devv).load
v5("LODCheck")
v5("tween")
v5("trig")
local v_u_6 = v5("Maid")
v_u_1.__index = v_u_1
local _ = v3.TouchEnabled
function v_u_1.new(p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_2
	local v_u_8 = {}
	local v9 = v_u_1
	setmetatable(v_u_8, v9)
	local v10 = v_u_6.new()
	v_u_8._model = p7
	v_u_8._chairs = {}
	local v11 = p7:FindFirstChild("Ride")
	if v11 then
		local v12 = p7:GetAttribute("startCFrame")
		for _, v13 in v11:GetChildren() do
			if v13.Name == "Chair" and v13:IsA("Model") then
				v_u_8._chairs[v13] = v13:GetPivot():toObjectSpace(v12)
			end
		end
		v_u_8:CFrameRide(v12 * CFrame.Angles(0, 0, 0))
		v10:GiveTask(v_u_2.Heartbeat:Connect(function(p14)
			-- upvalues: (copy) v_u_8
			v_u_8:Heartbeat(p14)
		end))
	end
	v_u_8._maid = v10
	return v_u_8
end
function v_u_1.CFrameRide(p15, p16)
	p15._model.Ride:PivotTo(p16)
	for v17, v18 in p15._chairs do
		local v19 = v17:GetAttribute("reversed") and -1 or 1
		local v20 = workspace:GetServerTimeNow() * v19
		local v21 = math.sin(v20) + 1
		v17:PivotTo(p16 * v18:inverse() * CFrame.new(0, v21, 0))
	end
end
function v_u_1.Heartbeat(p22, _)
	local v23 = p22._model
	if v23 and v23:GetAttribute("animating") then
		local v24 = v23:GetAttribute("animStarted")
		local v25 = workspace:GetServerTimeNow() - v24
		local v26 = v23:GetAttribute("rotFactor")
		p22:CFrameRide(v23:GetAttribute("startCFrame") * CFrame.Angles(0, v26 + 0.5235987755982988 * v25, 0), v25)
	end
end
function v_u_1.Destroy(p27)
	p27._maid:DoCleaning()
	for v28, _ in p27._chairs do
		p27._chairs[v28] = nil
	end
	p27._model = nil
end
return v_u_1