-- itemProtectionWarning (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v_u_3 = v2("dialogQueue")
local v_u_4 = v2("makeDialog")
local v_u_5 = v2("Signal")
local v_u_6 = v2("DOF")
local v_u_7 = v1.Guis.Dialog.ItemWarningDialog
local v_u_10 = {
	["prompt"] = function()
		-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
		task.wait(2)
		local v_u_8 = true
		local v9 = v_u_7:Clone()
		v_u_6(true)
		v_u_3:Add((v_u_4({
			["super"] = "dialog",
			["UIObject"] = v9,
			["button1func"] = function()
				-- upvalues: (ref) v_u_8, (ref) v_u_3
				v_u_8 = false
				v_u_3:Next()
			end,
			["closeFunc"] = function()
				-- upvalues: (ref) v_u_8, (ref) v_u_6
				v_u_8 = false
				v_u_6(false)
			end
		})))
		task.delay(20, function()
			-- upvalues: (ref) v_u_8, (ref) v_u_3
			if v_u_8 then
				v_u_3:Next()
			end
		end)
	end,
	["Initialize"] = function()
		-- upvalues: (copy) v_u_5, (copy) v_u_10
		v_u_5.LinkSignal("itemProtectionWarning", v_u_10.prompt)
	end
}
return v_u_10