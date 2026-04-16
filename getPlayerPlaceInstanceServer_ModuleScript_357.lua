-- getPlayerPlaceInstanceServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Debug
-- Original

local v_u_1 = game:GetService("TeleportService")
return function(_, p_u_2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = p3 or "PlaceIdJobId"
	local v5, _, v6, v7, v8 = pcall(function()
		-- upvalues: (ref) v_u_1, (copy) p_u_2
		return v_u_1:GetPlayerPlaceInstanceAsync(p_u_2)
	end)
	if not v5 or v6 and #v6 > 0 then
		if v4 == "PlaceIdJobId" then
			return "0 -"
		end
		if v4 == "PlaceId" then
			return "0"
		end
		if v4 == "JobId" then
			return "-"
		end
	end
	if v4 == "PlaceIdJobId" then
		return v7 .. " " .. v8
	end
	if v4 == "PlaceId" then
		return tostring(v7)
	end
	if v4 == "JobId" then
		return tostring(v8)
	end
end