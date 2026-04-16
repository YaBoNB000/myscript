-- gotoPlaceServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Admin
-- Original

local v_u_1 = game:GetService("TeleportService")
return function(p2, p3, p4, p5)
	-- upvalues: (copy) v_u_1
	local v6 = p3 or { p2.Executor }
	if p4 <= 0 then
		return "Invalid place ID"
	end
	if p5 == "-" then
		return "Invalid job ID"
	end
	p2:Reply("Commencing teleport...")
	if p5 then
		for _, v7 in ipairs(v6) do
			v_u_1:TeleportToPlaceInstance(p4, p5, v7)
		end
	else
		v_u_1:TeleportAsync(p4, v6)
	end
	return "Teleported."
end