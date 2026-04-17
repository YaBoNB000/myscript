-- Raycast (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > ray
-- Original

return function(p1, p2, p3)
	return workspace:Raycast(p1, p2, p3) or {
		["Position"] = p1 + p2
	}
end