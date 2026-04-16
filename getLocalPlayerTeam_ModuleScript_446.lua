-- getLocalPlayerTeam (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > teams
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("getTeamFromColor")
local v_u_2 = game:GetService("Players").LocalPlayer
return function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1(v_u_2.TeamColor)
end