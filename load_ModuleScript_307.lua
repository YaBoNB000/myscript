-- load (ModuleScript)
-- ReplicatedStorage > devv > datum
-- Original

local v_u_1 = game:GetService("RunService")
return function(p2, p_u_3)
	-- upvalues: (copy) v_u_1
	local v4 = p_u_3 ~= nil
	assert(v4, "name cannot be nil!")
	local v5 = type(p_u_3) == "string"
	local v6 = "Cannot load non-string value! type: " .. type(p_u_3) .. ", value" .. tostring(p_u_3)
	assert(v5, v6)
	local v7 = string.lower(p_u_3)
	while not p2.allModulesAdded do
		task.wait(0.1)
	end
	if not p2.data[v7] then
		local v8 = os.clock()
		local v_u_9 = false
		local function v10()
			-- upvalues: (ref) v_u_9, (copy) p_u_3
			task.wait(1)
			if not v_u_9 then
				warn("module " .. p_u_3 .. " is taking too long to load")
				warn(debug.traceback())
			end
		end
		task.spawn(v10)
		local v11 = "loading module " .. p_u_3 .. "..."
		if not v_u_1:IsStudio() then
			print(v11)
		end
		local v12 = p2.modules[v7]
		if v12 then
			v12 = require(p2.modules[v7])
		end
		local v13 = v7 .. " is not a valid module!"
		assert(v12, v13)
		local v14 = string.format
		local v15 = os.clock() - v8
		local v16 = p_u_3 .. " loaded! load time: " .. tonumber(v14("%.4f", v15)) .. " ms"
		if not v_u_1:IsStudio() then
			print(v16)
		end
		v_u_9 = true
		p2.data[v7] = v12
	end
	return p2.data[v7]
end