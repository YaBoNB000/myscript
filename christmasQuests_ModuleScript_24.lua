-- christmasQuests (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > Christmas
-- Original

local v1 = game:GetService("ReplicatedStorage")
require(v1.devv).load("commavalue")
local v2 = {}
local v4 = {
	["title"] = "Smash <font color=\"rgb(%s)\">%s Present%s</font>",
	["formatStat"] = function(p3)
		return p3
	end,
	["tiers"] = {
		{
			["requirement"] = 3,
			["gingerbread"] = 1200
		},
		{
			["requirement"] = 5,
			["gingerbread"] = 2000
		}
	}
}
v2.presents = v4
local v6 = {
	["title"] = "Rob <font color=\"rgb(%s)\">%s ATM%s</font>",
	["formatStat"] = function(p5)
		return p5
	end,
	["tiers"] = {
		{
			["requirement"] = 5,
			["gingerbread"] = 2400
		},
		{
			["requirement"] = 10,
			["gingerbread"] = 6000
		}
	}
}
v2.atms = v6
local v8 = {
	["title"] = "Buy <font color=\"rgb(%s)\">%s Furniture</font>",
	["formatStat"] = function(p7)
		return p7
	end,
	["tiers"] = {
		{
			["requirement"] = 10,
			["gingerbread"] = 800
		},
		{
			["requirement"] = 25,
			["gingerbread"] = 2800
		}
	}
}
v2.furniture = v8
local v14 = {
	["title"] = "Play for <font color=\"rgb(%s)\">%s</font>",
	["formatStat"] = function(p9)
		local v10 = p9 / 3600
		local v11 = math.floor(v10)
		local v12 = p9 / 60 % 60
		local v13 = math.floor(v12)
		if v11 == 0 then
			return string.format("%sm", v13)
		elseif v13 == 0 then
			return string.format("%sh", v11)
		else
			return string.format("%sh %sm", v11, v13)
		end
	end,
	["tiers"] = {
		{
			["requirement"] = 900,
			["gingerbread"] = 6400
		},
		{
			["requirement"] = 1800,
			["gingerbread"] = 12000
		},
		{
			["requirement"] = 2700,
			["gingerbread"] = 16000
		},
		{
			["requirement"] = 3600,
			["gingerbread"] = 28000
		}
	}
}
v2.playtime = v14
local v16 = {
	["title"] = "Open <font color=\"rgb(%s)\">%s case%s</font>",
	["formatStat"] = function(p15)
		return p15
	end,
	["tiers"] = {
		{
			["requirement"] = 1,
			["gingerbread"] = 2000
		},
		{
			["requirement"] = 2,
			["gingerbread"] = 10000
		},
		{
			["requirement"] = 3,
			["gingerbread"] = 20000
		}
	}
}
v2.cases = v16
local v18 = {
	["title"] = "Rob <font color=\"rgb(%s)\">Bank %s Time%s</font>",
	["formatStat"] = function(p17)
		return p17
	end,
	["tiers"] = {
		{
			["requirement"] = 1,
			["gingerbread"] = 6000
		},
		{
			["requirement"] = 3,
			["gingerbread"] = 19200
		}
	}
}
v2.bank = v18
local v20 = {
	["title"] = "Rob <font color=\"rgb(%s)\">%s Gem%s</font>",
	["formatStat"] = function(p19)
		return p19
	end,
	["tiers"] = {
		{
			["requirement"] = 5,
			["gingerbread"] = 2000
		},
		{
			["requirement"] = 10,
			["gingerbread"] = 3200
		},
		{
			["requirement"] = 15,
			["gingerbread"] = 6400
		}
	}
}
v2.gems = v20
local v22 = {
	["title"] = "Rob <font color=\"rgb(%s)\">%s Ring%s</font>",
	["formatStat"] = function(p21)
		return p21
	end,
	["tiers"] = {
		{
			["requirement"] = 10,
			["gingerbread"] = 1200
		},
		{
			["requirement"] = 15,
			["gingerbread"] = 2000
		},
		{
			["requirement"] = 20,
			["gingerbread"] = 2560
		}
	}
}
v2.rings = v22
local v24 = {
	["title"] = "Crack <font color=\"rgb(%s)\">%s Safe%s</font>",
	["formatStat"] = function(p23)
		return p23
	end,
	["tiers"] = {
		{
			["requirement"] = 3,
			["gingerbread"] = 4000
		},
		{
			["requirement"] = 5,
			["gingerbread"] = 8000
		},
		{
			["requirement"] = 10,
			["gingerbread"] = 20000
		}
	}
}
v2.safes = v24
local v26 = {
	["title"] = "Place <font color=\"rgb(%s)\">%s Christmas Furniture</font>",
	["oneTime"] = true,
	["formatStat"] = function(p25)
		return p25
	end,
	["tiers"] = {
		{
			["requirement"] = 10,
			["gingerbread"] = 5000
		}
	}
}
v2.christmasFurniture = v26
return v2