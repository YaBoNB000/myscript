-- playerIcon (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > player
-- Original

game:GetService("Players")
return function(p1, p2)
	if p1 == nil then
		return ""
	end
	local v3 = p2 or 100
	return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=%s&h=%s", p1, v3, v3)
end