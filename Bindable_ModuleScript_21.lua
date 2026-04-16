-- Bindable (ModuleScript)
-- ReplicatedStorage > devv > shared > Objects
-- Original

local v_u_1 = game:GetService("HttpService")
local v_u_2 = {}
v_u_2.__index = v_u_2
v_u_2.ClassName = "Signal"
function v_u_2.isSignal(p3)
	-- upvalues: (copy) v_u_2
	local v4
	if type(p3) == "table" then
		v4 = getmetatable(p3) == v_u_2
	else
		v4 = false
	end
	return v4
end
function v_u_2.new()
	-- upvalues: (copy) v_u_2
	local v5 = v_u_2
	local v_u_6 = setmetatable({}, v5)
	v_u_6._bindableEvent = Instance.new("BindableEvent")
	v_u_6._argMap = {}
	v_u_6._source = ""
	v_u_6._bindableEvent.Event:Connect(function(p7)
		-- upvalues: (copy) v_u_6
		v_u_6._argMap[p7] = nil
		if not (v_u_6._bindableEvent or next(v_u_6._argMap)) then
			v_u_6._argMap = nil
		end
	end)
	return v_u_6
end
function v_u_2.Fire(p8, ...)
	-- upvalues: (copy) v_u_1
	if p8._bindableEvent then
		local v9 = table.pack(...)
		local v10 = v_u_1:GenerateGUID(false)
		p8._argMap[v10] = v9
		p8._bindableEvent:Fire(v10)
	else
		warn(("Signal is already destroyed. %s"):format(p8._source))
	end
end
function v_u_2.Connect(p_u_11, p_u_12)
	if type(p_u_12) ~= "function" then
		error(("connect(%s)"):format((typeof(p_u_12))), 2)
	end
	return p_u_11._bindableEvent.Event:Connect(function(p13)
		-- upvalues: (copy) p_u_11, (copy) p_u_12
		local v14 = p_u_11._argMap[p13]
		if v14 then
			local v15 = p_u_12
			local v16 = v14.n
			v15(table.unpack(v14, 1, v16))
		else
			error("Missing arg data, probably due to reentrance.")
		end
	end)
end
function v_u_2.Once(p_u_17, p_u_18)
	if type(p_u_18) ~= "function" then
		error(("once(%s)"):format((typeof(p_u_18))), 2)
	end
	return p_u_17._bindableEvent.Event:Once(function(p19)
		-- upvalues: (copy) p_u_17, (copy) p_u_18
		local v20 = p_u_17._argMap[p19]
		if v20 then
			local v21 = p_u_18
			local v22 = v20.n
			v21(table.unpack(v20, 1, v22))
		else
			error("Missing arg data, probably due to reentrance.")
		end
	end)
end
function v_u_2.Wait(p23)
	local v24 = p23._bindableEvent.Event:Wait()
	local v25 = p23._argMap[v24]
	if v25 then
		local v26 = v25.n
		return table.unpack(v25, 1, v26)
	else
		error("Missing arg data, probably due to reentrance.")
		return nil
	end
end
function v_u_2.Destroy(p27)
	if p27._bindableEvent then
		p27._bindableEvent:Destroy()
		p27._bindableEvent = nil
	end
	setmetatable(p27, nil)
end
return v_u_2