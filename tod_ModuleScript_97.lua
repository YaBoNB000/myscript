-- tod (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

return {
	["MINUTE_STEP"] = 1.6,
	["SERVER_WEEKTIME"] = function()
		return workspace:GetServerTimeNow() % 6300 * 1.6
	end,
	["DOTW"] = function()
		local v1 = workspace:GetServerTimeNow() % 6300 * 1.6 / 10080 * 7
		return math.floor(v1) + 1
	end,
	["SERVER_MINUTE"] = function()
		return workspace:GetServerTimeNow() % 6300 * 1.6 % 1440
	end,
	["CURRENT_DAY"] = function()
		local v2 = workspace:GetServerTimeNow() / 900 * 1.6
		return math.floor(v2)
	end,
	["CURRENT_WEEK"] = function()
		local v3 = workspace:GetServerTimeNow() / 6300 * 1.6
		return math.floor(v3)
	end,
	["TIME_WEEK_SECONDS"] = 6300,
	["TIME_DESCRIPTION"] = function(p4)
		return p4 < 240 and "night" or (p4 < 360 and "dawn" or (p4 < 600 and "morning" or (p4 < 780 and "noon" or (p4 < 1080 and "afternoon" or (p4 < 1200 and "dusk" or "night")))))
	end
}