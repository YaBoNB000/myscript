-- policeStation (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientBuildings
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players").LocalPlayer
local v4 = require(v2.devv).load
local v_u_5 = v4("PromptPurchase")
local v_u_6 = v4("purchases")
local function v_u_11()
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v7 = workspace:WaitForChild("SpawnPoliceCruiser")
	local v8 = Instance.new("ProximityPrompt")
	v8.ActionText = "Spawn Cruiser"
	v8.HoldDuration = 0
	v8.MaxActivationDistance = 14
	v8.RequiresLineOfSight = true
	v8.Parent = v7
	local v_u_9 = v_u_6.special.cruiser.id
	v8.Triggered:Connect(function(p10)
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (copy) v_u_9
		if p10 == v_u_3 then
			v_u_5.Prompt(v_u_9, Enum.InfoType.Product)
		end
	end)
end
function v1.Initialize()
	-- upvalues: (copy) v_u_11
	v_u_11()
end
return v1