-- Maid (ModuleScript)
-- ReplicatedStorage > devv > shared > Objects
-- Original

local v_u_20 = {
	["ClassName"] = "Maid",
	["new"] = function()
		-- upvalues: (copy) v_u_20
		local v1 = v_u_20
		return setmetatable({
			["_tasks"] = {}
		}, v1)
	end,
	["isMaid"] = function(p2)
		local v3
		if type(p2) == "table" then
			v3 = p2.ClassName == "Maid"
		else
			v3 = false
		end
		return v3
	end,
	["__index"] = function(p4, p5)
		-- upvalues: (copy) v_u_20
		if v_u_20[p5] then
			return v_u_20[p5]
		else
			return p4._tasks[p5]
		end
	end,
	["__newindex"] = function(p6, p7, p8)
		-- upvalues: (copy) v_u_20
		if v_u_20[p7] ~= nil then
			error(("\'%s\' is reserved"):format((tostring(p7))), 2)
		end
		local v9 = p6._tasks
		local v10 = v9[p7]
		if v10 ~= p8 then
			v9[p7] = p8
			if v10 then
				if type(v10) == "function" then
					v10()
					return
				end
				if typeof(v10) == "RBXScriptConnection" then
					v10:Disconnect()
					return
				end
				if v10.Destroy then
					v10:Destroy()
				end
			end
		end
	end,
	["GiveTask"] = function(p11, p12)
		if not p12 then
			error("Task cannot be false or nil", 2)
		end
		local v13 = #p11._tasks + 1
		p11[v13] = p12
		if type(p12) == "table" and not p12.Destroy then
			warn("[Maid.GiveTask] - Gave table task without .Destroy or .cancel\n\n" .. debug.traceback())
		end
		return v13
	end,
	["DoCleaning"] = function(p14)
		local v15 = p14._tasks
		for v16, v17 in pairs(v15) do
			if typeof(v17) == "RBXScriptConnection" then
				v15[v16] = nil
				v17:Disconnect()
			end
		end
		local v18, v19 = next(v15)
		while v19 ~= nil do
			v15[v18] = nil
			if type(v19) == "function" then
				v19()
			elseif typeof(v19) == "RBXScriptConnection" then
				v19:Disconnect()
			elseif v19.Destroy then
				v19:Destroy()
			end
			v18, v19 = next(v15)
		end
	end
}
v_u_20.Destroy = v_u_20.DoCleaning
return v_u_20