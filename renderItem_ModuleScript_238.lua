-- renderItem (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = game:GetService("Players").LocalPlayer
return function(p3, p4, p5, p6, p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v8 = v_u_1("v3item").NewItem(nil, p3, p5)
	v8.attachments = {}
	if p4 then
		for v9, v10 in pairs(p4) do
			v8.attachments[v9] = v10
		end
	end
	local v11 = v8:createModel(false, v_u_2, p7)
	if v11 then
		local v12 = v11:Clone()
		local v13 = v8.skin
		if v13 then
			v13:Apply(v12)
			if p6 then
				v8.skin = nil
			end
		end
		v8.model = nil
		v8:clean()
		return v12, v13
	end
end