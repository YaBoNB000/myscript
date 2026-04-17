-- trophies (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = require(v1.devv).load
local v_u_4 = v3("shortenTime")
local v_u_5 = v3("commavalue")
local v_u_6
if v2:IsServer() then
	v_u_6 = v3("Persistence")
else
	v_u_6 = nil
end
local v32 = {
	["cashEarned"] = {
		["displayName"] = "Cash Earned",
		["description"] = "The total amount of cash you\'ve earned.",
		["tiers"] = {
			25000,
			250000,
			1000000,
			5000000
		},
		["formatStat"] = function(p7)
			-- upvalues: (copy) v_u_5
			return "$" .. v_u_5(p7)
		end,
		["getStat"] = function(p8)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p8, "totalMoneyEarned")
		end
	},
	["playtime"] = {
		["displayName"] = "Playtime",
		["description"] = "The total time you\'ve spent in game.",
		["tiers"] = {
			43200,
			259200,
			864000,
			3024000
		},
		["formatStat"] = function(p9)
			-- upvalues: (copy) v_u_4
			return v_u_4(p9)
		end,
		["getStat"] = function(p10)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p10, "playtime")
		end
	},
	["loginStreak"] = {
		["displayName"] = "Login Streak",
		["description"] = "The number of days you\'ve played in a row.",
		["tiers"] = {
			5,
			14,
			30,
			60
		},
		["showNote"] = "NUMBER SINCE 6/2/23",
		["formatStat"] = function(p11)
			-- upvalues: (copy) v_u_5
			return v_u_5(p11) .. " Day" .. (p11 == 1 and "" or "s")
		end,
		["getStat"] = function(p12)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p12, "loginStreak")
		end
	},
	["atmsRobbed"] = {
		["displayName"] = "ATMs Robbed",
		["description"] = "The total number of ATMs you\'ve robbed.",
		["tiers"] = {
			15,
			40,
			125,
			350
		},
		["showNote"] = "NUMBER SINCE 6/2/23",
		["formatStat"] = function(p13)
			-- upvalues: (copy) v_u_5
			return v_u_5(p13) .. " ATM" .. (p13 == 1 and "" or "s")
		end,
		["getStat"] = function(p14)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p14, "atmsRobbed")
		end
	},
	["jobEarnings"] = {
		["displayName"] = "Job Earnings",
		["description"] = "The cash you\'ve made from working a job in a store.",
		["tiers"] = {
			300,
			2500,
			10000,
			75000
		},
		["showNote"] = "NUMBER SINCE 6/2/23",
		["formatStat"] = function(p15)
			-- upvalues: (copy) v_u_5
			return "$" .. v_u_5(p15)
		end,
		["getStat"] = function(p16)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p16, "jobEarnings")
		end
	},
	["furnitureBought"] = {
		["displayName"] = "Furniture Bought",
		["description"] = "The amount of furniture you\'ve bought for your house.",
		["tiers"] = {
			50,
			150,
			300,
			650
		},
		["formatStat"] = function(p17)
			-- upvalues: (copy) v_u_5
			return v_u_5(p17)
		end,
		["getStat"] = function(p18)
			-- upvalues: (ref) v_u_6
			local v19, v20 = v_u_6.get(p18, "housing")
			local _ = v20.house.modelName
			local v21 = 0
			if not (v19 and v20) then
				return false
			end
			for _, v22 in v20.furniture do
				v21 = v21 + (v22 or 1)
			end
			for _, v23 in v20.houseSaves do
				for _, _ in v23.placedFurniture do
					v21 = v21 + 1
				end
			end
			for _, _ in v20.base.placedFurniture do
				v21 = v21 + 1
			end
			for _, _ in v20.room.placedFurniture do
				v21 = v21 + 1
			end
			return true, v21
		end
	},
	["gunCommissions"] = {
		["displayName"] = "Gun Sales",
		["description"] = "The cash you\'ve made from selling guns in your house.",
		["tiers"] = {
			1000,
			30000,
			75000,
			250000
		},
		["showNote"] = "NUMBER SINCE 6/2/23",
		["formatStat"] = function(p24)
			-- upvalues: (copy) v_u_5
			return "$" .. v_u_5(p24)
		end,
		["getStat"] = function(p25)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p25, "gunCommissions")
		end
	},
	["airdrops"] = {
		["displayName"] = "Airdrops",
		["description"] = "The number of airdrops you\'ve collected in total.",
		["tiers"] = {
			1,
			5,
			10,
			30
		},
		["showNote"] = "NUMBER SINCE 6/2/23",
		["formatStat"] = function(p26)
			-- upvalues: (copy) v_u_5
			return v_u_5(p26)
		end,
		["getStat"] = function(p27)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p27, "airdrops")
		end
	},
	["casesOpened"] = {
		["displayName"] = "Cases Opened",
		["description"] = "The number of skin cases you\'ve opened in total.",
		["tiers"] = {
			5,
			25,
			60,
			175
		},
		["showNote"] = "NUMBER SINCE 6/17/23",
		["formatStat"] = function(p28)
			-- upvalues: (copy) v_u_5
			return v_u_5(p28) .. " Cases"
		end,
		["getStat"] = function(p29)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p29, "casesOpened")
		end
	},
	["gemsRobbed"] = {
		["displayName"] = "Gems Robbed",
		["description"] = "The value of gems and valuables you\'ve robbed in total.",
		["tiers"] = {
			5000,
			50000,
			200000,
			750000
		},
		["formatStat"] = function(p30)
			-- upvalues: (copy) v_u_5
			return "$" .. v_u_5(p30)
		end,
		["getStat"] = function(p31)
			-- upvalues: (ref) v_u_6
			return v_u_6.get(p31, "gemsRobbed")
		end
	}
}
return v32