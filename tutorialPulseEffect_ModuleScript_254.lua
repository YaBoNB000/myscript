-- tutorialPulseEffect (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v_u_1 = game:GetService("TweenService")
return function(p_u_2)
	-- upvalues: (copy) v_u_1
	p_u_2.Size = UDim2.fromOffset()
	p_u_2.UIStroke.Transparency = 0
	p_u_2.UIStroke.Thickness = 6
	p_u_2.Visible = true
	local v_u_8 = task.spawn(function()
		-- upvalues: (copy) p_u_2, (ref) v_u_1
		while true do
			p_u_2.Size = UDim2.fromOffset()
			p_u_2.UIStroke.Transparency = 0
			p_u_2.UIStroke.Thickness = 6
			local v3 = v_u_1
			local v4 = p_u_2
			local v5 = TweenInfo.new(2.25, Enum.EasingStyle.Sine)
			local v6 = {
				["Size"] = UDim2.fromOffset(100, 100)
			}
			v3:Create(v4, v5, v6):Play()
			local v7 = {
				["Thickness"] = 15,
				["Transparency"] = 1
			}
			v_u_1:Create(p_u_2.UIStroke, TweenInfo.new(2.15, Enum.EasingStyle.Sine), v7):Play()
			task.wait(2.25)
		end
	end)
	return function()
		-- upvalues: (ref) v_u_8, (copy) p_u_2
		if v_u_8 then
			task.cancel(v_u_8)
			v_u_8 = nil
		end
		p_u_2.Visible = false
	end
end