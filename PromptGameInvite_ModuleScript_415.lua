-- PromptGameInvite (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("SocialService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v1.devv).load("Promise")
return function(p_u_6)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
	if not v_u_3:IsClient() then
		warn("[PromptGameInvite] Must be called on the client")
		return false
	end
	local v_u_7 = Instance.new("ExperienceInviteOptions")
	v_u_7.InviteUser = p_u_6
	v_u_5.try(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_4, (copy) p_u_6
		return v_u_2:CanSendGameInviteAsync(v_u_4, p_u_6)
	end):andThen(function(p8)
		-- upvalues: (ref) v_u_2, (ref) v_u_4, (copy) v_u_7
		if p8 then
			pcall(function()
				-- upvalues: (ref) v_u_2, (ref) v_u_4, (ref) v_u_7
				v_u_2:PromptGameInvite(v_u_4, v_u_7)
			end)
		end
	end):catch(warn)
end