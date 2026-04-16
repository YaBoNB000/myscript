-- firstUppercase (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

return function(p1)
	return p1:gsub("^%l", string.upper)
end