-- stripToNumber (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

return function(p1)
	local v2 = p1:gsub("[%c%p%s]", "")
	return tonumber(v2)
end