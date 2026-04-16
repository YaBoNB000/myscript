-- Furniture (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientHouse
-- Original

local v_u_1 = game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players")
local v_u_5 = v_u_4.LocalPlayer
local v6 = require(v2.devv).load
local v_u_7 = v6("FurniturePlacer")
local v_u_8 = v6("Bindable")
v6("Signal")
v6("object")
local v_u_9 = v6("state")
v6("Maid")
local v_u_10 = require(script.furnitureObject)
local v_u_11 = {}
for _, v12 in script.modules:GetChildren() do
	v_u_11[v12.Name] = require(v12)
end
local v_u_13 = nil
local v14 = {}
local v_u_15 = {}
v_u_9.furniture = v_u_15
local v_u_16 = {}
v_u_9.furnitureByGUID = v_u_16
local v_u_17 = {}
function v14.GetFurnitureByGUID(_, p18)
	-- upvalues: (copy) v_u_9
	local v19 = v_u_9.furnitureByGUID[p18]
	if v19 then
		return v19
	end
end
function v14._furnitureAdded(_, p20)
	-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_10, (copy) v_u_17, (copy) v_u_16
	if v_u_15[p20] then
		return
	else
		repeat
			local v21 = p20:GetAttribute("guid")
			task.wait(0.1)
		until v21 or not (p20 and p20:IsDescendantOf(workspace))
		local v22 = p20:GetAttribute("owner")
		if v22 then
			v22 = v_u_4:GetPlayerByUserId(v22)
		end
		if p20 and p20.Parent then
			local v23 = v_u_10:new()
			v23.guid = v21
			local v24 = p20.Parent.Parent.Parent.Parent
			if v24 and v24:IsDescendantOf(workspace.HousingPlots) then
				v23.houseFolder = v24
			end
			if v22 then
				v23.owner = v22
			end
			v23:init(p20)
			if v23.heartbeat then
				v_u_17[p20] = v23
			end
			v_u_15[p20] = v23
			v_u_16[v21] = v23
		end
	end
end
function v14._furnitureRemoved(_, p25)
	-- upvalues: (copy) v_u_15, (copy) v_u_16, (copy) v_u_17
	local v26 = v_u_15[p25]
	if v26 then
		if v26.guid then
			v_u_16[v26.guid] = nil
		end
		v_u_15[p25] = nil
		v_u_17[p25] = nil
		if v26.clean then
			v26:clean()
		end
	end
end
function v14.initFurniture(p_u_27, p28)
	-- upvalues: (ref) v_u_13, (copy) v_u_7, (copy) v_u_8, (copy) v_u_1, (copy) v_u_11, (copy) v_u_5, (copy) v_u_3, (copy) v_u_17, (copy) v_u_15
	v_u_13 = p28
	p_u_27.furniturePlacer = v_u_7.new()
	p_u_27.onFurniturePlaced = v_u_8.new()
	p_u_27.onFurniturePicked = v_u_8.new()
	p_u_27.onFurnitureUpdated = v_u_8.new()
	p_u_27.onSlotMachinePlaced = v_u_8.new()
	local v29 = v_u_1:GetTagged("clientFurniture")
	for _, v_u_30 in ipairs(v29) do
		task.defer(function()
			-- upvalues: (copy) p_u_27, (copy) v_u_30
			p_u_27:_furnitureAdded(v_u_30)
		end)
	end
	v_u_1:GetInstanceAddedSignal("clientFurniture"):Connect(function(p31)
		-- upvalues: (copy) p_u_27
		p_u_27:_furnitureAdded(p31)
	end)
	v_u_1:GetInstanceRemovedSignal("clientFurniture"):Connect(function(p32)
		-- upvalues: (copy) p_u_27
		p_u_27:_furnitureRemoved(p32)
	end)
	for _, v33 in v_u_11 do
		if v33.init then
			v33.init(v_u_13)
		end
	end
	v_u_3.Heartbeat:Connect(function(p34)
		-- upvalues: (ref) v_u_17
		for _, v35 in v_u_17 do
			if v35.isClose then
				v35:heartbeat(p34)
			end
		end
	end)
	while true do
		task.wait(1)
		for _, v36 in v_u_15 do
			if v36.update or v36.heartbeat then
				local v37
				if v36 then
					v37 = v36.model
				else
					v37 = v36
				end
				local v38, v39
				if v37 and (v37.Parent and v37.PrimaryPart) then
					v38 = v_u_5:DistanceFromCharacter(v37.PrimaryPart.Position)
					v39 = true
				else
					v39 = false
					v38 = nil
				end
				if v39 then
					v36.isClose = v38 < 100
					if v36.update and v38 < 100 then
						v36:update()
					end
				end
			end
		end
	end
end
return v14