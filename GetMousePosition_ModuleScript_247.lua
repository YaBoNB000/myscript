-- GetMousePosition (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("RunService")
local v_u_2 = game:GetService("Players")
v1:IsStudio()
return function()
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2.LocalPlayer:GetMouse()
	return v3.X, v3.Y
end