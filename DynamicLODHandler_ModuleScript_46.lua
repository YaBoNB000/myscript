-- DynamicLODHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local _ = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.devv).load
v3("LODCheck")
v3("Octree")
function v1.Initialize() end
return v1