-- odds (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = {}
for _, v2 in script:GetChildren() do
	v1[v2.Name] = require(v2)
end
return v1