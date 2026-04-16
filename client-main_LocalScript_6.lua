-- client-main (LocalScript)
-- StarterPlayer > StarterPlayerScripts
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = require(v1.devv)
local v4 = v3.addToModules
local v5 = v3.load
local v6 = v3.start
v4(v1.devv.shared.Helpers)
v4(v1.devv.shared.Indicies)
v4(v1.devv.shared.Objects)
v4(v1.devv.client.Helpers)
v4(v1.devv.client.Indicies)
v4(v1.devv.client.Objects)
v4(v1.devv.vendor.CameraShaker)
v4(v1.devv.vendor.Promise)
v4(v1.devv.vendor.GameAnalytics)
v4(v1.devv.shared.Handlers)
v4(v1.devv.client.Handlers)
v3.Initialize()
print("starting client")
for _, v7 in pairs(v5("default-modules").client) do
	v6(v7)
end
print("client start successful")
if not v2:IsStudio() then
	task.delay(5, function()
		print("-")
		print(string.format("welcome to ohio! version: %s", game.PlaceVersion))
	end)
end