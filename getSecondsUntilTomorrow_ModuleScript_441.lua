-- getSecondsUntilTomorrow (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > time
-- Original

return function()
	local v1 = os.date("!*t", os.time() + 86400)
	return os.time({
		["year"] = v1.year,
		["month"] = v1.month,
		["day"] = v1.day,
		["hour"] = 0,
		["min"] = 0,
		["sec"] = 0
	}) - os.time()
end