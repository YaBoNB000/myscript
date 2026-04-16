-- LowGFXHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load("Maid")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = {}
local v_u_6 = 0
local v_u_7 = false
local v_u_8 = false
local v_u_9 = v2.new()
function v_u_5.SetLowGFX()
	-- upvalues: (ref) v_u_7, (copy) v_u_4, (ref) v_u_8, (copy) v_u_3, (copy) v_u_9, (ref) v_u_6
	v_u_7 = v_u_4:GetAttribute("LowGFX")
	if v_u_7 and not v_u_8 then
		local v10 = 0
		for _, v11 in workspace:GetDescendants() do
			if v11:IsA("BasePart") and not (v11:GetAttribute("origMaterial") or v11:IsDescendantOf(workspace.Game.Bikes)) then
				v11:SetAttribute("origMaterial", v11.Material)
				v10 = v10 + 1
				if v10 >= 200 then
					v_u_3.Heartbeat:wait()
					v10 = 0
				end
			end
		end
		v_u_9:DoCleaning()
		v_u_9:GiveTask(workspace.DescendantAdded:Connect(function(p12)
			-- upvalues: (ref) v_u_7
			if p12:IsA("BasePart") and not p12:GetAttribute("origMaterial") then
				if not p12:IsDescendantOf(workspace.Game.Bikes) then
					p12:SetAttribute("origMaterial", p12.Material)
					if v_u_7 then
						p12.Material = Enum.Material.SmoothPlastic
					end
				end
			else
				return
			end
		end))
		v_u_8 = true
	end
	v_u_6 = v_u_6 + 1
	local v13 = v_u_6
	local v14 = 0
	for _, v15 in workspace:GetDescendants() do
		if v_u_6 ~= v13 then
			break
		end
		if v15:IsA("BasePart") and (v15:GetAttribute("origMaterial") and not v15:IsDescendantOf(workspace.Game.Bikes)) then
			v15.Material = v_u_7 and Enum.Material.SmoothPlastic or v15:GetAttribute("origMaterial")
			v14 = v14 + 1
		end
		if v14 >= 200 then
			v_u_3.Heartbeat:wait()
			v14 = 0
		end
	end
end
function v_u_5.Initialize()
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	task.defer(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_5
		v_u_4:GetAttributeChangedSignal("LowGFX"):Connect(function()
			-- upvalues: (ref) v_u_5
			task.spawn(v_u_5.SetLowGFX)
		end)
		if v_u_4:GetAttribute("LowGFX") then
			task.spawn(v_u_5.SetLowGFX)
		end
	end)
end
return v_u_5