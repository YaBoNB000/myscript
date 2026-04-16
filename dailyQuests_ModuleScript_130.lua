-- dailyQuests (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = {
	["rewards"] = {
		{ "Series3Heavy" },
		{ "Series3Light" },
		{ "Series2Heavy" },
		{ "Series2Light" },
		{ "HeavyWeapons" },
		{ "SmallArms" },
		{ "Series2Light", "Series2Light" },
		{ "SmallArms", "SmallArms" }
	}
}
local v11 = {
	["playtime"] = {
		["title"] = "Play for <font color=\"rgb(%s)\">%s</font>",
		["requirement"] = 1800,
		["formatStat"] = function(p2)
			local v3 = p2 / 3600
			local v4 = math.floor(v3)
			local v5 = p2 / 60 % 60
			local v6 = math.floor(v5)
			if v4 == 0 then
				return string.format("%sm", v6)
			elseif v6 == 0 then
				return string.format("%sh", v4)
			else
				return string.format("%sh %sm", v4, v6)
			end
		end
	},
	["atms"] = {
		["title"] = "Rob <font color=\"rgb(%s)\">%s ATM%s</font>",
		["requirement"] = 10,
		["formatStat"] = function(p7)
			return p7
		end
	},
	["bank"] = {
		["title"] = "Rob <font color=\"rgb(%s)\">Bank %s Time%s</font>",
		["requirement"] = 2,
		["formatStat"] = function(p8)
			return p8
		end
	},
	["gems"] = {
		["title"] = "Rob <font color=\"rgb(%s)\">%s Gem%s</font>",
		["requirement"] = 12,
		["formatStat"] = function(p9)
			return p9
		end
	},
	["safes"] = {
		["title"] = "Crack <font color=\"rgb(%s)\">%s Safe%s</font>",
		["requirement"] = 5,
		["formatStat"] = function(p10)
			return p10
		end
	}
}
v1.quests = v11
return v1