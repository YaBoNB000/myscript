-- VoiceChatHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("VoiceChatService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v_u_6 = require(v2.devv).load
v_u_6("Maid")
v_u_6("Promise")
local v_u_7 = v_u_6("Signal")
local v_u_8 = v_u_6("makeToast")
local v_u_9 = v_u_6("dialogQueue")
local v_u_10 = v_u_6("makeDialog")
local v_u_11 = v_u_6("DOF")
local v_u_12 = v_u_6("UpdateLog")
local v_u_13 = v2.Guis.Dialog.TwoButtonDialog
local v_u_14 = false
function v1.Initialize()
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_12, (ref) v_u_14, (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_11, (copy) v_u_13, (copy) v_u_10, (copy) v_u_9, (copy) v_u_6
	task.defer(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_12
		repeat
			v_u_4.Heartbeat:Wait()
		until v_u_5:GetAttribute("isLoaded")
		if game.PlaceId == 11958318242 then
			v_u_12.Show()
		end
	end)
	local function v_u_17()
		-- upvalues: (ref) v_u_14, (ref) v_u_3, (ref) v_u_5, (ref) v_u_7, (ref) v_u_8
		if v_u_14 then
			return
		else
			v_u_14 = true
			task.delay(5, function()
				-- upvalues: (ref) v_u_14
				v_u_14 = false
			end)
			local v15, v16 = pcall(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_5
				return v_u_3:IsVoiceEnabledForUserIdAsync(v_u_5.UserId)
			end)
			if v15 and v16 then
				v_u_7.FireServer("teleportVC")
			else
				v_u_8("You do not have voice chat enabled!", "red", 3)
			end
		end
	end
	task.delay(10, function()
		-- upvalues: (ref) v_u_4, (ref) v_u_12, (ref) v_u_3, (ref) v_u_5, (ref) v_u_11, (ref) v_u_13, (ref) v_u_10, (copy) v_u_17, (ref) v_u_9
		if v_u_4:IsStudio() then
			v_u_12.Show()
			return
		elseif game.PlaceId == 11958318242 then
			return
		else
			local v18, v19 = pcall(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_5
				return v_u_3:IsVoiceEnabledForUserIdAsync(v_u_5.UserId)
			end)
			if v18 and v19 then
				v_u_11(true)
				local v20 = v_u_13:Clone()
				v20.Frame.UpperLabel.Text = ""
				v20.Frame.LowerLabel.Text = ""
				v20.Frame.MiddleLabel.Text = "Do you want to join a VC only server?"
				v20.Frame.MiddleLabel.TextSize = 32
				v20.Frame.MiddleLabel.TextScaled = false
				v20.Frame.MiddleLabel.LineHeight = 1.2
				v20.Frame.MiddleLabel:ClearAllChildren()
				v20.Frame.Button1.Text = "Yes"
				v20.Frame.Button2.Text = "No"
				v_u_9:Add((v_u_10({
					["super"] = "TwoButtonDialog",
					["UIObject"] = v20,
					["button1func"] = function()
						-- upvalues: (ref) v_u_17, (ref) v_u_9
						v_u_17()
						v_u_9:Next()
					end,
					["button2func"] = function()
						-- upvalues: (ref) v_u_12, (ref) v_u_9
						v_u_12.Show()
						v_u_9:Next()
					end,
					["closeFunc"] = function()
						-- upvalues: (ref) v_u_11, (ref) v_u_12
						v_u_11(false)
						v_u_12.Show()
					end
				})))
			else
				v_u_12.Show()
			end
		end
	end)
	v_u_5.Chatted:Connect(function(p21)
		-- upvalues: (copy) v_u_17, (ref) v_u_6, (ref) v_u_7
		if p21 and p21 ~= "" then
			if p21 == "/vc" or p21 == "/voicechat" then
				v_u_17()
				return
			elseif p21 == "/stats" or p21 == "/e stats" then
				v_u_6("status").ShowStrength()
			elseif p21 == "/test" then
				v_u_7.FireServer("teleportTest")
			end
		else
			return
		end
	end)
end
return v1