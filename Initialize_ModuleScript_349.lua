-- Initialize (ModuleScript)
-- ReplicatedStorage > Cmdr
-- Original

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("StarterGui")
local v_u_3 = require(script.Parent.CreateGui)
return function(p4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3
	local v5 = nil
	v5 = script.Parent.CmdrClient
	v5.Parent = v_u_1
	local v6 = Instance.new("RemoteFunction")
	v6.Name = "CmdrFunction"
	v6.Parent = v5
	local v7 = Instance.new("RemoteEvent")
	v7.Name = "CmdrEvent"
	v7.Parent = v5
	local v8 = Instance.new("Folder")
	v8.Name = "Commands"
	v8.Parent = v5
	local v9 = Instance.new("Folder")
	v9.Name = "Types"
	v9.Parent = v5
	script.Parent.Shared.Parent = v5
	p4.ReplicatedRoot = v5
	p4.RemoteFunction = v6
	p4.RemoteEvent = v7
	p4:RegisterTypesIn(script.Parent.BuiltInTypes)
	script.Parent.BuiltInTypes:Destroy()
	script.Parent.BuiltInCommands.Name = "Server commands"
	if v_u_2:FindFirstChild("Cmdr") == nil then
		v_u_3()
	end
end