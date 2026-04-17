-- v3sfx (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = script.bin
local v2 = {}
for _, v3 in pairs(v1:GetDescendants()) do
	if v3:IsA("ModuleScript") then
		local v4 = require(v3)
		for v5, v6 in pairs(v4) do
			local v7 = v2[v5] == nil
			local v8 = "collision at index " .. v5
			assert(v7, v8)
			v2[v5] = v6
		end
	end
end
return v2