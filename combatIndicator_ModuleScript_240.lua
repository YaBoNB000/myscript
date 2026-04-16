-- combatIndicator (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.Guis.ScreenGuis
local v3 = require(v1.devv).load
local v_u_4 = v3("ClientReplicator")
local v_u_5 = v3("GUILoader")
local v_u_6 = v3("Signal")
local v_u_7 = game:GetService("Players").LocalPlayer
local v_u_8 = v_u_7:WaitForChild("PlayerGui")
local v_u_9 = game:GetService("RunService")
local v_u_10 = {}
local v_u_11 = 0
function v_u_10.enterCombat(p12)
	-- upvalues: (ref) v_u_11
	v_u_11 = os.clock()
	if p12 == "exit" then
		v_u_11 = -1
	end
end
function v_u_10.isInCombat()
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (ref) v_u_11
	return (v_u_4.Get(v_u_7, "carried") or (v_u_4.Get(v_u_7, "knocked") or v_u_4.Get(v_u_7, "cuffed"))) and true or (os.clock() - v_u_11 < 20 and true or false)
end
function v_u_10._step()
	-- upvalues: (copy) v_u_5, (copy) v_u_10
	v_u_5.Get("CombatIndicator").Enabled = v_u_10.isInCombat()
end
function v_u_10.Initialize()
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6
	local v13 = v_u_5.Load(v_u_2.CombatIndicator, "CombatIndicator")
	v13.Enabled = false
	v13.Parent = v_u_8
	v_u_9.Heartbeat:Connect(v_u_10._step)
	v_u_6.LinkSignal("enterCombat", v_u_10.enterCombat)
end
return v_u_10