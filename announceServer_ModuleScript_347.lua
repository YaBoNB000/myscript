-- announceServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Admin
-- Original

local v_u_1 = game:GetService("TextService")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("Chat")
return function(p4, p5)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3
	local v6 = v_u_1:FilterStringAsync(p5, p4.Executor.UserId, Enum.TextFilterContext.PublicChat)
	for _, v7 in ipairs(v_u_2:GetPlayers()) do
		if v_u_3:CanUsersChatAsync(p4.Executor.UserId, v7.UserId) then
			p4:SendEvent(v7, "Message", v6:GetChatForUserAsync(v7.UserId), p4.Executor)
		end
	end
	return "Created announcement."
end