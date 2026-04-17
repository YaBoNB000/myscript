-- v3vehiclemods (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = script.bin
local v2 = {}
local v3 = {}
for _, v4 in pairs(v1:GetChildren()) do
	v2[v4.Name] = require(v4)
end
v3.categories = v2
return v3