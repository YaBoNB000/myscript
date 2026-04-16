-- animLoader (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("v3anims")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = Instance.new("Folder")
v3.Name = "Anims"
v3.Parent = v_u_2
local v_u_4 = {}
return {
	["Get"] = function(p5)
		-- upvalues: (copy) v_u_1, (copy) v_u_4
		local v6 = v_u_1[p5]
		return v_u_4[p5], v6
	end,
	["Initialize"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4
		for v7, v8 in pairs(v_u_1) do
			local v9 = Instance.new("Animation")
			v9.Name = v7
			v9.AnimationId = "rbxassetid://" .. v8.id
			v9.Parent = v_u_2.Anims
			v_u_4[v7] = v9
		end
	end
}