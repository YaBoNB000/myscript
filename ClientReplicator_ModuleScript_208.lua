-- ClientReplicator (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > objectProperties
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("Signal")
v1("printTable")
local v_u_3 = v1("deepCopy")
local v_u_4 = v1("specialRoles")
local v_u_5 = v1("state")
v_u_5.properties = {}
v_u_5.propertyUpdateFuncs = {}
v_u_5.lastChanged = {}
local v_u_6 = game:GetService("Players")
local v_u_7 = v_u_6.LocalPlayer
local v_u_8 = v1("default-properties")
local v_u_9 = {}
local function v_u_16(p10)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_3
	if p10 then
		if v_u_5.properties[p10] == nil then
			if not p10:IsDescendantOf(game) then
				return
			end
			local v11 = {}
			local v12 = {}
			for v13, v14 in pairs(v_u_8) do
				local v15 = v14.defaultValue
				v11[v13] = type(v15) == "table" and v_u_3(v14.defaultValue) or v14.defaultValue
				v12[v13] = os.clock()
			end
			v_u_5.properties[p10] = v11
			v_u_5.lastChanged[p10] = v12
		end
	end
end
local function v_u_22(p17)
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v18 = {}
	for v19, v20 in pairs(p17) do
		local v21 = v_u_6:FindFirstChild(v19)
		if v21 then
			v18[v21] = v20
		end
	end
	v_u_5.properties = v18
end
v_u_16(v_u_7)
function v_u_9.Get(p23, p24)
	-- upvalues: (copy) v_u_16, (copy) v_u_5, (copy) v_u_8
	if p23 then
		v_u_16(p23)
		if v_u_5.properties[p23] and v_u_8[p24] then
			if v_u_5.properties[p23][p24] == nil then
				return v_u_8[p24].defaultValue
			else
				return v_u_5.properties[p23][p24]
			end
		else
			return
		end
	else
		return
	end
end
function v_u_9.Check(p25, p26)
	-- upvalues: (copy) v_u_9
	if p25 then
		local v27 = true
		for v28, v29 in pairs(p26) do
			if v_u_9.Get(p25, v28) ~= v29 then
				return false
			end
		end
		return v27
	end
end
function v_u_9.LastChanged(p30, p31)
	-- upvalues: (copy) v_u_16, (copy) v_u_5, (copy) v_u_8
	if p30 then
		v_u_16(p30)
		if v_u_5.lastChanged[p30] and v_u_8[p31] then
			return v_u_5.lastChanged[p30][p31]
		end
	end
end
function v_u_9.AddUpdateFunc(p32, p33, p34, p35)
	-- upvalues: (copy) v_u_5
	if p32 then
		if v_u_5.propertyUpdateFuncs[p32] == nil then
			v_u_5.propertyUpdateFuncs[p32] = {}
		end
		local v36 = v_u_5.propertyUpdateFuncs[p32][p33]
		if not v36 then
			v36 = {}
			v_u_5.propertyUpdateFuncs[p32][p33] = v36
		end
		if v36[p34] == nil then
			v36[p34] = p35
		end
	else
		return
	end
end
function v_u_9.Set(p37, p38, p39)
	-- upvalues: (copy) v_u_16, (copy) v_u_5, (copy) v_u_8, (copy) v_u_4
	if p37 then
		v_u_16(p37)
		if not (v_u_5.properties[p37] and v_u_8[p38]) then
			return nil
		end
		if v_u_5.properties[p37][p38] ~= p39 then
			if p38 == "knocked" and (p37:GetAttribute("god") and v_u_4.isHero(p37.UserId)) then
				return
			end
			local v40 = v_u_5.properties[p37][p38]
			v_u_5.properties[p37][p38] = p39
			if v_u_5.lastChanged[p37] then
				v_u_5.lastChanged[p37][p38] = os.clock()
			end
			if v_u_8[p38].doPrint == true then
				print(p37.Name, p38, p39)
			end
			if v_u_5.propertyUpdateFuncs[p37] then
				local v41 = v_u_5.propertyUpdateFuncs[p37]
				if v41 then
					v41 = v_u_5.propertyUpdateFuncs[p37][p38]
				end
				if v41 then
					for _, v42 in pairs(v41) do
						v42(p37, p38, p39, v40)
					end
				end
			end
		end
		return p39
	end
end
function v_u_9.Replicate(p43)
	-- upvalues: (copy) v_u_16, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2
	v_u_16(v_u_7)
	local v44 = {}
	if type(p43) == "table" then
		for _, v45 in pairs(p43) do
			v44[v45] = v_u_5.properties[v_u_7][v45]
		end
	elseif type(p43) == "string" then
		v44[p43] = v_u_5.properties[v_u_7][p43]
	end
	v_u_2.FireServer("propertyReplicator", v44)
end
local function v_u_50(p46, p47)
	-- upvalues: (copy) v_u_16, (copy) v_u_9
	v_u_16(p46)
	for v48, v49 in pairs(p47) do
		v_u_9.Set(p46, v48, v49)
	end
end
function v_u_9.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_50, (copy) v_u_22, (copy) v_u_6, (copy) v_u_5
	v_u_2.LinkSignal("propertyReplicator", v_u_50)
	v_u_2.LinkSignal("propertyBuilder", v_u_22)
	v_u_2.FireServer("propertyBuilder")
	v_u_6.PlayerRemoving:Connect(function(p51)
		-- upvalues: (ref) v_u_5
		v_u_5.properties[p51] = nil
		v_u_5.lastChanged[p51] = nil
		v_u_5.propertyUpdateFuncs[p51] = nil
	end)
end
return v_u_9