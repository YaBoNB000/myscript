-- ClientMining (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v_u_2 = game:GetService("ProximityPromptService")
local v_u_3 = game:GetService("CollectionService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Players").LocalPlayer
local v7 = require(v4.devv).load
local v_u_8 = v7("GetLocalUTCTime")
local v_u_9 = v7("secondsToClock")
local v_u_10 = v7("playAnimation")
local v_u_11 = v7("makeToast")
local v_u_12 = v7("v3sound")
local v_u_13 = v7("v3item")
local v_u_14 = v7("Maid").new()
local v_u_15 = nil
local v_u_16 = Random.new()
function v1.Initialize()
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_5, (copy) v_u_13, (copy) v_u_6, (copy) v_u_11, (ref) v_u_15, (copy) v_u_12, (copy) v_u_10, (copy) v_u_16, (copy) v_u_2, (copy) v_u_3
	local function v_u_28(p_u_17)
		-- upvalues: (ref) v_u_8, (ref) v_u_9, (ref) v_u_14, (ref) v_u_5, (ref) v_u_13, (ref) v_u_6, (ref) v_u_11, (ref) v_u_15, (ref) v_u_12, (ref) v_u_10, (ref) v_u_16
		local v_u_18 = p_u_17.Parent
		local v_u_19 = v_u_18.Parent
		local v_u_20 = p_u_17:IsDescendantOf(workspace.HousingPlots)
		local function v_u_22()
			-- upvalues: (copy) v_u_19, (ref) v_u_8, (copy) p_u_17, (ref) v_u_9
			if (v_u_19:GetAttribute("numOres") or 0) > 0 then
				return false
			end
			local v21 = v_u_8() - (v_u_19:GetAttribute("lastUsed") or v_u_8())
			if v21 >= 1200 then
				return false
			end
			p_u_17.ActionText = "Respawns in " .. v_u_9(1200 - v21)
			return true
		end
		v_u_14:GiveTask(v_u_5.Heartbeat:Connect(function()
			-- upvalues: (copy) v_u_20, (copy) v_u_22, (ref) v_u_13, (ref) v_u_6, (copy) v_u_19, (copy) p_u_17
			if v_u_20 and v_u_22() then
				return
			else
				local v23 = v_u_13.GetEquipped(v_u_6)
				if v23 and v23.name == "Pickaxe" then
					local v24 = v_u_19:GetAttribute("oreName")
					p_u_17.ActionText = v24 and "Mine " .. v24 or "Mine Ore"
				else
					p_u_17.ActionText = "Equip a Pickaxe"
				end
			end
		end))
		v_u_14:GiveTask(p_u_17.PromptButtonHoldBegan:Connect(function(_)
			-- upvalues: (copy) v_u_20, (copy) v_u_22, (ref) v_u_13, (ref) v_u_6, (ref) v_u_11, (ref) v_u_15, (ref) v_u_12, (copy) v_u_18, (ref) v_u_10, (ref) v_u_16, (copy) p_u_17
			if not (v_u_20 and v_u_22()) then
				local v_u_25 = v_u_13.GetEquipped(v_u_6)
				if v_u_25 and v_u_25.name == "Pickaxe" then
					v_u_6:SetAttribute("isMining", true)
					v_u_15 = task.spawn(function()
						-- upvalues: (ref) v_u_25, (ref) v_u_13, (ref) v_u_6, (ref) v_u_12, (ref) v_u_18, (ref) v_u_10, (ref) v_u_16, (ref) p_u_17, (ref) v_u_15
						while true do
							v_u_25 = v_u_13.GetEquipped(v_u_6)
							if not v_u_25 or v_u_25.name ~= "Pickaxe" then
								break
							end
							local v26 = v_u_12.newSound("pickaxe1")
							v26:attachToPart(v_u_18)
							v26:play()
							v_u_10(v_u_16:NextNumber() < 0.25 and "mine2" or "mine1", v_u_6.Character)
							task.wait(1.2)
						end
						p_u_17.Enabled = false
						task.delay(0.1, function()
							-- upvalues: (ref) p_u_17
							p_u_17.Enabled = true
						end)
						v_u_15 = nil
					end)
				else
					v_u_11("You need to equip a pickaxe!", "red", 2)
				end
			end
		end))
		v_u_14:GiveTask(p_u_17.PromptButtonHoldEnded:Connect(function(_)
			-- upvalues: (ref) v_u_15, (ref) v_u_6, (copy) p_u_17
			if v_u_15 then
				task.cancel(v_u_15)
				v_u_15 = nil
			end
			v_u_6:SetAttribute("isMining", nil)
			p_u_17.Enabled = false
			task.delay(0.1, function()
				-- upvalues: (ref) p_u_17
				p_u_17.Enabled = true
			end)
		end))
		v_u_14:GiveTask(p_u_17.Triggered:Connect(function()
			-- upvalues: (copy) v_u_20, (copy) v_u_22, (ref) v_u_13, (ref) v_u_6, (ref) v_u_11
			if not (v_u_20 and v_u_22()) then
				local v27 = v_u_13.GetEquipped(v_u_6)
				if not v27 or v27.name ~= "Pickaxe" then
					v_u_11("You need to equip a pickaxe!", "red", 2)
				end
			end
		end))
		v_u_14:GiveTask(p_u_17.PromptHidden:Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_6, (ref) v_u_15
			v_u_14:DoCleaning()
			v_u_6:SetAttribute("isMining", nil)
			if v_u_15 then
				task.cancel(v_u_15)
				v_u_15 = nil
			end
		end))
	end
	v_u_2.PromptShown:Connect(function(p29)
		-- upvalues: (ref) v_u_3, (copy) v_u_28
		if p29 then
			p29:IsA("ProximityPrompt")
		end
		if p29 and (p29.Enabled and v_u_3:HasTag(p29, "MinePrompt")) then
			v_u_28(p29)
		end
	end)
end
return v1