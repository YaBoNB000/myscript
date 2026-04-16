-- devv (ModuleScript)
-- ReplicatedStorage
-- Original

local v_u_1 = {
	["data"] = {},
	["modules"] = {},
	["allModulesAdded"] = false,
	["allModulesLoaded"] = false
}
local function v_u_8(p2)
	-- upvalues: (copy) v_u_1, (copy) v_u_8
	if p2:IsA("ModuleScript") then
		local v3 = p2.Name
		local v4 = string.lower(v3)
		if v_u_1.modules[v4] == nil then
			v_u_1.modules[v4] = p2
		else
			error("Module with duplicate name found: " .. tostring(v4) .. " every module must use a unique name!")
		end
	else
		if p2:IsA("Folder") then
			for _, v5 in pairs(p2:GetChildren()) do
				local v6 = v5.Name
				if v5:IsA("ModuleScript") then
					local v7 = string.lower(v6)
					if v_u_1.modules[v7] == nil then
						v_u_1.modules[v7] = v5
					else
						error("Module with duplicate name found: " .. tostring(v7) .. " every module must use a unique name!")
					end
				elseif v5:IsA("Folder") then
					v_u_8(v5)
				end
			end
		end
		return
	end
end
function v_u_1.add(p9, p10)
	-- upvalues: (copy) v_u_1
	local v11 = string.lower(p10)
	if v_u_1.modules[v11] == nil then
		v_u_1.modules[v11] = p9
	else
		error("Module with duplicate name found: " .. tostring(v11) .. " every module must use a unique name!")
	end
end
v_u_1.addToModules = v_u_8
v_u_1.__load = require(script.datum.load)
function v_u_1.load(...)
	-- upvalues: (copy) v_u_1
	return v_u_1:__load(...)
end
v_u_1.__start = require(script.datum.start)
function v_u_1.start(...)
	-- upvalues: (copy) v_u_1
	return v_u_1:__start(...)
end
function v_u_1.Initialize()
	-- upvalues: (copy) v_u_1
	local v12 = script.datum.state
	local v13 = string.lower("state")
	if v_u_1.modules[v13] == nil then
		v_u_1.modules[v13] = v12
	else
		error("Module with duplicate name found: " .. tostring(v13) .. " every module must use a unique name!")
	end
	v_u_1.allModulesAdded = true
	for v14 in pairs(v_u_1.modules) do
		v_u_1.load(v14)
	end
	v_u_1.allModulesLoaded = true
end
return v_u_1