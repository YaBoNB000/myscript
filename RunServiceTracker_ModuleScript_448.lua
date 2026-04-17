-- RunServiceTracker (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > thread
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("isDebug")
local v_u_2 = {
	["stepped"] = 0,
	["heartbeat"] = 0,
	["renderstepped"] = 0
}
local v_u_3 = os.clock()
local v_u_4 = os.clock()
local v_u_5 = game:GetService("RunService")
v_u_5.Heartbeat:Connect(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_1, (copy) v_u_5, (copy) v_u_2, (ref) v_u_3
	if os.clock() - v_u_4 >= 30 then
		v_u_4 = os.clock()
		if v_u_1("RunServiceTracker") then
			print(v_u_5:IsClient() and "CLIENT:" or "SERVER:")
			print("Stepped: ", v_u_2.stepped)
			print("RenderStepped: ", v_u_2.renderstepped)
			print("Heartbeat: ", v_u_2.heartbeat)
		end
	end
	if os.clock() - v_u_3 >= 1 then
		v_u_3 = os.clock()
		v_u_2.stepped = 0
		v_u_2.renderstepped = 0
		v_u_2.heartbeat = 0
	end
end)
return function(p6)
	-- upvalues: (copy) v_u_2
	v_u_2[p6] = v_u_2[p6] + 1
end