-- GUIScaling (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local v_u_3 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v_u_4 = workspace.CurrentCamera
local v_u_5 = require(v2.devv).load("GUILoader")
local v_u_6 = {}
local v_u_7 = {
	["Shop"] = 0.2,
	["Phone"] = 0.25,
	["ContextButtons"] = 0.55,
	["Help"] = 0.45,
	["Report"] = 0.45,
	["Map"] = 0.05,
	["MapRouting"] = 0.25,
	["Backpack"] = 0.4,
	["CaseMenu"] = 0.3,
	["TradeMenu"] = 0.325,
	["ConfirmationFrame"] = 0.28,
	["HouseMenu"] = 0.4,
	["ClanMenu"] = 0.25,
	["CraftingBenchMenu"] = 0.28,
	["TreasureMap"] = 0.4,
	["UpdateLog"] = 0.275,
	["HalloweenMenu"] = 0.3,
	["AdventCalendar"] = 0.3,
	["ChristmasMenu"] = 0.3,
	["Odds"] = 0.42,
	["EasterMenu"] = 0.325,
	["FireworkEventMenu"] = 0.36,
	["LunarEventMenu"] = 0.3
}
local function v_u_16()
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	local v8 = v_u_4.ViewportSize.Magnitude / 1800
	local v9 = math.clamp(v8, 0.33, 1)
	for _, v10 in ipairs(v_u_6) do
		if v10 and v10.Parent then
			local v11 = v_u_7[v10.Name] or (v_u_7[v10.Parent.Name] or 0.5)
			local v12 = 1 - v11
			local v13 = (v9 - 0.33) / 0.66
			local v14 = v11 + v12 * math.clamp(v13, 0, 1)
			local v15 = v10:FindFirstChildOfClass("UIScale")
			if v15 then
				if v10.Parent.Name == "Map" and v10.Name ~= "MapRouting" then
					v15.Scale = math.clamp(v14, 0.28, 0.72)
				else
					v15.Scale = math.min(v14, 1)
				end
			end
		end
	end
end
local function v_u_21(p17)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_16
	if v_u_5.Get(p17.Name) or p17.Name == "SecurityCamera" then
		for _, v18 in ipairs(p17:GetChildren()) do
			if v18:IsA("GuiObject") then
				local v19 = v18:FindFirstChildOfClass("UIScale")
				if v19 and v19.Scale == 1 then
					local v20 = v_u_6
					table.insert(v20, v18)
				end
			end
		end
		v_u_16()
	end
end
local function v_u_25(p22)
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if v_u_5.Get(p22.Name) then
		for v23, v24 in ipairs(v_u_6) do
			if v24 and v24.Parent == p22 then
				table.remove(v_u_6, v23)
			end
		end
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_3, (copy) v_u_21, (copy) v_u_25, (copy) v_u_16, (copy) v_u_4
	task.defer(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_21, (ref) v_u_25, (ref) v_u_16, (ref) v_u_4
		v_u_3.ChildAdded:Connect(v_u_21)
		v_u_3.ChildRemoved:Connect(v_u_25)
		for _, v26 in ipairs(v_u_3:GetChildren()) do
			v_u_21(v26)
		end
		v_u_16()
		v_u_4:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_16)
	end)
end
return v1