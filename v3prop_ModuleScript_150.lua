-- v3prop (ModuleScript)
-- ReplicatedStorage > devv > client > Objects
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
v1("Signal")
local v_u_2 = v1("object")
local v3 = v1("state")
local v_u_4 = v1("deepCopy")
v1("GUID")
local v_u_5 = v1("v3props")
local v_u_6 = v1("v3subprops")
v1("sleep")
local v_u_7 = game:GetService("CollectionService")
require(script.util)
local v_u_8 = {}
v3.worldProps = v_u_8
local v_u_9 = {}
v3.worldPropsByGUID = v_u_9
local v_u_10 = {}
v3.worldSubprops = v_u_10
local v_u_11 = {}
v3.worldSubpropsByGUID = v_u_11
local v12 = script.bin
local v_u_13 = {
	["prop"] = {}
}
v_u_13.prop.base = require(v12.prop)
local v_u_14 = {}
for _, v15 in ipairs(v12.prop.types:GetChildren()) do
	v_u_13.prop[v15.Name] = require(v15)
end
v_u_13.subprop = {}
v_u_13.subprop.base = require(v12.subprop)
for _, v16 in ipairs(v12.subprop.types:GetChildren()) do
	v_u_13.subprop[v16.Name] = require(v16)
end
function v_u_14.IndexSubprop(p17)
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_6, (copy) v_u_4, (copy) v_u_13, (copy) v_u_2
	local v18
	if p17 then
		if typeof(p17) == "Instance" then
			v18 = p17:IsA("Model")
		else
			v18 = false
		end
	else
		v18 = p17
	end
	local v19 = tostring(p17) .. " is not a valid model/subproptype! (type: " .. type(p17) .. ")"
	assert(v18, v19)
	local v20 = p17:GetAttribute("guid")
	if v_u_10[p17] then
		return
	elseif v_u_11[v20] and v_u_11[v20].model ~= p17 then
		v_u_11[v20].model = p17
		v_u_10[p17] = v_u_11[v20]
		v_u_11[v20]:reset()
		return
	else
		local v21 = p17.Name
		if v_u_6.subprops[v21] ~= nil then
			local v22 = v_u_6.subprops[v21].propType
			local v23 = v_u_4(v_u_6.subprops[v21].data)
			local v24 = v_u_13.subprop[v22]
			local v25 = v_u_13.subprop.base
			if v24 then
				local v26 = v_u_2(v24 or v25):new()
				v26.defaultProperties = v_u_4(v23.defaultProperties) or {}
				v26.properties = v_u_4(v23.defaultProperties) or {}
				v26.subpropTypeName = v22
				for v27, v28 in pairs(v23) do
					v26[v27] = v28
				end
				local v29 = v26.subtype
				if v29 then
					local v30 = script.bin:FindFirstChild(v22, true)
					if v30 then
						if v29 then
							v29 = v30:FindFirstChild(v29)
						end
					else
						v29 = v30
					end
					if v29 then
						for _, v31 in pairs(v29:GetChildren()) do
							v26[v31.Name] = require(v31)
						end
					end
				end
				v26.guid = v20
				v26.model = p17
				v_u_10[p17] = v26
				v_u_11[v26.guid] = v26
				v26:init()
				return v26
			end
			warn("subpropType " .. v22 .. " does not exist!")
		end
	end
end
function v_u_14.IndexProp(p32)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_5, (copy) v_u_4, (copy) v_u_13, (copy) v_u_2
	local v33
	if p32 then
		if typeof(p32) == "Instance" then
			v33 = p32:IsA("Model")
		else
			v33 = false
		end
	else
		v33 = p32
	end
	local v34 = tostring(p32) .. " is not a valid model/subproptype! (type: " .. type(p32) .. ")"
	assert(v33, v34)
	local v35 = p32:GetAttribute("guid")
	if v_u_8[p32] then
		return
	elseif v_u_9[v35] and v_u_9[v35].model ~= p32 then
		v_u_9[v35].model = p32
		v_u_8[p32] = v_u_9[v35]
		v_u_9[v35]:reset()
		return
	else
		local v36 = p32.Name
		if v_u_5.props[v36] ~= nil then
			local v37 = v_u_5.props[v36].propType
			local v38 = v_u_4(v_u_5.props[v36].data)
			local v39 = v_u_13.prop[v37]
			local v40 = v_u_13.prop.base
			if v39 then
				local v41 = v_u_2(v39 or v40):new()
				v41.defaultProperties = v_u_4(v38.defaultProperties) or {}
				v41.properties = v_u_4(v38.defaultProperties) or {}
				v41.propTypeName = v37
				for v42, v43 in pairs(v38) do
					v41[v42] = v43
				end
				local v44 = v41.subtype
				if v44 then
					local v45 = script.bin:FindFirstChild(v37, true)
					if v45 then
						if v44 then
							v44 = v45:FindFirstChild(v44)
						end
					else
						v44 = v45
					end
					if v44 then
						for _, v46 in pairs(v44:GetChildren()) do
							v41[v46.Name] = require(v46)
						end
					end
				end
				v41.guid = v35
				v41.model = p32
				v_u_8[p32] = v41
				v_u_9[v41.guid] = v41
				v41:init()
				return v41
			end
			warn("propType " .. v37 .. " does not exist!")
		end
	end
end
function v_u_14.Initialize()
	-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_9, (copy) v_u_8, (copy) v_u_11, (copy) v_u_10
	v_u_7:GetInstanceAddedSignal("prop"):Connect(v_u_14.IndexProp)
	v_u_7:GetInstanceRemovedSignal("prop"):Connect(function(p47)
		-- upvalues: (ref) v_u_9, (ref) v_u_8
		local v48 = p47:GetAttribute("guid")
		local v49 = p47:GetAttribute("ownerId")
		local v50
		if v48 then
			v50 = v_u_9[v48]
		else
			v50 = v48
		end
		if v_u_8[p47] then
			v_u_8[p47] = nil
		end
		if v50 then
			v50.model = nil
			if v49 then
				v_u_9[v48] = nil
				if v50.clean then
					v50:clean()
				end
			end
		end
	end)
	v_u_7:GetInstanceAddedSignal("subprop"):Connect(v_u_14.IndexSubprop)
	v_u_7:GetInstanceRemovedSignal("subprop"):Connect(function(p51)
		-- upvalues: (ref) v_u_11, (ref) v_u_10
		local v52 = p51:GetAttribute("guid")
		local v53 = p51:GetAttribute("ownerId")
		local v54
		if v52 then
			v54 = v_u_11[v52]
		else
			v54 = v52
		end
		if v_u_10[p51] then
			v_u_10[p51] = nil
		end
		if v54 then
			v54.model = nil
			if v53 then
				v_u_11[v52] = nil
				if v54.clean then
					v54:clean()
				end
			end
		end
	end)
	task.defer(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_14
		for _, v55 in ipairs(v_u_7:GetTagged("prop")) do
			v_u_14.IndexProp(v55)
		end
		for _, v56 in ipairs(v_u_7:GetTagged("subprop")) do
			v_u_14.IndexSubprop(v56)
		end
	end)
end
return v_u_14