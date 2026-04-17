-- start (ModuleScript)
-- ReplicatedStorage > devv > datum
-- Original

local v_u_1 = game:GetService("RunService")
local function v_u_2(...)
	return { ... }
end
return function(p3, p4, ...)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v5 = os.clock()
	local v6 = p3:__load(p4)
	local v7 = v6 ~= nil
	local v8 = "module with name " .. tostring(p4) .. " was not found!"
	assert(v7, v8)
	local v9 = v6.Initialized == nil
	local v10 = "module with name " .. tostring(p4) .. " has already been Initialized!"
	assert(v9, v10)
	local v11 = v6.Initialize ~= nil
	local v12 = "Initialize function for module " .. tostring(p4) .. " is nil!"
	assert(v11, v12)
	local v13 = v6.Initialize
	local v14 = type(v13) == "function"
	local v15 = "Initialize must be a function! for module " .. tostring(p4)
	assert(v14, v15)
	local v16 = "Initializing " .. p4 .. "..."
	if not v_u_1:IsStudio() then
		print(v16)
	end
	local v17 = v_u_2(v6.Initialize(v6, ...))
	v6.Initialized = true
	local v18 = string.format
	local v19 = os.clock() - v5
	local v20 = p4 .. " Initialized! init time: " .. tonumber(v18("%.4f", v19)) .. " ms"
	if not v_u_1:IsStudio() then
		print(v20)
	end
	return unpack(v17)
end