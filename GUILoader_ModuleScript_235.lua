-- GUILoader (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v_u_3 = v1.Guis.ScreenGuis
local _ = v1.Guis.BillboardGuis
local v_u_4 = {}
local v_u_5 = {}
function v_u_4.Load(p6, p7)
	-- upvalues: (copy) v_u_5
	if v_u_5[p7] then
		return v_u_5[p7]
	end
	if p6 then
		p6 = p6:Clone()
		v_u_5[p7] = p6
	end
	return p6
end
function v_u_4.Get(p8)
	-- upvalues: (copy) v_u_5
	return v_u_5[p8]
end
function v_u_4.Initialize()
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	local v9 = v_u_4.Load(v_u_3.Item, "Item")
	v9.Enabled = false
	v9.Parent = v_u_2
	local v10 = v_u_4.Load(v_u_3.Backpack, "Backpack")
	v10.Enabled = false
	v10.Parent = v_u_2
	local v11 = v_u_4.Load(v_u_3.Hotbar, "Hotbar")
	v11.Enabled = false
	v11.Parent = v_u_2
	local v12 = v_u_4.Load(v_u_3.Phone, "Phone")
	v12.Enabled = false
	v12.Parent = v_u_2
	local v13 = v_u_4.Load(v_u_3.Notifs, "Notifs")
	v13.Enabled = true
	v13.Parent = v_u_2
	local v14 = v_u_4.Load(v_u_3.Scope, "Scope")
	v14.Enabled = false
	v14.Parent = v_u_2
	local v15 = v_u_4.Load(v_u_3.Money, "Money")
	v15.Enabled = true
	v15.Parent = v_u_2
	local v16 = v_u_4.Load(v_u_3.PlayerList, "PlayerList")
	v16.Enabled = true
	v16.Parent = v_u_2
	local v17 = v_u_4.Load(v_u_3.FakePhone, "FakePhone")
	v17.Enabled = true
	v17.Parent = v_u_2
	local v18 = v_u_4.Load(v_u_3.ContextButtons, "ContextButtons")
	v18.Enabled = true
	v18.Parent = v_u_2
	local v19 = v_u_4.Load(v_u_3.PromptPurchase, "PromptPurchase")
	v19.Enabled = true
	v19.Parent = v_u_2
	local v20 = v_u_4.Load(v_u_3.Toast, "Toast")
	v20.Enabled = true
	v20.Parent = v_u_2
	local v21 = v_u_4.Load(v_u_3.KillMessage, "KillMessage")
	v21.Enabled = true
	v21.Parent = v_u_2
	local v22 = v_u_4.Load(v_u_3.Help, "Help")
	v22.Enabled = true
	v22.Parent = v_u_2
	local v23 = v_u_4.Load(v_u_3.UpdateLog, "UpdateLog")
	v23.Enabled = true
	v23.Parent = v_u_2
	local v24 = v_u_4.Load(v_u_3.PlaytimeRewards, "PlaytimeRewards")
	v24.Enabled = false
	v24.Parent = v_u_2
	local v25 = v_u_4.Load(v_u_3.Report, "Report")
	v25.Enabled = true
	v25.Parent = v_u_2
	local v26 = v_u_4.Load(v_u_3.Map, "Map")
	v26.Enabled = true
	v26.Parent = v_u_2
	local v27 = v_u_4.Load(v_u_3.Emotes, "Emotes")
	v27.Enabled = true
	v27.Parent = v_u_2
	local v28 = v_u_4.Load(v_u_3.CaseMenu, "CaseMenu")
	v28.Enabled = false
	v28.Parent = v_u_2
	local v29 = v_u_4.Load(v_u_3.TradeMenu, "TradeMenu")
	v29.Enabled = false
	v29.Parent = v_u_2
	local v30 = v_u_4.Load(v_u_3.Trophy, "Trophy")
	v30.Enabled = false
	v30.Parent = v_u_2
	local v31 = v_u_4.Load(v_u_3.ClanMenu, "ClanMenu")
	v31.Enabled = false
	v31.Parent = v_u_2
	local v32 = v_u_4.Load(v_u_3.Sewer, "Sewer")
	v32.Enabled = true
	v32.Parent = v_u_2
	local v33 = v_u_4.Load(v_u_3.Billboards, "Billboards")
	v33.Enabled = true
	v33.Parent = v_u_2
	local v34 = v_u_4.Load(v_u_3.CraftingBenchMenu, "CraftingBenchMenu")
	v34.Enabled = false
	v34.Parent = v_u_2
	local v35 = v_u_4.Load(v_u_3.TreasureMap, "TreasureMap")
	v35.Enabled = true
	v35.Parent = v_u_2
	local v36 = v_u_4.Load(v_u_3.EasterMenu, "EasterMenu")
	v36.Enabled = true
	v36.Parent = v_u_2
end
return v_u_4