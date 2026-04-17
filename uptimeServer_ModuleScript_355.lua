-- uptimeServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Debug
-- Original

local v_u_1 = os.time()
return function()
	-- upvalues: (copy) v_u_1
	local v2 = os.time() - v_u_1
	local v3 = v2 / 86400
	local v4 = math.floor(v3)
	local v5 = v2 / 3600
	local v6 = math.floor(v5) % 24
	local v7 = v2 / 60
	return ("%dd %dh %dm %ds"):format(v4, v6, math.floor(v7) % 60, math.floor(v2) % 60)
end