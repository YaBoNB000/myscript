-- GameScalingUtils (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = game:GetService("GuiService")
return {
	["getUIScale"] = function(p2)
		-- upvalues: (copy) v_u_1
		local v3 = typeof(p2) == "Vector2"
		assert(v3)
		local v4 = p2.x
		local v5 = p2.y
		local v6 = math.min(v4, v5)
		local v7 = p2.y
		return v_u_1:IsTenFootInterface() and 1 or (v6 >= 900 and 1 or (v6 >= 700 and 0.8 or (v7 >= 500 and 0.65 or (v7 >= 325 and 0.4 or 1))))
	end,
	["getDialogPadding"] = function(p8)
		local v9 = typeof(p8) == "Vector2"
		assert(v9)
		local v10 = p8.x
		local v11 = p8.y
		local v12 = math.min(v10, v11)
		return v12 <= 300 and 5 or (v12 <= 500 and 10 or (v12 <= 700 and 25 or 50))
	end
}