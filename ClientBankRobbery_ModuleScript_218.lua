-- ClientBankRobbery (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

game:GetService("CollectionService")
local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v3 = require(v_u_1.devv).load
local v_u_4 = v3("MoneyEffect")
local v_u_5 = v3("commavalue")
local v_u_6 = v3("animLoader")
local v_u_7 = v3("Signal")
local v8 = {}
local v_u_9 = false
local v_u_10 = 0
local v_u_11 = nil
local function v_u_22()
	-- upvalues: (copy) v_u_2, (ref) v_u_11, (copy) v_u_1, (ref) v_u_9, (copy) v_u_7, (copy) v_u_5, (ref) v_u_10, (copy) v_u_4, (copy) v_u_6
	local v12 = v_u_2:GetAttribute("bankCash") or 0
	if v12 > 0 then
		if not v_u_11 then
			v_u_11 = v_u_1.Models.Other.BankCash:Clone()
			v_u_11.Parent = workspace.BankRobbery
			v_u_11.Main.Attachment.ProximityPrompt.Triggered:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_7
				if not v_u_9 then
					v_u_9 = true
					v_u_7.FireServer("stea\211\143BankCash")
					task.wait(0.5)
					v_u_9 = false
				end
			end)
		end
		v_u_11.Main.Attachment.ProximityPrompt.Enabled = v12 > 0
		v_u_11.Main.CashBillboard.MoneyLabel.Text = "$" .. v_u_5(v12)
		v_u_11.Main.CashBillboard.Enabled = v12 > 0
		v_u_11.Main.Sparkles.Enabled = v12 > 0
	end
	if v_u_11 then
		local v13 = nil
		local v14 = workspace.BankRobbery:GetAttribute("total") or 0
		if v14 ~= 0 then
			local v15 = 100 * (v12 / v14)
			for _, v16 in v_u_11.Cash:GetChildren() do
				local v17 = v16.Name
				local v18 = tonumber(v17) <= v15
				if v18 and not v13 then
					v13 = v16.Position
				end
				v16.CanCollide = v18
				v16.Texture.Transparency = v18 and 0 or 1
				v16.Transparency = v18 and 0 or 1
			end
		end
		if v12 < v_u_10 then
			local v19 = v13 or v_u_11.Cash["5"].Position
			v_u_4(v19, 5)
			local v20 = v_u_2.Character
			if v20 and v20.PrimaryPart then
				local v21 = v20:FindFirstChild("Humanoid")
				if v21 then
					v21 = v21:FindFirstChild("Animator")
				end
				v21:LoadAnimation((v_u_6.Get("reach"))):Play()
				v20.PrimaryPart:PivotTo(CFrame.new(v20.PrimaryPart.Position, v19))
			end
		end
	end
	if v12 <= 0 and v_u_11 then
		v_u_11:Destroy()
		v_u_11 = nil
	end
	v_u_10 = v12
end
function v8.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_22
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_22
		repeat
			task.wait()
		until v_u_2:GetAttribute("bankCash")
		v_u_22()
		v_u_2:GetAttributeChangedSignal("bankCash"):Connect(v_u_22)
	end)
end
return v8