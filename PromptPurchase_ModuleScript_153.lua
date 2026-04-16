-- PromptPurchase (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = {
	["IsPrompted"] = false
}
local v_u_2 = game:GetService("MarketplaceService")
local v3 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local _ = game:GetService("Players").LocalPlayer
local v_u_4 = require(v3.devv).load
local v_u_5 = v_u_4("GUILoader")
local v_u_6 = v_u_4("Signal")
local v_u_7 = nil
local function v_u_8()
	-- upvalues: (copy) v_u_1
	v_u_1.IsPrompted = false
end
function v_u_1.Prompt(p_u_9, p_u_10)
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	assert(p_u_9, "No productId")
	assert(p_u_10, "No productType")
	if v_u_4("GiftMenu").open then
		return false
	end
	pcall(function()
		-- upvalues: (ref) v_u_6, (copy) p_u_9, (copy) p_u_10
		v_u_6.FireServer("promptProductPurchase", p_u_9, p_u_10)
	end)
	return true
end
function v_u_1.Initialize()
	-- upvalues: (ref) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_8
	v_u_7 = v_u_5.Get("PromptPurchase")
	v_u_2.PromptGamePassPurchaseFinished:Connect(v_u_8)
	v_u_2.PromptPurchaseFinished:Connect(v_u_8)
	v_u_2.PromptPremiumPurchaseFinished:Connect(v_u_8)
	v_u_2.PromptProductPurchaseFinished:Connect(v_u_8)
end
return v_u_1