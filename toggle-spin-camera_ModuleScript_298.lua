-- toggle-spin-camera (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
local v_u_3 = game:GetService("RunService")
game:GetService("CollectionService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.devv).load("Maid").new()
local v_u_6 = false
local function v_u_9(p7)
	-- upvalues: (copy) v_u_5
	local v_u_8 = p7.Character or p7.CharacterAdded:Wait()
	if v_u_8 then
		v_u_8 = v_u_8:WaitForChild("Humanoid")
	end
	if v_u_8 then
		v_u_8.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
		v_u_8.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		v_u_8.HealthDisplayDistance = 0
		v_u_8.NameDisplayDistance = 0
		v_u_5:GiveTask(v_u_8:GetPropertyChangedSignal("HealthDisplayType"):Connect(function()
			-- upvalues: (copy) v_u_8
			v_u_8.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
		end))
		v_u_5:GiveTask(v_u_8:GetPropertyChangedSignal("DisplayDistanceType"):Connect(function()
			-- upvalues: (copy) v_u_8
			v_u_8.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		end))
	end
end
local v_u_10 = 0
return {
	["Name"] = "toggle-spin-camera",
	["Aliases"] = {},
	["Description"] = "Toggle camera mode",
	["Group"] = "Admin",
	["Args"] = {},
	["ClientRun"] = function(_)
		-- upvalues: (ref) v_u_6, (copy) v_u_2, (copy) v_u_5, (copy) v_u_1, (copy) v_u_9, (copy) v_u_3, (ref) v_u_10
		v_u_6 = not v_u_6
		v_u_2:SetAttribute("isCamera", v_u_6)
		v_u_5:DoCleaning()
		if v_u_6 then
			v_u_5:GiveTask(v_u_1.PlayerAdded:Connect(function(p_u_11)
				-- upvalues: (ref) v_u_9, (ref) v_u_5
				task.spawn(v_u_9, p_u_11)
				v_u_5:GiveTask(p_u_11.CharacterAdded:Connect(function()
					-- upvalues: (ref) v_u_9, (copy) p_u_11
					task.spawn(v_u_9, p_u_11)
				end))
			end))
			for _, v_u_12 in v_u_1:GetPlayers() do
				task.spawn(v_u_9, v_u_12)
				v_u_5:GiveTask(v_u_12.CharacterAdded:Connect(function()
					-- upvalues: (ref) v_u_9, (copy) v_u_12
					task.spawn(v_u_9, v_u_12)
				end))
			end
			task.delay(5, function()
				-- upvalues: (ref) v_u_3, (ref) v_u_10, (ref) v_u_5
				v_u_3:BindToRenderStep("ArtsyCam", Enum.RenderPriority.Camera.Value, function(p13)
					-- upvalues: (ref) v_u_10
					v_u_10 = v_u_10 + p13 * 3.141592653589793 / 12
					workspace.CurrentCamera.CFrame = CFrame.new(918.048, 60, -554.533) * CFrame.Angles(0, v_u_10, 0) * CFrame.new(0, 0, 100) * CFrame.Angles(-0.2617993877991494, 0, 0)
				end)
				v_u_5:GiveTask(function()
					-- upvalues: (ref) v_u_3
					v_u_3:UnbindFromRenderStep("ArtsyCam")
				end)
			end)
		end
		return "Toggled"
	end
}