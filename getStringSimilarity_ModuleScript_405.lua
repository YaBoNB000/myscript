-- getStringSimilarity (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

return function(p1, p2)
	local v3 = string.len(p1)
	local v4 = string.len(p2)
	local v5 = 0
	if v4 < v3 then
		local v6 = v4
		v4 = v3
		v3 = v6
		v6 = p2
		p2 = p1
		p1 = v6
	end
	for v7 = v3, 1, -1 do
		if v7 <= string.len(p1) then
			for v8 = 1, v3 - v7 + 1 do
				local v9 = v8 + v7 - 1
				local v10 = string.sub(p1, v8, v9)
				if string.len(v10) == 0 then
					break
				end
				local v11 = string.find(p2, v10)
				if v11 ~= nil then
					v5 = v5 + (v7 * 2) ^ 2
					local v12 = v8 - 1
					local v13 = string.sub(p1, 0, v12)
					local v14 = v8 + v7
					p1 = v13 .. string.sub(p1, v14)
					local v15 = v11 - 1
					local v16 = string.sub(p2, 0, v15)
					local v17 = v11 + v7
					p2 = v16 .. string.sub(p2, v17)
					break
				end
			end
		end
	end
	return (v5 / (v3 + v4) ^ 2) ^ 0.5
end