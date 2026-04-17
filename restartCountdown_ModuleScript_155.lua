-- restartCountdown (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.Guis.ScreenGuis
local v3 = require(v1.devv).load
local v_u_4 = v3("GUILoader")
local v_u_5 = v3("secondsToClock")
local v_u_6 = game:GetService("Players").LocalPlayer.PlayerGui
local v_u_12 = {
	["_doRestartLoop"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_5
		local v7 = v_u_4.Get("RestartCountdown")
		while true do
			local v8 = workspace:GetAttribute("CountdownTime")
			if v8 and v8 >= 0 then
				local v9 = "Restarting Servers in " .. v_u_5(v8) .. "\nPlease exit combat/stop spawning items or progress may be lost!"
				local v10 = v8 == 0 and "Restarting Servers Now!\nPlease exit combat/stop spawning items or progress may be lost!" or v9
				v7.Frame.Label.Text = v10
				v7.Enabled = true
			else
				v7.Enabled = false
			end
			task.wait(1)
		end
	end,
	["Initialize"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_6, (copy) v_u_12
		local v11 = v_u_4.Load(v_u_2.RestartCountdown, "RestartCountdown")
		v11.Enabled = false
		v11.Parent = v_u_6
		task.defer(v_u_12._doRestartLoop)
	end
}
return v_u_12