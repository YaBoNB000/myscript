-- Signal (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > remotes
-- Original

local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = v1.devv:WaitForChild("remoteStorage")
local v_u_3 = require(v1.devv).load("GUID")
local v4 = {}
local v_u_5 = {}
function v4.LinkSignal(p6, p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v8
	if p6 then
		if p7 then
			if type(p6) == "string" then
				v8 = type(p7) == "function"
			else
				v8 = false
			end
		else
			v8 = p7
		end
	else
		v8 = p6
	end
	assert(v8)
	if not v_u_5[p6] then
		v_u_5[p6] = v_u_2:FindFirstChild(p6)
	end
	local v9 = v_u_5[p6]
	v9.Name = v_u_3()
	if v9 then
		return v9.OnClientEvent:Connect(p7)
	end
	warn("Remote " .. p6 .. " not found on client!")
end
function v4.FireServer(p10, ...)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v11
	if p10 then
		v11 = type(p10) == "string"
	else
		v11 = p10
	end
	assert(v11)
	if not v_u_5[p10] then
		v_u_5[p10] = v_u_2:FindFirstChild(p10)
	end
	local v12 = v_u_5[p10]
	v12.Name = v_u_3()
	if v12 and v12:IsA("RemoteEvent") or v12:IsA("UnreliableRemoteEvent") then
		v12:FireServer(...)
	else
		warn("RemoteEvent " .. p10 .. " not found on client!")
	end
end
function v4.InvokeServer(p13, ...)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v14
	if p13 then
		v14 = type(p13) == "string"
	else
		v14 = p13
	end
	assert(v14)
	if not v_u_5[p13] then
		v_u_5[p13] = v_u_2:FindFirstChild(p13)
	end
	local v15 = v_u_5[p13]
	v15.Name = v_u_3()
	if v15 and v15:IsA("RemoteFunction") then
		return v15:InvokeServer(...)
	end
	warn("RemoteFunction " .. p13 .. " not found on client!")
end
return v4