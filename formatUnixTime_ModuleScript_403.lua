-- formatUnixTime (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

return function(p1, p2)
	if p1 then
		local v3 = os.date("!%X", p1)
		local v4 = p1 / 86400
		local v5 = math.floor(v4)
		if p2 and v5 > 0 then
			return string.format("%02d:%s", v5, v3)
		else
			return v3
		end
	else
		return "00:00:00"
	end
end