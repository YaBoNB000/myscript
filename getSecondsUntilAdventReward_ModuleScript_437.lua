-- getSecondsUntilAdventReward (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > gameSpecific
-- Original

local v_u_1 = DateTime.fromUniversalTime(2025, 12, 1, 6, 0, 0).UnixTimestamp
return function()
	-- upvalues: (copy) v_u_1
	if os.time() - v_u_1 < 0 then
		local v2 = os.time() - v_u_1
		return math.abs(v2), -1
	else
		local v3 = os.time() - 21600
		local v4 = os.date("!*t", v3)
		if v4.year == 2026 then
			return 100, 30
		else
			return 86400 - (v4.hour * 3600 + v4.min * 60 + v4.sec), v4.day
		end
	end
end