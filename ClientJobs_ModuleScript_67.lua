-- ClientJobs (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.Models.Rubbish
local v_u_3 = v1.Guis.BillboardGuis.JobTaskBillboard
local v_u_4 = game:GetService("CollectionService")
game:GetService("RunService")
game:GetService("Players")
local v5 = require(v1.devv).load
local v_u_6 = v5("GUILoader")
local v_u_7 = v5("v3sound")
local v_u_8 = v5("Signal")
local v_u_9 = v5("Maid")
local v_u_10 = {}
local v_u_11 = {}
function v_u_10._makeRubbish(p_u_12, p13)
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (copy) v_u_2, (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_4
	if not v_u_11[p_u_12] then
		local v14 = v_u_9.new()
		local v_u_15 = false
		local v16 = p13.name
		local v17 = p13.cframe
		local v_u_18 = v_u_2[v16]:Clone()
		v_u_18:SetAttribute("guid", p_u_12)
		v_u_18:PivotTo(v17)
		v_u_18.Parent = workspace.Game.Local.Rubbish
		local v19 = Instance.new("ClickDetector")
		v19.MaxActivationDistance = 10
		v19.Parent = v_u_18.PrimaryPart
		local v20 = Instance.new("SelectionBox")
		v20.LineThickness = 0.01
		v20.Adornee = v_u_18
		v20.Color3 = Color3.fromRGB(255, 255, 255)
		v20.Transparency = 1
		v20.Parent = v_u_18
		local v21 = v_u_18:GetAttribute("Tooltip")
		if v21 then
			local v22 = v_u_6.Get("Billboards")
			local v_u_23 = v_u_3:Clone()
			v_u_23.Label.Text = v21
			v_u_23.Enabled = true
			v_u_23.Parent = v22.jobs
			v_u_23.Adornee = v_u_18.PrimaryPart
			v14:GiveTask(function()
				-- upvalues: (copy) v_u_23
				v_u_23:Destroy()
			end)
		end
		v14:GiveTask(v19.MouseClick:Connect(function(p24)
			-- upvalues: (ref) v_u_15, (copy) v_u_18, (ref) v_u_8, (copy) p_u_12, (ref) v_u_10, (ref) v_u_7
			if not v_u_15 then
				v_u_15 = true
				local v25 = v_u_18:GetAttribute("cleanSFX")
				v_u_8.FireServer("cleanRubbish", p_u_12)
				v_u_10._clearRubbish(p_u_12)
				if v25 then
					local v26 = v_u_7.newSound(v25)
					v26.playbackSpeed = 1
					v26:attachToPart(p24.Character.PrimaryPart)
					v26:play()
				end
			end
		end))
		v14:GiveTask(v19.MouseHoverEnter:Connect(function()
			-- upvalues: (copy) v_u_18
			local v27 = v_u_18:FindFirstChild("SelectionBox")
			v27.Color3 = Color3.fromRGB(0, 255, 0)
			v27.Transparency = 0.1
		end))
		v14:GiveTask(v19.MouseHoverLeave:Connect(function()
			-- upvalues: (copy) v_u_18
			local v28 = v_u_18:FindFirstChild("SelectionBox")
			v28.Color3 = Color3.fromRGB(255, 255, 255)
			v28.Transparency = 1
		end))
		v14:GiveTask(function()
			-- upvalues: (copy) v_u_18
			if v_u_18 then
				v_u_18:Destroy()
			end
		end)
		p13.maid = v14
		p13.model = v_u_18
		v_u_11[p_u_12] = p13
		v_u_4:AddTag(v_u_18, "rubbish")
	end
end
function v_u_10._clearRubbish(p29)
	-- upvalues: (copy) v_u_11
	local v30 = v_u_11[p29]
	if v30 then
		local v31 = v30.maid
		if v31 then
			v31:DoCleaning()
		end
		v_u_11[p29] = nil
	end
end
function v_u_10._clearAllRubbish()
	-- upvalues: (copy) v_u_11, (copy) v_u_10
	for v32, _ in pairs(v_u_11) do
		v_u_10._clearRubbish(v32)
	end
end
function v_u_10.Initialize()
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_4
	v_u_8.LinkSignal("makeRubbish", v_u_10._makeRubbish)
	v_u_8.LinkSignal("clearAllRubbish", v_u_10._clearAllRubbish)
	v_u_4:GetInstanceRemovedSignal("rubbish"):Connect(function(p33)
		-- upvalues: (ref) v_u_10
		local v34 = p33:GetAttribute("guid")
		v_u_10._clearRubbish(v34)
	end)
end
return v_u_10