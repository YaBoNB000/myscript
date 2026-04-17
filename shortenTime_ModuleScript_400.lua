-- shortenTime (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

return function(p1)
	if p1 then
		local v2 = p1 / 86400
		local v3 = math.floor(v2)
		local v4 = p1 % 86400 / 3600
		local v5 = math.floor(v4)
		local v6 = p1 % 3600 / 60
		local v7 = math.floor(v6)
		local v8 = p1 % 60
		if v3 > 0 then
			return string.format("%sd %sh %sm", v3, v5, v7)
		elseif v5 > 0 then
			return string.format("%sh %sm", v5, v7)
		elseif v7 > 0 then
			return string.format("%sm %ss", v7, v8)
		else
			return string.format("%ss", v8)
		end
	else
		return "0s"
	end
end