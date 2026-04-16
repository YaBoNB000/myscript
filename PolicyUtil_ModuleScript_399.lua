-- PolicyUtil (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v_u_1 = {}
local v_u_2 = game:GetService("SocialService")
local v_u_3 = game:GetService("PolicyService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = nil
local v_u_7 = {}
function v_u_1.CanSendGameInvite(p_u_8, p_u_9)
	-- upvalues: (copy) v_u_4, (ref) v_u_6, (copy) v_u_2
	local v10 = v_u_4
	assert(v10:IsClient())
	if v_u_6 == nil then
		local v11, v12 = pcall(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_8, (copy) p_u_9
			return v_u_2:CanSendGameInviteAsync(p_u_8, p_u_9)
		end)
		if v11 then
			v_u_6 = v12
			return v12
		else
			warn("[PolicyUtil] SocialService error:", v12)
			return v12
		end
	else
		return v_u_6
	end
end
function v_u_1.GetPolicyInfo(p_u_13)
	-- upvalues: (copy) v_u_7, (copy) v_u_3
	if v_u_7[p_u_13] ~= nil then
		return v_u_7[p_u_13]
	end
	local v14, v15 = pcall(function()
		-- upvalues: (ref) v_u_3, (copy) p_u_13
		return v_u_3:GetPolicyInfoForPlayerAsync(p_u_13)
	end)
	if v14 then
		v_u_7[p_u_13] = v15
	else
		warn("[PolicyUtil] PolicyService error:", v15)
	end
	return v_u_7[p_u_13]
end
if v_u_4:IsClient() then
	local v_u_16 = v5.LocalPlayer
	task.spawn(function()
		-- upvalues: (copy) v_u_1, (copy) v_u_16, (copy) v_u_7
		repeat
			v_u_1.GetPolicyInfo(v_u_16)
			task.wait(1)
		until v_u_7[v_u_16] ~= nil
	end)
else
	v5.PlayerRemoving:Connect(function(p17)
		-- upvalues: (copy) v_u_7
		v_u_7[p17] = nil
	end)
end
return v_u_1