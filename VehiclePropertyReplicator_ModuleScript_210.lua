-- VehiclePropertyReplicator (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > objectProperties
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("Signal")
local v_u_3 = v1("state")
local v_u_4 = v1("deepCopy")
v1("printTable")
v_u_3.vehicleProperties = {}
v_u_3.vehicleLastChanged = {}
local v_u_5 = v1("default-vehicle-properties")
local v_u_6 = {}
local function v_u_16(p7)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	if v_u_3.vehicleProperties[p7] == nil then
		local v8 = {}
		local v9 = {}
		local v10 = v_u_3.vehicles[p7]
		if not v10 then
			return
		end
		for v11, v12 in pairs(v_u_5) do
			local v13 = v12.defaultValue
			v8[v11] = type(v13) == "table" and v_u_4(v12.defaultValue) or v12.defaultValue
			v9[v11] = os.clock()
		end
		v_u_3.vehicleProperties[p7] = v8
		v_u_3.vehicleLastChanged[p7] = v9
		for v14, v15 in pairs(v8) do
			v10:propertyChanged(v14, v15)
		end
	end
end
local function v_u_28(p17)
	-- upvalues: (copy) v_u_3
	local v18 = {}
	local v19 = {}
	for v20, v21 in pairs(p17) do
		if v_u_3.vehiclesByGUID[v20] then
			local v22 = v_u_3.vehiclesByGUID[v20].model
			v18[v22] = v21
			v19[v22] = {}
		end
	end
	v_u_3.vehicleProperties = v18
	v_u_3.vehicleLastChanged = v19
	for v23, v24 in pairs(v_u_3.vehicleProperties) do
		local v25 = v_u_3.vehicles[v23]
		for v26, v27 in pairs(v24) do
			v19[v23][v26] = os.clock()
			v25:propertyChanged(v26, v27)
		end
	end
end
function v_u_6.Get(p29, p30)
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_5
	v_u_16(p29)
	if v_u_3.vehicleProperties[p29] and v_u_5[p30] then
		if v_u_3.vehicleProperties[p29][p30] == nil then
			return v_u_5[p30].defaultValue
		else
			return v_u_3.vehicleProperties[p29][p30]
		end
	else
		return nil
	end
end
function v_u_6.LastChanged(p31, p32)
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_5
	v_u_16(p31)
	if v_u_3.vehicleLastChanged[p31] and v_u_5[p32] then
		return v_u_3.vehicleLastChanged[p31][p32]
	end
end
function v_u_6.Set(p33, p34, p35)
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_5
	v_u_16(p33)
	if not (v_u_3.vehicleProperties[p33] and v_u_5[p34]) then
		return nil
	end
	if v_u_3.vehicleProperties[p33][p34] ~= p35 then
		local v36 = v_u_3.vehicleProperties[p33][p34]
		v_u_3.vehicleProperties[p33][p34] = p35
		v_u_3.vehicleLastChanged[p33][p34] = os.clock()
		v_u_3.vehicles[p33]:propertyChanged(p34, p35, v36)
	end
	return p35
end
function v_u_6.Replicate(p37, p38)
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_2
	if p37 and p37:IsDescendantOf(workspace) then
		v_u_16(p37)
		if v_u_3.vehicleProperties[p37] then
			local v39 = {}
			if type(p38) == "table" then
				for _, v40 in pairs(p38) do
					v39[v40] = v_u_3.vehicleProperties[p37][v40]
				end
			elseif type(p38) == "string" then
				v39[p38] = v_u_3.vehicleProperties[p37][p38]
			end
			v_u_2.FireServer("vehiclePropertyReplicator", p37, v39)
		end
	else
		return
	end
end
local function v_u_45(p41, p42)
	-- upvalues: (copy) v_u_16, (copy) v_u_6
	v_u_16(p41)
	for v43, v44 in pairs(p42) do
		v_u_6.Set(p41, v43, v44)
	end
end
local function v_u_47(p46)
	-- upvalues: (copy) v_u_3
	v_u_3.vehicleProperties[p46] = nil
	v_u_3.vehicleLastChanged[p46] = nil
end
function v_u_6.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_45, (copy) v_u_28, (copy) v_u_47
	v_u_2.LinkSignal("sendVehicleProperties", v_u_45)
	v_u_2.LinkSignal("vehiclePropertyReplicator", v_u_45)
	v_u_2.LinkSignal("vehiclePropertyBuilder", v_u_28)
	workspace.Game.Vehicles.ChildRemoved:Connect(v_u_47)
end
return v_u_6