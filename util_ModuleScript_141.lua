-- util (ModuleScript)
-- ReplicatedStorage > devv > client > Objects > v3prop
-- Original

local v_u_5 = {
	["recurse"] = function(p1, p2)
		-- upvalues: (copy) v_u_5
		local v3 = p1:GetChildren()
		for _, v4 in pairs(v3) do
			if v4:IsA("Model") then
				p2(v4)
				v_u_5.recurse(v4, p2)
			elseif v4:IsA("Folder") then
				v_u_5.recurse(v4, p2)
			end
		end
	end
}
return v_u_5