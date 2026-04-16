-- ClientBike (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v_u_2 = game:GetService("ProximityPromptService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v3.devv).load("Signal")
local v_u_6 = require(script.BikeReplication)
local v_u_7 = require(script.Bike)
local v_u_8 = nil
function v1.Stop()
	-- upvalues: (ref) v_u_8
	if v_u_8 then
		v_u_8:Destroy()
		v_u_8 = nil
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (ref) v_u_8, (copy) v_u_4, (copy) v_u_7, (copy) v_u_2
	v_u_6.Initialize()
	v_u_5.LinkSignal("rideBike", function(p9)
		-- upvalues: (ref) v_u_8, (ref) v_u_4, (ref) v_u_7
		if p9 then
			if v_u_8 then
				v_u_8:Destroy()
				v_u_8 = nil
			end
			local v10 = workspace.Game.Bikes:WaitForChild(v_u_4.Name, 5)
			if v10 then
				if v10:GetAttribute("driver") == v_u_4.Name then
					v_u_8 = v_u_7.new(v10)
				end
			else
				print("no model")
				return
			end
		else
			if v_u_8 then
				v_u_8:Destroy()
				v_u_8 = nil
			end
			return
		end
	end)
	v_u_2.PromptShown:Connect(function(p11)
		-- upvalues: (ref) v_u_4, (ref) v_u_8
		if p11 and p11:IsDescendantOf(workspace.Game.Bikes) then
			if p11:GetAttribute("ridePrompt") then
				local v12 = p11.Parent.Parent.Parent
				if v12 then
					v12 = v12:GetAttribute("owner")
				end
				if v12 == v_u_4.Name then
					p11.ActionText = "Ride"
					p11.Enabled = true
				else
					p11.Enabled = false
				end
			end
			if v_u_8 then
				p11.Enabled = false
			end
		end
	end)
end
return v1