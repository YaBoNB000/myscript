-- RetrieveModel (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

return game:GetService("RunService"):IsServer() and require(script.RetrieveModelServer) or require(script.RetrieveModelClient)