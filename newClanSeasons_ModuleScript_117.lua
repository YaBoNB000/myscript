-- newClanSeasons (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = {}
for _, v2 in script:GetChildren() do
	if v2:IsA("ModuleScript") then
		local v3 = string.match
		local v4 = v2.Name
		v1[tonumber(v3(v4, "%d+"))] = require(v2)
	end
end
return v1