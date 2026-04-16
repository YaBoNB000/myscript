-- CmdrHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v_u_1.devv).load("specialRoles")
return {
	["Initialize"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
		task.defer(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_3, (ref) v_u_2
			local v4 = require(v_u_1:WaitForChild("CmdrClient"))
			v4:SetActivationKeys({ Enum.KeyCode.F2 })
			v4:SetEnabled(v_u_3.isHero(v_u_2.UserId))
		end)
	end
}