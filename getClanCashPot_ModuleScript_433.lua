-- getClanCashPot (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > gameSpecific
-- Original

return function(p1, p2, p3, p4)
	local v5 = p4 / math.max(1, p3)
	local v6 = p1 / p2 * 0.25 + p1 * 0.75 * v5
	return math.floor(v6)
end