-- varServer (ModuleScript)
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
return function(p8, p9)
	-- upvalues: (ref) v_u_3, (copy) v_u_2, (ref) v_u_4
	if v_u_3 == nil then
		local v10 = v_u_2
		local v11 = coroutine.running
		table.insert(v10, v11())
		coroutine.yield()
	end
	local v12 = true
	local v13
	if p9:sub(1, 1) == "$" then
		p9 = p9:sub(2)
		v13 = true
	else
		v13 = false
	end
	if p9:sub(1, 1) == "." then
		p9 = p9:sub(2)
		v12 = false
	end
	if v12 and not v_u_3 then
		return "# You must publish this place to the web to use saved keys."
	else
		local v14 = "var_"
		local v15
		if v13 then
			v15 = "global"
		else
			local v16 = p8.Executor.UserId
			v15 = tostring(v16)
		end
		local v17 = v14 .. v15
		if v12 then
			local v18 = v_u_4:GetAsync(v17 .. "_" .. p9) or ""
			return type(v18) == "table" and (table.concat(v18, ",") or "") or v18
		else
			local v19 = p8:GetStore(v17)[p9] or ""
			return type(v19) == "table" and (table.concat(v19, ",") or "") or v19
		end
	end
end