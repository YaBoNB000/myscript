-- NewPlayerHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v_u_2 = game:GetService("VoiceChatService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players")
local v_u_6 = v_u_5.LocalPlayer
local v7 = require(v3.devv).load
local v_u_8 = v7("specialRoles")
local v9 = v7("globals")
local v_u_10 = v7("Signal")
local v_u_11 = v9.MAIN_PLACE_ID
local v_u_12 = false
local function v_u_14()
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	for _, v13 in v_u_5:GetPlayers() do
		if v13 ~= v_u_6 and v_u_6:IsFriendsWith(v13.UserId) then
			return true
		end
	end
	return false
end
function v1.Initialize()
	-- upvalues: (ref) v_u_12, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_4, (copy) v_u_11, (copy) v_u_14, (copy) v_u_2
	local function v_u_15()
		-- upvalues: (ref) v_u_12, (ref) v_u_6, (ref) v_u_8, (ref) v_u_10
		if not v_u_12 then
			v_u_12 = true
			task.delay(5, function()
				-- upvalues: (ref) v_u_12
				v_u_12 = false
			end)
			if v_u_6:GetAttribute("RemoteConfig_NPSAB") == 1 or (v_u_6:GetAttribute("RemoteConfig_NPSAB") == "1" or v_u_8.isDeveloper(v_u_6.UserId)) then
				v_u_10.FireServer("teleportNPS")
			end
		end
	end
	task.defer(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_11, (ref) v_u_14, (ref) v_u_2, (copy) v_u_15
		repeat
			task.wait()
		until v_u_6:GetAttribute("RemoteConfigsApplied") == true and v_u_6:GetAttribute("day") ~= nil
		if v_u_4:IsStudio() then
			return
		elseif game.PlaceId == v_u_11 then
			if v_u_6.FollowUserId > 0 then
				return
			elseif v_u_14() then
				return
			else
				local v16, v17 = pcall(function()
					-- upvalues: (ref) v_u_2, (ref) v_u_6
					return v_u_2:IsVoiceEnabledForUserIdAsync(v_u_6.UserId)
				end)
				if v16 and v17 then
					return
				elseif v_u_6:GetAttribute("day") <= 1 then
					v_u_15()
				end
			end
		else
			return
		end
	end)
	v_u_6.Chatted:Connect(function(p18)
		-- upvalues: (copy) v_u_15
		if p18 and p18 ~= "" then
			if p18 == "/newbie" then
				v_u_15()
			end
		end
	end)
end
return v1