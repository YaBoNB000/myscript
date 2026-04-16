-- GetCameraDistance (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > camera
-- Original

return function(p1, p2)
	local v3 = p2.Magnitude * 0.5
	local v4 = math.rad(p1) * 0.5
	return v3 / math.tan(v4) + v3
end