-- getDayOfTheWeekString (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > time
-- Original

return function(p1)
	local v2 = type(p1) == "number"
	assert(v2, "INVALID DATE INT")
	return p1 == 1 and "Monday" or (p1 == 2 and "Tuesday" or (p1 == 3 and "Wednesday" or (p1 == 4 and "Thursday" or (p1 == 5 and "Friday" or (p1 == 6 and "Saturday" or (p1 == 7 and "Sunday" or "Monday"))))))
end