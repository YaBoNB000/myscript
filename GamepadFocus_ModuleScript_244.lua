-- GamepadFocus (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(v1.devv).load("dialogQueue")
v_u_2.InputBegan:Connect(function(p5, p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if not p6 then
		if p5.KeyCode == Enum.KeyCode.ButtonB and v_u_4:Num() > 0 then
			v_u_4:Clear()
			v_u_3.SelectedObject = nil
		end
	end
end)
return function(p7)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if v_u_2.GamepadEnabled then
		if p7 == nil then
			v_u_3.SelectedObject = nil
		elseif p7 and (p7.Parent and p7:IsA("GuiObject")) then
			v_u_3.SelectedObject = p7
		end
	else
		return
	end
end