-- secondsToClock (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > time
-- Original

return function(p1)
	local v2 = tonumber(p1)
	if p1 >= 3600 then
		return string.format("%02i:%02i:%02i", v2 / 3600, v2 / 60 % 60, v2 % 60)
	else
		return string.format("%02i:%02i", v2 / 60 % 60, v2 % 60)
	end
end