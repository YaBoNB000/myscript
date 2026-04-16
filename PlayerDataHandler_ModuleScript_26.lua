-- PlayerDataHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("state")
v1("printTable")
local v_u_3 = v1("Signal")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v6 = script.updateFuncs
local v_u_7 = {}
for _, v8 in pairs(v6:GetChildren()) do
	v_u_7[v8.Name] = require(v8)
end
local v_u_9 = {
	["dataReceived"] = false
}
v_u_2.data = {}
local function v_u_14(p10)
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_2, (copy) v_u_7, (copy) v_u_5
	v_u_9.dataReceived = true
	if not v_u_4:IsStudio() then
		print("fetching data...")
	end
	v_u_2.data = p10
	for v11, v12 in pairs(p10) do
		local v13 = v_u_7[v11]
		if v13 then
			v13("init", nil, v12)
		end
	end
	if not v_u_4:IsStudio() then
		print("got data")
	end
	v_u_5:SetAttribute("dataLoaded", true)
end
local function v_u_21(p15, p16)
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	for v17, v18 in pairs(p16) do
		local v19 = v_u_2.data[v17]
		local v20 = v_u_7[v17]
		if v20 then
			v20(p15, v19, v18)
		end
		v_u_2.data[v17] = v18
	end
end
function v_u_9.Initialize()
	-- upvalues: (copy) v_u_3, (copy) v_u_21, (copy) v_u_14
	v_u_3.LinkSignal("updateData", v_u_21)
	v_u_3.LinkSignal("requestData", v_u_14)
end
return v_u_9