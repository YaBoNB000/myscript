-- HalloweenAmbient (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Halloween
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v4 = require(v2.devv).load
local v_u_5 = v4("LimitedEvents")
local v_u_6 = v4("v3sound")
function v1.Initialize()
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_3, (ref) v_u_6
		if v_u_5.IsActive("Halloween") then
			repeat
				task.wait()
			until v_u_3:GetAttribute("isSpawnedLocally")
			local v_u_7 = v_u_6.newLocalSound("ghostLaugh")
			v_u_7:Play()
			local v_u_8 = v_u_6.newLocalSound("halloweenIntro")
			task.delay(60, function()
				-- upvalues: (copy) v_u_7, (copy) v_u_8
				v_u_7:Destroy()
				v_u_8:Destroy()
			end)
			task.wait(1.5)
			v_u_8:Play()
		end
	end)
end
return v1