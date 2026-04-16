-- GetOwnsGamePass (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > marketplace
-- Original

local v_u_1 = game:GetService("MarketplaceService")
return function(p_u_2, p_u_3)
	-- upvalues: (copy) v_u_1
	assert(p_u_2, "No player")
	assert(p_u_3, "No passId")
	local v4, v5 = pcall(function()
		-- upvalues: (ref) v_u_1, (copy) p_u_2, (copy) p_u_3
		return v_u_1:UserOwnsGamePassAsync(p_u_2.UserId, p_u_3)
	end)
	if v4 then
		return v5
	else
		return nil
	end
end