-- ClientHouse (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

game:GetService("CollectionService")
local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local _ = game:GetService("Players").LocalPlayer
local v2 = require(v1.devv).load
local v_u_3 = v2("Signal")
v2("state")
local v_u_4 = v2("Maid")
local v_u_5 = require(script.Furniture)
local v_u_6 = require(script.BuildDetection)
local v_u_7 = require(script.PlotTypes.Houses)
local v_u_8 = require(script.PlotTypes.Bases)
local v_u_9 = require(script.PlotTypes.Rooms)
local v_u_10 = require(script.ui.BuildWindow)
local v_u_11 = require(script.ui.HomeManager)
local v_u_12 = require(script.ui.BaseManager)
local v_u_13 = require(script.ui.RoomManager)
local v_u_14 = require(script.ui.shared.Permissions)
local v_u_15 = require(script.ui.shared.Colors)
local v_u_22 = {
	["hasInitialized"] = false,
	["houseData"] = nil,
	["Furniture"] = v_u_5,
	["BuildDetection"] = v_u_6,
	["Houses"] = v_u_7,
	["Bases"] = v_u_8,
	["Rooms"] = v_u_9,
	["BuildWindow"] = v_u_10,
	["HomeManager"] = v_u_11,
	["BaseManager"] = v_u_12,
	["RoomManager"] = v_u_13,
	["Permissions"] = v_u_14,
	["Colors"] = v_u_15,
	["GetHouseData"] = function(p16)
		return p16.houseData
	end,
	["SetHouseData"] = function(p17, p18)
		p17.houseData = p18
	end,
	["UpdateData"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_22, (copy) v_u_11
		local v19 = v_u_3.InvokeServer("getHouseData")
		if not v19 then
			return false
		end
		v_u_22:SetHouseData(v19)
		v_u_11:dataUpdatedFunc()
		return true
	end,
	["Initialize"] = function(p_u_20)
		-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_7, (copy) v_u_22, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_10
		p_u_20.inDialog = false
		p_u_20.accessList = {
			["house"] = {},
			["base"] = {},
			["room"] = {}
		}
		local v21 = {
			["house"] = {
				["member"] = false,
				["captain"] = false,
				["admin"] = false
			},
			["base"] = {
				["member"] = true,
				["captain"] = true,
				["admin"] = true
			},
			["room"] = {
				["member"] = false,
				["captain"] = false,
				["admin"] = false
			}
		}
		p_u_20.clanAccessList = v21
		p_u_20.houseMaid = v_u_4.new()
		p_u_20.baseMaid = v_u_4.new()
		p_u_20.roomMaid = v_u_4.new()
		task.spawn(function()
			-- upvalues: (copy) p_u_20, (ref) v_u_3, (ref) v_u_7, (ref) v_u_22, (ref) v_u_8, (ref) v_u_9, (ref) v_u_6, (ref) v_u_5, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15, (ref) v_u_10
			repeat
				p_u_20.houseData = v_u_3.InvokeServer("getHouseData")
				task.wait(1)
			until p_u_20.houseData ~= nil
			p_u_20.hasInitialized = true
			task.spawn(function()
				-- upvalues: (ref) v_u_7, (ref) v_u_22
				v_u_7:initHouses(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_22
				v_u_8:initBases(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_22
				v_u_9:initRooms(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_22
				v_u_6:initBuildDetection(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_22
				v_u_5:initFurniture(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_22
				v_u_11:initMenu(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_12, (ref) v_u_22
				v_u_12:initMenu(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_13, (ref) v_u_22
				v_u_13:initMenu(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_14, (ref) v_u_22
				v_u_14:initPermissions(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_22
				v_u_15:initColors(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_10, (ref) v_u_22
				v_u_10:initBuild(v_u_22)
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_9, (ref) v_u_7
				while true do
					task.wait(1)
					v_u_8:setPromptsEnabled()
					v_u_9:setPromptsEnabled()
					v_u_7:setPromptsEnabled()
				end
			end)
		end)
	end
}
return v_u_22