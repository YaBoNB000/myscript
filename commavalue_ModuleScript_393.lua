-- commavalue (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

return function(p1)
	local v2, v3, v4 = string.match(p1, "^([^%d]*%d)(%d*)(.-)$")
	return v2 .. v3:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. v4
end