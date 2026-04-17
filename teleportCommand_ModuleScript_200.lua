-- teleportCommand (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local v2 = {}
local v_u_3 = game:GetService("Players").LocalPlayer
local function v_u_6(p4)
	-- upvalues: (copy) v_u_3
	if v_u_3 and (v_u_3.Character and v_u_3.Character.PrimaryPart) then
		if p4 then
			v_u_3.Character:PivotTo(p4)
			return
		end
		local v5 = v_u_3:GetMouse()
		v_u_3.Character:PivotTo(CFrame.new(v5.Hit.p + Vector3.new(0, 10, 0)))
	end
end
function v2.Initialize()
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	v_u_1.LinkSignal("teleport", v_u_6)
end
return v2