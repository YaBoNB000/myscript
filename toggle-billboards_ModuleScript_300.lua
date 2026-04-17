-- toggle-billboards (ModuleScript)
-- ReplicatedStorage > CmdrClient > Commands
-- Original

local v_u_1 = game:GetService("CollectionService")
return {
	["Name"] = "toggle-billboards",
	["Aliases"] = {},
	["Description"] = "Toggle billboards mode",
	["Group"] = "Admin",
	["Args"] = {},
	["ClientRun"] = function(_)
		-- upvalues: (copy) v_u_1
		for _, v_u_2 in v_u_1:GetTagged("billboard") do
			v_u_2.Enabled = false
			v_u_2:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (copy) v_u_2
				v_u_2.Enabled = false
			end)
		end
		v_u_1:GetInstanceAddedSignal("billboard"):Connect(function(p_u_3)
			p_u_3.Enabled = false
			p_u_3:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (copy) p_u_3
				p_u_3.Enabled = false
			end)
		end)
		return "Toggled"
	end
}