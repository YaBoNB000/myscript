-- LocalPhoneHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Chat")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v2.devv).load
local v_u_6 = v_u_5("Signal")
local v_u_7 = v_u_5("v3sound")
local v_u_8 = {
	["Blue"] = Enum.ChatColor.Blue,
	["Green"] = Enum.ChatColor.Green,
	["Red"] = Enum.ChatColor.Red,
	["White"] = Enum.ChatColor.White
}
local v_u_9 = Instance.new("Sound")
v_u_9.Name = "PhoneRinging"
v_u_9.SoundId = "rbxassetid://11800983085"
v_u_9.Volume = 0.5
v_u_9.Looped = true
v_u_9.Parent = v_u_4:WaitForChild("PlayerGui")
local v_u_10 = Instance.new("Sound")
v_u_10.Name = "PhoneCalling"
v_u_10.SoundId = "rbxassetid://11801189692"
v_u_10.Volume = 0.5
v_u_10.Looped = true
v_u_10.Parent = v_u_4:WaitForChild("PlayerGui")
function v_u_1.MakeChatBubble(p11, p12)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_8
	local v13 = v_u_5("v3item").inventory.getEquipped()
	if v13 and v13.name == "rPhone" then
		local v14 = v13.model
		if v14 and v14.PrimaryPart then
			v_u_3:Chat(v14.PrimaryPart, p11, v_u_8[p12])
		end
	end
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_4, (copy) v_u_10, (copy) v_u_7, (copy) v_u_1, (copy) v_u_5
	local v_u_15 = 0
	v_u_6.LinkSignal("sendIncomingCall", function(p16, p17)
		-- upvalues: (ref) v_u_9, (ref) v_u_15, (ref) v_u_4
		v_u_9:Play()
		v_u_15 = v_u_15 + 1
		task.spawn(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_4
			local v18 = v_u_15
			task.wait(15)
			if v_u_15 == v18 then
				v_u_9:Stop()
				v_u_4:SetAttribute("CallId", nil)
				v_u_4:SetAttribute("CallFrom", nil)
				v_u_4:SetAttribute("HostingCall", false)
			end
		end)
		v_u_4:SetAttribute("CallFrom", p17)
		v_u_4:SetAttribute("CallId", p16)
	end)
	v_u_6.LinkSignal("hangupPhone", function(p19)
		-- upvalues: (ref) v_u_4, (ref) v_u_9, (ref) v_u_10, (ref) v_u_7
		v_u_4:SetAttribute("CallId", nil)
		v_u_4:SetAttribute("CallFrom", nil)
		v_u_4:SetAttribute("HostingCall", false)
		v_u_9:Stop()
		v_u_10:Stop()
		if not p19 then
			local v20 = v_u_7.newSound("callHungUp")
			v20.isUI = true
			v20:play()
		end
	end)
	v_u_6.LinkSignal("recievePhoneMessage", function(p21, p22)
		-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) v_u_1
		v_u_15 = v_u_15 + 1
		v_u_9:Stop()
		v_u_10:Stop()
		v_u_1.MakeChatBubble(p21, p22 or "White")
	end)
	local v23 = workspace:WaitForChild("Game"):WaitForChild("Entities")
	local v_u_24 = v_u_5("GUID")
	local function v32(p25)
		-- upvalues: (copy) v_u_24
		local v_u_26 = {}
		local function v29(p27)
			-- upvalues: (copy) v_u_26, (ref) v_u_24
			task.wait()
			v_u_26[p27] = true
			if p27 and p27.Parent then
				p27.Name = v_u_24()
				for _, v28 in ipairs(p27:GetDescendants()) do
					v28.Name = v_u_24()
				end
			end
		end
		p25.ChildAdded:Connect(v29)
		p25.ChildRemoved:Connect(function(p30)
			-- upvalues: (copy) v_u_26
			v_u_26[p30] = nil
		end)
		for _, v31 in ipairs(p25:GetChildren()) do
			v29(v31)
		end
	end
	v32(v23:WaitForChild("CashBundle"))
	v32(v23:WaitForChild("ItemPickup"))
end
return v_u_1