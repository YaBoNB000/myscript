-- messages (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v_u_1("Signal")
local v_u_3 = v_u_1("tod")
local v_u_4 = v_u_1("shallowCopy")
local v_u_5 = {}
local v_u_6 = game:GetService("Players")
local v_u_7 = v_u_6.LocalPlayer
local v_u_8 = os.clock()
local v_u_9 = {}
v_u_5.allMessages = v_u_9
function v_u_5.Add(p10, p11, p12)
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_1
	if p11 == v_u_7.UserId or not p11 then
		p11 = p10
	end
	if not v_u_9[p11] then
		v_u_9[p11] = {}
	end
	local v13 = {
		["actual"] = os.clock(),
		["minuteOfDay"] = v_u_3.SERVER_MINUTE(),
		["day_of_week"] = v_u_3.DOTW(),
		["day"] = v_u_3.CURRENT_DAY(),
		["week"] = v_u_3.CURRENT_WEEK()
	}
	local v14 = v_u_9[p11]
	table.insert(v14, 1, {
		["senderUserId"] = p10,
		["message"] = p12,
		["timestamp"] = v13,
		["opened"] = false
	})
	if #v_u_9[p11] > 30 then
		table.remove(v_u_9[p11])
	end
	if v_u_5.phone then
		for _, v15 in pairs(v_u_5.phone.screens) do
			if v15.RerenderTexts then
				v15:RerenderTexts()
			end
		end
	end
	if p10 ~= v_u_7.UserId then
		local v16 = {
			["id"] = p10,
			["msg"] = p12,
			["timestamp"] = v_u_4(v13)
		}
		v_u_1("notifications").Add(v16)
	end
end
function v_u_5.send(p17, p18)
	-- upvalues: (ref) v_u_8, (copy) v_u_2
	if os.clock() - v_u_8 >= 0.5 then
		if string.len(p18) > 200 then
			p18 = string.sub(p18, 1, 200)
		end
		v_u_8 = os.clock()
		v_u_2.FireServer("sendMessage", p17, p18)
	end
end
function v_u_5.get()
	-- upvalues: (copy) v_u_9
	return v_u_9
end
function v_u_5.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_6
	v_u_2.LinkSignal("receiveMessage", v_u_5.Add)
	v_u_6.PlayerRemoving:Connect(function(p19)
		-- upvalues: (ref) v_u_5
		v_u_5.allMessages[p19.UserId] = nil
	end)
end
return v_u_5