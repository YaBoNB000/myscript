-- v3item (ModuleScript)
-- ReplicatedStorage > devv > client > Objects
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load
local v_u_3 = v_u_2("state")
local v_u_4 = v_u_2("skins")
local v_u_5 = v_u_2("object")
local v_u_6 = v_u_2("Signal")
local v_u_7 = v_u_2("v3sound")
local v_u_8 = v_u_2("deepCopy")
local v9 = v_u_2("Bindable")
v_u_2("printTable")
v_u_2("shallowCopy")
v_u_2("WaitForReturnTrue")
local v_u_10 = v_u_2("ClientReplicator")
local v_u_11 = game:GetService("Players")
local v_u_12 = v_u_11.LocalPlayer
v_u_3.equipped = {}
v_u_3.equippedItems = {}
v_u_3.equippedSkins = {}
local v_u_13 = require(script.bin.baseItem)
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
for _, v17 in pairs(script.bin:GetChildren()) do
	v_u_14[v17.Name] = require(v17)
end
v_u_15.types = v_u_14
for _, v18 in ipairs(script.modules:GetChildren()) do
	v_u_15[v18.Name] = require(v18)
end
local v_u_19 = {}
for _, v20 in script.modules.Skin.Types:GetChildren() do
	v_u_19[v20.Name] = require(v20)
end
v_u_15.onItemEquipped = v9.new()
v_u_15.onItemUnequipped = v9.new()
function v_u_15.NewItem(p21, p22, p23)
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_14, (copy) v_u_5, (copy) v_u_13, (copy) v_u_12, (copy) v_u_15, (copy) v_u_4, (copy) v_u_19
	local v24, v25 = v_u_2("v3items").getItemData(p22)
	if v24 then
		local v26 = v_u_8(v24)
		local v27 = v_u_5(v_u_14[v25] or v_u_13):new()
		v27.type = v25
		if p21 then
			v27.playerId = p21.UserId
		end
		for v28, v29 in pairs(v26) do
			v27[v28] = v29
		end
		if p21 == v_u_12 and v27.ammo then
			local v30 = v_u_15.ammoManager:new()
			v30.ammoOut = v27.startAmmo or -1
			v30.ammo = v27.ammo
			v30:setItem(v27)
			v27.ammoManager = v30
		end
		if p23 and (typeof(p23) == "string" and v_u_4.IsSkinCompatible(p22, p23)) then
			local v31 = v_u_4.GetSkinType(p23)
			if v31 then
				v31 = v_u_19[v31]
			end
			if v31 then
				v31.new(p23, v27)
			end
		end
		v27.tasks = {}
		return v27
	end
	warn("Invalid item " .. p22 .. "!")
end
local function v_u_37(p32)
	-- upvalues: (copy) v_u_15, (copy) v_u_3
	v_u_15.replicators.destroy(p32)
	local v33 = v_u_3.equippedItems[p32.UserId]
	if v33 then
		if v33.model then
			v33.model:Destroy()
			v33.model = nil
		end
		v33:clean()
		v_u_3.equippedItems[p32.UserId] = nil
	end
	local v34 = v_u_3.equipped[p32.UserId]
	local v35 = v_u_3.equippedSkins[p32.UserId]
	if v34 then
		local v36 = v_u_15.NewItem(p32, v34, v35)
		v_u_3.equippedItems[p32.UserId] = v36
		v_u_15.replicators.create(p32, v36)
	end
end
local function v_u_39()
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_3, (ref) v_u_16, (copy) v_u_37
	for _, v38 in pairs(v_u_11:GetPlayers()) do
		if v38 ~= v_u_12 and v_u_3.equipped[v38.UserId] ~= v_u_16[v38.UserId] then
			v_u_37(v38)
		end
	end
end
function v_u_15.syncEquip(p40, p41)
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_39
	local v42 = {}
	local v43 = {}
	for v44, v45 in pairs(p40) do
		local v46 = v_u_11:GetPlayerByUserId(v44)
		if v46 then
			v42[v46.UserId] = v45
			local v47 = p41[v46.UserId]
			if v47 then
				v43[v46.UserId] = v47
			end
		end
	end
	v_u_3.equipped = v42
	v_u_3.equippedSkins = v43
	v_u_39()
end
function v_u_15.playEquipAudio(p48, p49)
	-- upvalues: (copy) v_u_7
	if p48 and (p48.Character and p48.Character.PrimaryPart) then
		local v50 = v_u_7.newSound("equipItem")
		v50:attachToPart(p48.Character.PrimaryPart)
		v50.playbackSpeed = p49 and 1 or 0.7
		v50:play()
	end
end
function v_u_15.equip(p51, p52, p53)
	-- upvalues: (ref) v_u_16, (copy) v_u_8, (copy) v_u_3, (copy) v_u_39, (copy) v_u_15
	v_u_16 = v_u_8(v_u_3.equipped)
	v_u_3.equipped[p51.UserId] = p52
	v_u_3.equippedSkins[p51.UserId] = p53
	v_u_39()
	v_u_15.playEquipAudio(p51, p52)
end
function v_u_15.replicateShot(p54)
	-- upvalues: (copy) v_u_15
	local v55 = v_u_15.replicators.replicating[p54.UserId]
	if v55 and v55.shoot then
		v55:shoot()
	end
end
local function v_u_57(p56)
	-- upvalues: (copy) v_u_12, (copy) v_u_15
	if not v_u_12:GetAttribute("dataLoaded") then
		print("receiving data from playerdatahandler")
		repeat
			task.wait(0.5)
		until v_u_12:GetAttribute("dataLoaded")
		print("data received!")
	end
	v_u_15.inventory.update(p56)
end
local function v_u_64(p58, p59, p60)
	-- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_12, (copy) v_u_2, (copy) v_u_6
	local v61 = v_u_15.inventory.get(p58)
	if v61 and v61.ammoManager then
		v61.ammoManager:setAmmo(p59)
		v61.ammoManager:setAmmoOut(p60)
		local v62 = v61.controller
		local v63
		if v61.reloadType == "single" then
			v63 = v61.ammoManager.ammo == v61.ammo and true or v61.ammoManager.ammoOut == 0
		else
			v63 = false
		end
		if v61.reloadType == "single" and not v63 then
			v_u_10.Set(v_u_12, "reloading", false)
			v_u_10.Set(v_u_12, "reloading", true)
			v_u_2("v3item").crosshairs.reloading(v62.item.reloadTime)
			v_u_6.FireServer("reload", p58)
		else
			v_u_10.Set(v_u_12, "reloading", false)
			v_u_10.Replicate("reloading")
			if v61.onReloadedFunc then
				v61.onReloadedFunc(v61)
				return
			end
		end
	end
end
local function v_u_69(p65, p66, p67)
	-- upvalues: (copy) v_u_15
	local v68 = v_u_15.inventory.get(p65)
	if v68 and v68.ammoManager then
		v68.ammoManager:setAmmo(p66)
		v68.ammoManager:setAmmoOut(p67)
	end
end
function v_u_15.GetEquipped(p70)
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_15
	if v_u_3.equippedItems[p70.UserId] then
		return v_u_3.equippedItems[p70.UserId]
	end
	if p70 == v_u_12 then
		local v71, v72 = v_u_15.inventory.getEquippedItem()
		return v71, v72
	end
end
function v_u_15.GetItemById(p73)
	-- upvalues: (copy) v_u_15, (copy) v_u_12, (copy) v_u_3
	local v74 = v_u_15.inventory.getEquippedItem()
	if v74 and (v74.guid and v74.guid == p73) then
		return v74, v_u_12
	end
	for v75, v76 in v_u_3.equippedItems do
		if v76 and (v76.guid and v76.guid == p73) then
			return v76, v75
		end
	end
end
function v_u_15.GetEquippedName(p77)
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_15
	if v_u_3.equipped[p77.UserId] then
		return v_u_3.equipped[p77.UserId]
	end
	if p77 == v_u_12 then
		local v78 = v_u_15.inventory.getEquippedItem()
		if v78 and v78.name then
			return v78.name
		end
	end
end
function v_u_15.Initialize()
	-- upvalues: (copy) v_u_6, (copy) v_u_57, (copy) v_u_15, (copy) v_u_64, (copy) v_u_69, (copy) v_u_11, (copy) v_u_3
	v_u_6.FireServer("syncEquip")
	v_u_6.LinkSignal("updateInventory", v_u_57)
	v_u_6.FireServer("updateInventory")
	v_u_6.LinkSignal("equip", v_u_15.equip)
	v_u_6.LinkSignal("syncEquip", v_u_15.syncEquip)
	v_u_6.LinkSignal("replicateProjectiles", v_u_15.projectiles.replicateProjectiles)
	v_u_6.LinkSignal("replicateShot", v_u_15.replicateShot)
	v_u_6.LinkSignal("attackMeleeHit", v_u_15.melee.onMeleeHit)
	v_u_6.LinkSignal("attackOfMeleeSwing", v_u_15.melee.onMeleeSwing)
	v_u_6.LinkSignal("reload", v_u_64)
	v_u_6.LinkSignal("updateAmmo", v_u_69)
	v_u_15.projectiles.init()
	v_u_15.throwables.init()
	v_u_15.inventory.backpack.init()
	v_u_15.inventory.locker.init()
	v_u_15.replicators.init(v_u_15)
	v_u_15.movement.init()
	v_u_15.gravGun.init(v_u_15)
	v_u_15.renderItems.init()
	v_u_15.minigun.init(v_u_15)
	v_u_15.kunai.init()
	v_u_11.PlayerRemoving:Connect(function(p79)
		-- upvalues: (ref) v_u_15, (ref) v_u_3
		v_u_15.equip(p79)
		local v80 = v_u_3.equippedItems[p79.UserId]
		if v80 then
			if v80.model then
				v80.model:Destroy()
				v80.model = nil
			end
			v80:clean()
			v_u_3.equippedItems[p79.UserId] = nil
		end
	end)
end
return v_u_15