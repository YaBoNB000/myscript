-- baseMod (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > v3itemmods
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load("object")()
v1.name = "defaultModName"
v1.modType = "defaultModType"
function v1.applyToItem(_, _) end
function v1.applyToDisplayModel(_, _) end
return v1