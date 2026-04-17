-- varSetServer (ModuleScript)
-- ReplicatedStorage > Cmdr > Server commands > Utility
-- Original

local v_u_1 = game:GetService("DataStoreService")
local v_u_2 = {}
local v_u_3 = nil
local v_u_4 = nil
task.spawn(function()
	-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) v_u_1, (copy) v_u_2
	local v6, v7 = pcall(function()
		-- upvalues: (ref) v_u_1
		local v5 = v_u_1:GetDataStore("_package/eryn.io/Cmdr")
		v5:GetAsync("test_key")
		return v5
	end)
	v_u_3 = v6
	v_u_4 = v7
	while #v_u_2 > 0 do
		coroutine.resume(table.remove(v_u_2, 1))
	end
end)
return function(p8, p9, p10)
	-- upvalues: (ref) v_u_3, (copy) v_u_2, (ref) v_u_4
	if v_u_3 == nil then
		local v11 = v_u_2
		local v12 = coroutine.running
		table.insert(v11, v12())
		coroutine.yield()
	end
	local v13 = true
	local v14
	if p9:sub(1, 1) == "$" then
		p9 = p9:sub(2)
		v14 = true
	else
		v14 = false
	end
	if p9:sub(1, 1) == "." then
		p9 = p9:sub(2)
		v13 = false
	end
	if v13 and not v_u_3 then
		return "# You must publish this place to the web to use saved keys."
	else
		local v15 = "var_"
		local v16
		if v14 then
			v16 = "global"
		else
			local v17 = p8.Executor.UserId
			v16 = tostring(v17)
		end
		local v18 = v15 .. v16
		if v13 then
			v_u_4:SetAsync(v18 .. "_" .. p9, p10)
			return type(p10) == "table" and (table.concat(p10, ",") or "") or p10
		else
			p8:GetStore(v18)[p9] = p10
			return type(p10) == "table" and (table.concat(p10, ",") or "") or p10
		end
	end
end