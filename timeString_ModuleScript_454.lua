-- timeString (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > time
-- Original

return function(p1)
	local v2 = math.floor(p1) % 60
	local v3 = p1 / 60
	local v4 = math.floor(v3) % 12
	local v5 = v4 == 0 and 12 or v4
	local v6 = p1 < 720 and "AM" or (p1 >= 720 and "PM" or nil)
	return string.format("%02i:%02i", v5, v2), v6
end