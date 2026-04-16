-- phoneStore (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientBuildings
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = require(v_u_2.devv).load
local v_u_5 = v_u_4("ConversionHelper")
local v_u_6 = v_u_4("dialogQueue")
local v_u_7 = v_u_4("commavalue")
local v_u_8 = v_u_4("makeDialog")
local v_u_9 = v_u_4("Signal")
local v_u_10 = v_u_4("state")
local v_u_11 = v_u_4("items")
local v_u_12 = v_u_4("DOF")
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = false
local function v_u_20()
	-- upvalues: (copy) v_u_3, (copy) v_u_14, (ref) v_u_13
	local v16 = v_u_3:GetAttribute("phone") or "rPhone"
	for _, v17 in v_u_14 do
		local v18 = v17.PrimaryPart:FindFirstChildOfClass("ProximityPrompt")
		if v18 then
			if v16 == v17.Name then
				v18.ActionText = "Equipped"
			else
				local v19 = v17.Name
				if v_u_13[v19] ~= nil and true or v19 == "rPhone" then
					v18.ActionText = "Equip"
				end
			end
		end
	end
end
local function v_u_25(p_u_21)
	-- upvalues: (ref) v_u_15, (copy) v_u_11, (copy) v_u_2, (copy) v_u_7, (copy) v_u_12, (copy) v_u_8, (copy) v_u_10, (copy) v_u_5, (ref) v_u_13, (copy) v_u_9, (copy) v_u_20, (copy) v_u_4, (copy) v_u_6
	if not v_u_15 then
		local v_u_22 = v_u_11[p_u_21]
		local v_u_23 = v_u_2.Guis.Dialog.TwoButtonDialog:Clone()
		v_u_23.Frame.MiddleLabel.Text = "Do you want to buy a " .. v_u_22.displayName .. " for $" .. v_u_7(v_u_22.cost) .. "?"
		v_u_23.Frame.MiddleLabel.Size = UDim2.fromOffset(325, 150)
		v_u_23.Frame.MiddleLabel.TextScaled = false
		v_u_23.Frame.MiddleLabel.TextSize = 32
		v_u_23.Frame.MiddleLabel.LineHeight = 1.15
		v_u_23.Frame.MiddleLabel:ClearAllChildren()
		v_u_23.Frame.LowerLabel.Visible = false
		v_u_23.Frame.UpperLabel.Visible = false
		v_u_23.Frame.Button1.Text = "YES"
		v_u_23.Frame.Button2.Text = "NO"
		v_u_12(true)
		v_u_15 = true
		v_u_6:Add((v_u_8({
			["super"] = "TwoButtonDialog",
			["UIObject"] = v_u_23,
			["button1func"] = function()
				-- upvalues: (ref) v_u_10, (copy) v_u_22, (copy) v_u_23, (ref) v_u_5, (copy) p_u_21, (ref) v_u_13, (ref) v_u_9, (ref) v_u_20, (ref) v_u_4, (ref) v_u_15, (ref) v_u_6
				if v_u_10.data.money < v_u_22.cost then
					v_u_23.Frame.MiddleLabel.Text = "You can\'t afford that!"
					v_u_23.Frame.Button1.Visible = false
					v_u_23.Frame.Button2.Position = UDim2.new(0.5, 0, 0.8, 0)
					v_u_23.Frame.Button2.Text = "NEVERMIND"
					v_u_5(v_u_22.cost - v_u_10.data.money)
					return
				else
					local v24 = p_u_21
					if v_u_13[v24] == nil and v24 ~= "rPhone" then
						if v_u_9.InvokeServer("buyPhone", p_u_21) then
							v_u_13[p_u_21] = true
						end
						v_u_20()
						v_u_4("v3item").inventory.unequipAll()
						v_u_15 = false
						v_u_6:Next()
					end
				end
			end,
			["button2func"] = function()
				-- upvalues: (ref) v_u_15, (ref) v_u_12, (ref) v_u_6
				v_u_15 = false
				v_u_12(false)
				v_u_6:Next()
			end,
			["closeFunc"] = function()
				-- upvalues: (ref) v_u_15, (ref) v_u_12
				v_u_15 = false
				v_u_12(false)
			end
		})))
	end
end
local function v_u_38(p_u_26)
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (ref) v_u_13, (copy) v_u_7, (copy) v_u_9, (copy) v_u_20, (copy) v_u_4, (copy) v_u_25, (copy) v_u_14
	if p_u_26.PrimaryPart then
		local v27 = v_u_11[p_u_26.Name]
		if v27 then
			local v28 = v27.cost
			local v29 = v_u_3:GetAttribute("phone") or "rPhone"
			local v30 = p_u_26.Name
			local v31 = v_u_13[v30] ~= nil and true or v30 == "rPhone"
			local v32 = v29 == p_u_26.Name and "Equipped" or (v31 and "Equip" or "Buy ($" .. v_u_7(v28) .. ")")
			local v33 = Instance.new("ProximityPrompt")
			v33.ActionText = v32
			v33.HoldDuration = 0.25
			v33.RequiresLineOfSight = false
			v33.Parent = p_u_26.PrimaryPart
			v33.Triggered:Connect(function(p34)
				-- upvalues: (ref) v_u_3, (copy) p_u_26, (ref) v_u_13, (ref) v_u_9, (ref) v_u_20, (ref) v_u_4, (ref) v_u_25
				if p34 == v_u_3 then
					if (v_u_3:GetAttribute("phone") or "rPhone") == p_u_26.Name then
						return
					else
						local v35 = p_u_26.Name
						if v_u_13[v35] ~= nil and true or v35 == "rPhone" then
							v_u_9.InvokeServer("equipPhone", p_u_26.Name)
							v_u_20()
							v_u_4("v3item").inventory.unequipAll()
						else
							v_u_25(p_u_26.Name)
						end
					end
				else
					return
				end
			end)
			local v36 = p_u_26:FindFirstChild("Decal", true)
			if v36 then
				v36:Destroy()
			end
			local v37 = v_u_14
			table.insert(v37, p_u_26)
		end
	else
		return
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_3, (ref) v_u_13, (copy) v_u_9, (copy) v_u_38, (copy) v_u_20
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_13, (ref) v_u_9, (ref) v_u_38
		repeat
			task.wait(0.1)
		until v_u_3:GetAttribute("dataLoaded")
		repeat
			v_u_13 = v_u_9.InvokeServer("getOwnedItems")
			task.wait(1)
		until v_u_13 ~= nil
		for _, v39 in workspace.Phones:WaitForChild("PhoneModels"):GetChildren() do
			v_u_38(v39)
		end
	end)
	v_u_3:GetAttributeChangedSignal("phone"):Connect(v_u_20)
end
return v1