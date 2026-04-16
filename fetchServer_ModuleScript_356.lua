-- fetchServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Debug
-- Original

local v_u_1 = game:GetService("HttpService")
return function(_, p2)
	-- upvalues: (copy) v_u_1
	return v_u_1:GetAsync(p2)
end