-- LimitedEvents (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > gameSpecific
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load("formatUnixTime")
local v_u_3 = {
	["Easter2026"] = DateTime.fromUniversalTime(2026, 4, 30, 23, 0, 0).UnixTimestamp,
	["EggHunt"] = DateTime.fromUniversalTime(2026, 4, 30, 23, 0, 0).UnixTimestamp,
	["Toon"] = DateTime.fromUniversalTime(2026, 5, 8, 23, 0, 0).UnixTimestamp
}
return {
	["IsActive"] = function(p4)
		-- upvalues: (copy) v_u_3
		local v5 = v_u_3[p4]
		if v5 then
			return v5 - os.time() > 0
		else
			return false
		end
	end,
	["GetTimer"] = function(p6)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v7 = v_u_3[p6]
		return not v7 and "(No longer available)" or v_u_2(v7 - os.time(), true)
	end
}