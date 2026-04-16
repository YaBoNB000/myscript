-- ClientSewer (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("Players")
local v_u_5 = v_u_4.LocalPlayer
local v6 = require(v_u_2.devv).load
local v_u_7 = v6("TimeHandler")
local v_u_8 = v6("dialogQueue")
local v_u_9 = v6("commavalue")
local v_u_10 = v6("makeDialog")
local v_u_11 = v6("makeToast")
local v_u_12 = v6("sewerUtils")
local v_u_13 = v6("GUILoader")
local v_u_14 = v6("globals")
local v_u_15 = v6("Signal")
local v_u_16 = v6("state")
local v_u_17 = false
local v_u_18 = false
local v_u_19 = false
local v_u_20 = false
local v_u_21 = nil
local function v_u_26()
	-- upvalues: (copy) v_u_5, (ref) v_u_21, (copy) v_u_9, (ref) v_u_19
	local v22 = v_u_5:GetAttribute("sewerKills") or 0
	local v23 = v_u_5:GetAttribute("sewerDeaths") or 0
	local v24 = v_u_5:GetAttribute("sewerStreak") or 0
	local v25 = string.format("%.2f", v22 / math.max(1, v23))
	v_u_21.Frame.Holder.Kills.Text = string.format("Kills: %s", v_u_9(v22))
	v_u_21.Frame.Holder.Deaths.Text = string.format("Deaths: %s", v_u_9(v23))
	v_u_21.Frame.Holder.KDR.Text = string.format("KDR: %s", v25)
	v_u_21.Frame.Holder.Streak.Text = string.format("Streak: %s", v_u_9(v24))
	v_u_21.Frame.Holder.Notice.Visible = v_u_19
end
local function v_u_29()
	-- upvalues: (copy) v_u_3, (ref) v_u_21
	local v27 = v_u_3.TouchEnabled or workspace.CurrentCamera.ViewportSize.X < 1000
	if v27 then
		v_u_21.Frame.Position = UDim2.fromScale(0.95, 0.05)
		v_u_21.Frame.AnchorPoint = Vector2.new(1, 0)
		v_u_21.Frame.Holder.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	else
		v_u_21.Frame.Position = UDim2.fromScale(0.05, 0.925)
		v_u_21.Frame.AnchorPoint = Vector2.new(0, 1)
		v_u_21.Frame.Holder.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	end
	for _, v28 in v_u_21.Frame.Holder:GetChildren() do
		if v28:IsA("TextLabel") then
			v28.TextXAlignment = v27 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
		end
	end
end
local v_u_30 = false
local function v_u_32(p31)
	-- upvalues: (ref) v_u_20, (ref) v_u_21, (copy) v_u_3, (ref) v_u_19
	if p31 == nil then
		v_u_20 = not v_u_20
	else
		v_u_20 = p31
	end
	v_u_21.Frame.Holder.Visible = not v_u_20
	if v_u_3.TouchEnabled or workspace.CurrentCamera.ViewportSize.X < 1000 then
		v_u_21.Frame.Arrow.Position = v_u_20 and UDim2.new(0.5, 20, 0, -20) or UDim2.new(0.5, 20, 1, 40)
		v_u_21.Frame.Arrow.AnchorPoint = Vector2.new(0.5, v_u_20 and 0 or 1)
		v_u_21.Frame.Arrow.Rotation = v_u_20 and 90 or -90
	else
		v_u_21.Frame.Arrow.Position = v_u_20 and UDim2.new(0.5, -20, 1, 0) or UDim2.new(0.5, -20, 0, v_u_19 and -67 or -45)
		v_u_21.Frame.Arrow.AnchorPoint = Vector2.new(0.5, v_u_20 and 1 or 0)
		v_u_21.Frame.Arrow.Rotation = v_u_20 and -90 or 90
	end
end
local function v_u_35()
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_9, (copy) v_u_14, (copy) v_u_10, (ref) v_u_30, (copy) v_u_16, (copy) v_u_11, (copy) v_u_15
	for _, v33 in v_u_8._queue do
		if v33.UIObject and v33.UIObject.Name == "PurchaseDialog" then
			return
		end
	end
	local v34 = v_u_2.Guis.Dialog.PurchaseDialog:Clone()
	v34.Frame.UpperLabel.Text = "Buy Reset KDR?"
	v34.Frame.CostLabel.Text = string.format("$%s", v_u_9(v_u_14.RESET_KDR_COST))
	v34.Frame.CostLabel.Position = UDim2.fromScale(0.5, 0.5)
	v34.Frame.Description.Text = "Note: Resets your total kills, total deaths, and KDR."
	v34.Frame.Description.Visible = true
	v_u_8:Add((v_u_10({
		["super"] = "PurchaseDialog",
		["UIObject"] = v34,
		["button1func"] = function()
			-- upvalues: (ref) v_u_30, (ref) v_u_16, (ref) v_u_14, (ref) v_u_8, (ref) v_u_11, (ref) v_u_9, (ref) v_u_15
			if not v_u_30 then
				v_u_30 = true
				task.delay(1, function()
					-- upvalues: (ref) v_u_30
					v_u_30 = false
				end)
				if v_u_16.data.money < v_u_14.RESET_KDR_COST then
					v_u_8:Next()
					return v_u_11(string.format("You need $%s more cash to reset your KDR!", v_u_9(v_u_14.RESET_KDR_COST - v_u_16.data.money)), "red", 4)
				end
				v_u_15.FireServer("purchaseResetKDR")
				v_u_8:Next()
			end
		end,
		["button2func"] = function()
			-- upvalues: (ref) v_u_8
			v_u_8:Next()
		end
	})))
end
function v1.Initialize()
	-- upvalues: (ref) v_u_21, (copy) v_u_13, (ref) v_u_19, (copy) v_u_15, (copy) v_u_26, (copy) v_u_5, (copy) v_u_35, (copy) v_u_32, (copy) v_u_4, (copy) v_u_12, (ref) v_u_17, (ref) v_u_18, (copy) v_u_7, (copy) v_u_29, (copy) v_u_11
	v_u_21 = v_u_13.Get("Sewer")
	task.defer(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_15, (ref) v_u_26
		v_u_19 = v_u_15.InvokeServer("isPrivateServer")
		v_u_26()
	end)
	for _, v36 in { "sewerKills", "sewerDeaths", "sewerStreak" } do
		v_u_5:GetAttributeChangedSignal(v36):Connect(v_u_26)
	end
	v_u_21.Frame.Holder.Reset.Holder.Button.Activated:Connect(v_u_35)
	v_u_21.Frame.Arrow.Activated:Connect(function()
		-- upvalues: (ref) v_u_32
		v_u_32()
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_12, (ref) v_u_17, (ref) v_u_18, (ref) v_u_7, (ref) v_u_29, (ref) v_u_32, (ref) v_u_11, (ref) v_u_21
		local v37 = 0
		while task.wait(0.5) do
			if v37 % 5 == 0 then
				for _, v38 in v_u_4:GetPlayers() do
					if v38 ~= v_u_5 then
						v38:SetAttribute("inSewer", (v_u_12.isPlayerInSewer(v38)))
					end
				end
			end
			v_u_17 = v_u_12.isPlayerInSewer(v_u_5)
			v_u_5:SetAttribute("inSewer", v_u_17)
			if v_u_17 and not v_u_18 then
				v_u_7.Tween("sewer")
				v_u_29()
				v_u_32(false)
				v_u_11("You entered the Sewer PVP zone!", "red", 3)
			end
			if v_u_18 and not v_u_17 then
				v_u_7.Reset()
				v_u_11("You left the Sewer PVP zone!", "green", 3)
			end
			v_u_18 = v_u_17
			v_u_21.Frame.Visible = v_u_17
			local v39 = v37 + 1
			v37 = v39 > 1000 and 0 or v39
		end
	end)
end
return v1