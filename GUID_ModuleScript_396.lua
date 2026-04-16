-- GUID (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

local v_u_1 = Random.new()
return function()
	-- upvalues: (copy) v_u_1
	local v2 = ""
	for _ = 1, 8 do
		local v3 = v_u_1:NextNumber() > 0.5
		local v4 = v_u_1:NextInteger(1, 36)
		local v5
		if v4 <= 26 then
			local v6 = 96 + v4
			v5 = string.char(v6)
			if v3 then
				v5 = v5:upper()
			end
		else
			local v7 = v4 - 27
			v5 = tostring(v7)
		end
		v2 = v2 .. v5
	end
	return v2
end