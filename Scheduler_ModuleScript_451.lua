-- Scheduler (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > thread
-- Original

local v1 = {}
local v2 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_3 = v2("isDebug")
local v4 = v2("object")
local v_u_5 = v2("RunServiceTracker")
local v_u_6 = v2("clean")
local v_u_7 = game:GetService("RunService")
local v_u_8 = {}
local v_u_9 = v4()
function v_u_9.cancel(p10)
	-- upvalues: (copy) v_u_8, (copy) v_u_6
	v_u_8[p10] = nil
	v_u_6(p10)
end
function v_u_9.SetTriesLeft(p11, p12)
	p11.triesLeft = p12
end
function v_u_9.ChangeDelay(p13, p14)
	p13.schedulingDelay = p14
end
function v_u_9.GetArgs(p15)
	return p15.args
end
function v1.IsTask(p16)
	return type(p16) == "table" and p16.IsTask and true or false
end
function v1.Schedule(p17, p18, p19, p20)
	-- upvalues: (copy) v_u_9, (copy) v_u_8
	local v21
	if p17 then
		if type(p17) == "function" and (type(p18) == "number" or type(p18) == "nil") and (type(p19) == "number" or type(p19) == "nil") then
			v21 = type(p20) == "table" and true or type(p20) == "nil"
		else
			v21 = false
		end
	else
		v21 = p17
	end
	assert(v21)
	local v22 = v_u_9:new()
	v22.IsTask = true
	v22.func = p17
	v22.timeScheduled = os.clock()
	v22.schedulingDelay = p18 or 0
	v22.triesLeft = p19 or 0
	v22.args = p20
	v_u_8[v22] = true
	return v22
end
function v1.Initialize()
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3
	local v_u_23 = os.clock()
	v_u_7.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_3, (ref) v_u_23, (ref) v_u_7
		v_u_5("heartbeat")
		local v24 = 0
		for v25 in pairs(v_u_8) do
			v24 = v24 + 1
			if os.clock() - v25.timeScheduled >= v25.schedulingDelay then
				if v25.triesLeft == 0 then
					v_u_8[v25] = nil
				else
					if v25.triesLeft > 0 then
						v25.triesLeft = v25.triesLeft - 1
					end
					v25.timeScheduled = os.clock()
				end
				if v25.func then
					local v26 = v25.args or nil
					coroutine.wrap(v25.func)(v26)
				end
			end
		end
		if v_u_3("Scheduler") and os.clock() - v_u_23 >= 1 then
			v_u_23 = os.clock()
			if v_u_7:IsClient() then
				print("# client tasks scheduled: " .. v24)
				return
			end
			print("# server tasks scheduled: " .. v24)
		end
	end)
end
return v1