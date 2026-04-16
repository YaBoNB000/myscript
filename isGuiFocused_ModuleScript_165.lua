-- isGuiFocused (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

require(game:GetService("ReplicatedStorage").devv).load("pathWithDelimiter")
local v_u_1 = game:GetService("Players").LocalPlayer.PlayerGui
local v_u_2 = {
	"Backpack",
	"BoomboxDialog",
	"DropMoneyDialog",
	"PurchaseDialog",
	"TwoButtonDialog",
	"ThreeButtonDialog",
	"ItemWarningDialog",
	"EditSignDialog",
	"HouseMenu",
	"CaseMenu",
	"dialog",
	"PlaytimeRewards",
	"CraftingBenchMenu"
}
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	for _, v3 in ipairs(v_u_2) do
		local v4 = v_u_1:FindFirstChild(v3)
		if v4 and v4.Enabled then
			return true
		end
	end
	return v_u_1.Map.Holder.Visible and true or (v_u_1.Money.Shop.Visible and true or ((v_u_1.Report.Frame.Visible or v_u_1.Report.Popup.Visible) and true or (v_u_1.PromptPurchase.Frame.BackgroundTransparency <= 0.9 and true or (v_u_1.Help.Frame.Visible and true or false))))
end