-- jewelryStore (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientBuildings
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = require(v_u_2.devv).load
local v_u_5 = v_u_4("ConversionHelper")
local v_u_6 = v_u_4("abbreviateNumber")
local v_u_7 = v_u_4("dialogQueue")
local v_u_8 = v_u_4("commavalue")
local v_u_9 = v_u_4("makeDialog")
local v_u_10 = v_u_4("Signal")
local v_u_11 = v_u_4("state")
local v_u_12 = v_u_4("items")
local v_u_13 = v_u_4("DOF")
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = false
local function v_u_23()
	-- upvalues: (copy) v_u_3, (copy) v_u_15, (copy) v_u_12, (ref) v_u_14
	local v17 = v_u_3:GetAttribute("wallet") or "Wallet"
	for _, v18 in v_u_15 do
		local v19 = v18.PrimaryPart:FindFirstChildOfClass("ProximityPrompt")
		local _ = v_u_12[v18.Name]
		if v19 then
			if v17 == v18.Name then
				v19.ActionText = "Equipped"
			else
				local v20 = v18.Name
				local v21 = v_u_14[v20] ~= nil and true or v20 == "Wallet"
				local v22 = v_u_12[v20]
				if v22.moneyEarned then
					v21 = (v_u_3:GetAttribute("moneyEarned") or 0) >= v22.moneyEarned
				end
				if v21 then
					v19.ActionText = "Equip"
				end
			end
		end
	end
end
local function v_u_31(p_u_24)
	-- upvalues: (ref) v_u_16, (copy) v_u_12, (copy) v_u_2, (copy) v_u_8, (copy) v_u_13, (copy) v_u_9, (copy) v_u_11, (copy) v_u_5, (ref) v_u_14, (copy) v_u_3, (copy) v_u_10, (copy) v_u_23, (copy) v_u_4, (copy) v_u_7
	if v_u_16 then
		return
	else
		local v_u_25 = v_u_12[p_u_24]
		if v_u_25.cost then
			local v_u_26 = v_u_2.Guis.Dialog.TwoButtonDialog:Clone()
			v_u_26.Frame.MiddleLabel.Text = "Do you want to buy a " .. v_u_25.displayName .. " for $" .. v_u_8(v_u_25.cost) .. "?"
			v_u_26.Frame.MiddleLabel.Size = UDim2.fromOffset(325, 150)
			v_u_26.Frame.MiddleLabel.TextScaled = false
			v_u_26.Frame.MiddleLabel.TextSize = 32
			v_u_26.Frame.MiddleLabel.LineHeight = 1.15
			v_u_26.Frame.MiddleLabel:ClearAllChildren()
			v_u_26.Frame.LowerLabel.Visible = false
			v_u_26.Frame.UpperLabel.Visible = false
			v_u_26.Frame.Button1.Text = "YES"
			v_u_26.Frame.Button2.Text = "NO"
			v_u_13(true)
			v_u_16 = true
			v_u_7:Add((v_u_9({
				["super"] = "TwoButtonDialog",
				["UIObject"] = v_u_26,
				["button1func"] = function()
					-- upvalues: (ref) v_u_11, (copy) v_u_25, (copy) v_u_26, (ref) v_u_5, (copy) p_u_24, (ref) v_u_14, (ref) v_u_12, (ref) v_u_3, (ref) v_u_10, (ref) v_u_23, (ref) v_u_4, (ref) v_u_16, (ref) v_u_7
					if v_u_11.data.money < v_u_25.cost then
						v_u_26.Frame.MiddleLabel.Text = "You can\'t afford that!"
						v_u_26.Frame.Button1.Visible = false
						v_u_26.Frame.Button2.Position = UDim2.new(0.5, 0, 0.8, 0)
						v_u_26.Frame.Button2.Text = "NEVERMIND"
						v_u_5(v_u_25.cost - v_u_11.data.money)
						return
					else
						local v27 = p_u_24
						local v28 = v_u_14[v27] ~= nil and true or v27 == "Wallet"
						local v29 = v_u_12[v27]
						if v29.moneyEarned then
							v28 = (v_u_3:GetAttribute("moneyEarned") or 0) >= v29.moneyEarned
						end
						if not v28 then
							if v_u_10.InvokeServer("buyWallet", p_u_24) then
								v_u_14[p_u_24] = true
							end
							v_u_23()
							local v30 = v_u_4("v3item")
							v30.inventory.unequipAll()
							v30.inventory.walletUpdate(p_u_24)
							v_u_16 = false
							v_u_7:Next()
						end
					end
				end,
				["button2func"] = function()
					-- upvalues: (ref) v_u_16, (ref) v_u_13, (ref) v_u_7
					v_u_16 = false
					v_u_13(false)
					v_u_7:Next()
				end,
				["closeFunc"] = function()
					-- upvalues: (ref) v_u_16, (ref) v_u_13
					v_u_16 = false
					v_u_13(false)
				end
			})))
		end
	end
end
local function v_u_49(p_u_32)
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (ref) v_u_14, (copy) v_u_8, (copy) v_u_6, (copy) v_u_10, (copy) v_u_23, (copy) v_u_4, (copy) v_u_31, (copy) v_u_15
	if p_u_32.PrimaryPart then
		local v33 = v_u_12[p_u_32.Name]
		if v33 then
			local v34 = v33.cost
			local v35 = v33.moneyEarned
			local v36 = v_u_3:GetAttribute("wallet") or "Wallet"
			local v37 = p_u_32.Name
			local v38 = v_u_14[v37] ~= nil and true or v37 == "Wallet"
			local v39 = v_u_12[v37]
			if v39.moneyEarned then
				v38 = (v_u_3:GetAttribute("moneyEarned") or 0) >= v39.moneyEarned
			end
			local v40 = ""
			if v34 then
				v40 = "Buy ($" .. v_u_8(v34) .. ")"
			elseif v35 then
				v40 = "Unlock after $" .. v_u_6(v35) .. " cash earned"
			end
			local v41 = v36 == p_u_32.Name and "Equipped" or (v38 and "Equip" or v40)
			local v42 = Instance.new("ProximityPrompt")
			v42.ActionText = v41
			v42.HoldDuration = 0.25
			v42.RequiresLineOfSight = false
			v42.Parent = p_u_32.PrimaryPart
			v42.Triggered:Connect(function(p43)
				-- upvalues: (ref) v_u_3, (copy) p_u_32, (ref) v_u_14, (ref) v_u_12, (ref) v_u_10, (ref) v_u_23, (ref) v_u_4, (ref) v_u_31
				if p43 == v_u_3 then
					if (v_u_3:GetAttribute("wallet") or "Wallet") == p_u_32.Name then
						return
					else
						local v44 = p_u_32.Name
						local v45 = v_u_14[v44] ~= nil and true or v44 == "Wallet"
						local v46 = v_u_12[v44]
						if v46.moneyEarned then
							v45 = (v_u_3:GetAttribute("moneyEarned") or 0) >= v46.moneyEarned
						end
						if v45 then
							v_u_10.InvokeServer("equipWallet", p_u_32.Name)
							v_u_23()
							local v47 = v_u_4("v3item")
							v47.inventory.unequipAll()
							v47.inventory.walletUpdate(p_u_32.Name)
						else
							v_u_31(p_u_32.Name)
						end
					end
				else
					return
				end
			end)
			local v48 = v_u_15
			table.insert(v48, p_u_32)
		end
	else
		return
	end
end
local function v_u_52()
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_8
	local v50 = v_u_11.data.money or 0
	for _, v51 in v_u_15 do
		v51.Handle.BillboardGui.MoneyLabel.Text = "$" .. v_u_8(v50)
	end
end
local function v_u_54()
	-- upvalues: (copy) v_u_52, (copy) v_u_11
	v_u_52()
	local v53 = 0
	while true do
		repeat
			task.wait(0.1)
		until v_u_11.data.money ~= v53
		v53 = v_u_11.data.money
		v_u_52()
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_3, (ref) v_u_14, (copy) v_u_10, (copy) v_u_49, (copy) v_u_54, (copy) v_u_23
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_14, (ref) v_u_10, (ref) v_u_49, (ref) v_u_54
		repeat
			task.wait(0.1)
		until v_u_3:GetAttribute("dataLoaded")
		v_u_14 = v_u_10.InvokeServer("getOwnedItems")
		for _, v55 in workspace.Wallets:WaitForChild("WalletModels"):GetChildren() do
			v_u_49(v55)
		end
		v_u_54()
	end)
	v_u_3:GetAttributeChangedSignal("wallet"):Connect(v_u_23)
	v_u_3:GetAttributeChangedSignal("moneyEarned"):Connect(v_u_23)
end
return v1