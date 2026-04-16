-- GetProductInfo (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > marketplace
-- Original

local v_u_1 = game:GetService("MarketplaceService")
local v_u_2 = {}
local function v7(p_u_3, p_u_4)
	-- upvalues: (ref) v_u_2, (copy) v_u_1
	assert(p_u_3, "No productId")
	assert(p_u_4, "No productType")
	if v_u_2[p_u_3] then
		return v_u_2[p_u_3]
	end
	local v5, v6 = pcall(function()
		-- upvalues: (ref) v_u_1, (copy) p_u_3, (copy) p_u_4
		return v_u_1:GetProductInfo(p_u_3, p_u_4)
	end)
	if v5 then
		v_u_2[p_u_3] = v6
	else
		warn(string.format("[GetProductInfo] Failed to fetch productInfo for %s", p_u_3))
	end
	return v_u_2[p_u_3]
end
task.spawn(function()
	-- upvalues: (ref) v_u_2
	while true do
		task.wait(300)
		v_u_2 = {}
	end
end)
return v7