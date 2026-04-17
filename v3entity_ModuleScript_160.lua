-- v3entity (ModuleScript)
-- ReplicatedStorage > devv > client > Objects
-- Original

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v3 = require(game:GetService("ReplicatedStorage").devv).load
local v4 = v3("state")
local v_u_5 = v3("object")
local v_u_6 = v3("Scheduler")
local v_u_7 = v3("Signal")
local v_u_8 = v3("v3entities")
local v_u_9 = v3("deepCopy")
local v_u_10 = {}
local v_u_11 = {}
v4.worldEntities = v_u_11
local v_u_12 = {}
v4.worldEntitiesByGUID = v_u_12
local v_u_13 = require(script.bin.baseEntity)
local v_u_14 = {
	["Pickups"] = require(script.bin.Pickups)
}
v_u_10.types = v_u_14
local v_u_15 = require(script.modules.billboardManager)
function v_u_10.IndexEntity(p16)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_5, (copy) v_u_13, (copy) v_u_11
	if p16 then
		local v17 = p16.Name
		if v_u_8.entities[v17] then
			local v18 = v_u_8.entities[v17].type
			local v19 = v_u_9(v_u_8.entities[v17].data)
			local v20 = v_u_5(v_u_14[v18] or v_u_13):new()
			v20.type = v18
			for v21, v22 in pairs(v19) do
				v20[v21] = v22
			end
			local v23 = v20.subtype
			local v24 = script.bin:FindFirstChild(v18)
			local v25 = v24 and (v23 and v24:FindFirstChild("subtypes"))
			if v25 then
				v25 = v24.subtypes:FindFirstChild(v23)
			end
			if v25 then
				for _, v26 in pairs(v25:GetChildren()) do
					v20[v26.Name] = require(v26)
				end
			end
			v20.serverModel = p16
			v20.promises = {}
			v_u_11[p16] = v20
			return v20
		end
	end
end
local function v_u_30(p27, p28)
	-- upvalues: (copy) v_u_12
	local v29 = v_u_12[p27]
	if v29 then
		v29:changeState(p28)
	end
end
local v_u_31 = false
local v_u_32 = nil
local function v_u_46(p33)
	-- upvalues: (ref) v_u_31, (ref) v_u_32, (copy) v_u_10, (copy) v_u_12
	if not v_u_31 then
		v_u_31 = true
		v_u_32:cancel()
		local function v39(p34)
			-- upvalues: (ref) v_u_10
			for _, v35 in pairs(p34) do
				local v36 = v35[1]
				local v37 = v35[3]
				local v38 = v_u_10.IndexEntity(v36)
				if v38 then
					if v38.init then
						v38:Init()
					end
					v38:changeState(v37)
				end
			end
		end
		(function(p40)
			-- upvalues: (ref) v_u_10, (ref) v_u_12
			for _, v41 in pairs(p40) do
				local v42 = v41[1]
				local v43 = v41[2]
				local v44 = v_u_10.IndexEntity(v42)
				if v44 then
					v44.guid = v43
					v_u_12[v43] = v44
					local v45 = Instance.new("StringValue")
					v45.Value = v43
					v45.Name = "GUID"
					v45.Parent = v42
				end
			end
		end)(p33)
		v39(p33)
	end
end
local function v_u_49()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_11
	local function v_u_48()
		-- upvalues: (ref) v_u_1, (ref) v_u_2, (ref) v_u_11
		for _, v_u_47 in v_u_1:GetTagged("newbieItem") do
			if v_u_2:GetAttribute("newbieItemClaimed_" .. v_u_47.Name:gsub(" ", "")) or (v_u_2:GetAttribute("playtime") or 0) > 7200 then
				task.defer(function()
					-- upvalues: (copy) v_u_47, (ref) v_u_11
					v_u_47.Parent = nil
					if v_u_11[v_u_47] and v_u_11[v_u_47].clean then
						v_u_11[v_u_47]:clean()
					end
				end)
			end
		end
	end
	task.defer(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_48
		repeat
			task.wait(0.1)
		until v_u_2:GetAttribute("newbieItemsLoaded")
		v_u_48()
	end)
	v_u_1:GetInstanceAddedSignal("newbieItem"):Connect(v_u_48)
end
function v_u_10.Initialize()
	-- upvalues: (copy) v_u_7, (copy) v_u_46, (copy) v_u_30, (ref) v_u_32, (copy) v_u_6, (copy) v_u_49, (copy) v_u_15
	v_u_7.LinkSignal("requestEntityData", v_u_46)
	v_u_7.LinkSignal("changeEntityState", v_u_30)
	v_u_32 = v_u_6.Schedule(function()
		-- upvalues: (ref) v_u_7
		v_u_7.FireServer("requestEntityData")
	end, 1, -1)
	v_u_49()
	v_u_15.Initialize()
end
return v_u_10