-- getTeamFromColor (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > teams
-- Original

return function(p1)
	return p1 == BrickColor.new("Bright blue") and "Police" or (p1 == BrickColor.new("Bright red") and "Criminals" or (p1 == BrickColor.new("White") and "Civilians" or "Civilians"))
end