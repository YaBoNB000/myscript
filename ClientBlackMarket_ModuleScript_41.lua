-- ClientBlackMarket (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v2 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players").LocalPlayer
v_u_4:GetMouse()
local v5 = require(v2.devv).load
local v_u_6 = v5("commavalue")
local v_u_7 = v5("makeToast")
local v_u_8 = v5("Signal")
local v_u_9 = v5("v3item")
local v10 = v5("Maid")
local v_u_11 = workspace.BlackMarket
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = false
local v_u_15 = v10.new()
local function v_u_18()
	-- upvalues: (ref) v_u_12, (copy) v_u_11, (ref) v_u_13, (ref) v_u_14, (copy) v_u_15, (copy) v_u_3, (copy) v_u_1, (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7
	v_u_12 = v_u_11:WaitForChild("Dealer").PrimaryPart
	v_u_13 = v_u_12:FindFirstChildOfClass("ProximityPrompt")
	v_u_13.PromptShown:Connect(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_15, (ref) v_u_3, (ref) v_u_1, (ref) v_u_13
		if not v_u_14 then
			v_u_14 = true
			v_u_15:GiveTask(v_u_3.Heartbeat:Connect(v_u_1.Heartbeat))
			v_u_15:GiveTask(v_u_13.PromptHidden:Connect(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_14
				v_u_15:DoCleaning()
				v_u_14 = false
			end))
		end
	end)
	v_u_13.Triggered:Connect(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_4, (ref) v_u_8, (ref) v_u_7
		local v16, v17 = v_u_9.GetEquipped(v_u_4)
		if v16 and (v17 and v16.sellPrice) then
			v_u_8.FireServer("sellItem", v17)
			return
		elseif v16 and (v17 and not v16.sellPrice) then
			v_u_7("You can\'t sell this item!", "red", 3)
		else
			v_u_7("Equip an item first!", "red", 3)
		end
	end)
end
function v_u_1.Heartbeat()
	-- upvalues: (ref) v_u_14, (copy) v_u_9, (copy) v_u_4, (ref) v_u_13, (copy) v_u_6
	if v_u_14 then
		local v19 = v_u_9.GetEquipped(v_u_4)
		if v19 and v19.sellPrice then
			local v20 = v19.sellPrice
			local v21 = v19.ammoManager
			if v21 then
				v21 = v19.ammoManager.ammo
			end
			if v21 and v19.holdableType == "Valuable" then
				v20 = v20 * v21
			end
			v_u_13.ObjectText = v19.name or ""
			v_u_13.ActionText = "Sell for $" .. v_u_6(v20)
			return
		elseif v19 then
			v_u_13.ObjectText = ""
			v_u_13.ActionText = "You can\'t sell this item!"
		else
			v_u_13.ObjectText = ""
			v_u_13.ActionText = "Equip an item to sell!"
		end
	else
		return
	end
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_18
	task.defer(v_u_18)
end
return v_u_1