-- recordingStudio (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientBuildings
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players")
local v_u_4 = v_u_3.LocalPlayer
local v_u_5 = require(v2.devv).load("dialogQueue")
local v_u_6 = require(script.musicControl)
local function v_u_15()
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v7 = workspace.RecordingStudio:WaitForChild("Studio")
	local v_u_8 = v7.ProducerConsole
	local v_u_9 = v7.Seat
	local v_u_10 = Instance.new("ProximityPrompt")
	v_u_10.ObjectText = "Producer"
	v_u_10.ActionText = "Play Beat"
	v_u_10.HoldDuration = 0.5
	v_u_10.RequiresLineOfSight = false
	v_u_10.Enabled = false
	v_u_10.Parent = v_u_8
	v_u_10.Triggered:Connect(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_9, (ref) v_u_3, (ref) v_u_4, (ref) v_u_6
		for _, v11 in ipairs(v_u_5._queue) do
			if v11.UIObject and v11.UIObject.Name == "BoomboxDialog" then
				return
			end
		end
		local v12 = v_u_9.Occupant
		local v13
		if v12 then
			v13 = v_u_3:GetPlayerFromCharacter(v12.Parent)
		else
			v13 = nil
		end
		if v13 and v13 == v_u_4 then
			v_u_6:openPrompt()
		end
	end)
	v_u_9:GetPropertyChangedSignal("Occupant"):Connect(function()
		-- upvalues: (copy) v_u_9, (ref) v_u_4, (copy) v_u_8, (copy) v_u_10
		local v14 = v_u_9.Occupant
		if v14 then
			v14 = v14.Parent.Name == v_u_4.Name
		end
		if v_u_4:DistanceFromCharacter(v_u_8.Position) > 25 then
			v_u_10.Enabled = false
		else
			v_u_10.Enabled = v14
		end
	end)
end
function v1.Initialize()
	-- upvalues: (copy) v_u_15
	v_u_15()
end
return v1