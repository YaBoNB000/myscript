-- halloweenQuests (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > Halloween
-- Original

local v1 = game:GetService("ReplicatedStorage")
require(v1.devv).load("commavalue")
local v2 = {}
local v4 = {
	["title"] = "Smash <font color=\"rgb(%s)\">%s Pumpkin%s</font>",
	["formatStat"] = function(p3)
		return p3
	end,
	["tiers"] = {
		{
			["requirement"] = 3,
			["candy"] = 1200
		},
		{
			["requirement"] = 5,
			["candy"] = 2000
		},
		{
			["requirement"] = 10,
			["candy"] = 4000
		}
	}
}
v2.pumpkins = v4
local v6 = {
	["title"] = "Kill <font color=\"rgb(%s)\">%s Ghost%s</font>",
	["formatStat"] = function(p5)
		return p5
	end,
	["tiers"] = {
		{
			["requirement"] = 2,
			["candy"] = 1200
		},
		{
			["requirement"] = 5,
			["candy"] = 3200
		},
		{
			["requirement"] = 8,
			["candy"] = 6000
		}
	}
}
v2.ghosts = v6
local v8 = {
	["title"] = "Rob <font color=\"rgb(%s)\">%s ATM%s</font>",
	["formatStat"] = function(p7)
		return p7
	end,
	["tiers"] = {
		{
			["requirement"] = 5,
			["candy"] = 2400
		},
		{
			["requirement"] = 10,
			["candy"] = 6000
		}
	}
}
v2.atms = v8
local v10 = {
	["title"] = "Buy <font color=\"rgb(%s)\">%s Furniture</font>",
	["formatStat"] = function(p9)
		return p9
	end,
	["tiers"] = {
		{
			["requirement"] = 10,
			["candy"] = 800
		},
		{
			["requirement"] = 25,
			["candy"] = 2800
		}
	}
}
v2.furniture = v10
local v16 = {
	["title"] = "Play for <font color=\"rgb(%s)\">%s</font>",
	["formatStat"] = function(p11)
		local v12 = p11 / 3600
		local v13 = math.floor(v12)
		local v14 = p11 / 60 % 60
		local v15 = math.floor(v14)
		if v13 == 0 then
			return string.format("%sm", v15)
		elseif v15 == 0 then
			return string.format("%sh", v13)
		else
			return string.format("%sh %sm", v13, v15)
		end
	end,
	["tiers"] = {
		{
			["requirement"] = 900,
			["candy"] = 6400
		},
		{
			["requirement"] = 1800,
			["candy"] = 12800
		},
		{
			["requirement"] = 2700,
			["candy"] = 20000
		},
		{
			["requirement"] = 3600,
			["candy"] = 28000
		}
	}
}
v2.playtime = v16
local v18 = {
	["title"] = "Open <font color=\"rgb(%s)\">%s case%s</font>",
	["formatStat"] = function(p17)
		return p17
	end,
	["tiers"] = {
		{
			["requirement"] = 1,
			["candy"] = 2000
		},
		{
			["requirement"] = 5,
			["candy"] = 10000
		},
		{
			["requirement"] = 10,
			["candy"] = 20000
		}
	}
}
v2.cases = v18
local v20 = {
	["title"] = "Rob <font color=\"rgb(%s)\">Bank %s Time%s</font>",
	["formatStat"] = function(p19)
		return p19
	end,
	["tiers"] = {
		{
			["requirement"] = 1,
			["candy"] = 6000
		},
		{
			["requirement"] = 3,
			["candy"] = 19200
		}
	}
}
v2.bank = v20
local v22 = {
	["title"] = "Rob <font color=\"rgb(%s)\">%s Gem%s</font>",
	["formatStat"] = function(p21)
		return p21
	end,
	["tiers"] = {
		{
			["requirement"] = 5,
			["candy"] = 2000
		},
		{
			["requirement"] = 10,
			["candy"] = 3200
		},
		{
			["requirement"] = 15,
			["candy"] = 6400
		}
	}
}
v2.gems = v22
local v24 = {
	["title"] = "Rob <font color=\"rgb(%s)\">%s Ring%s</font>",
	["formatStat"] = function(p23)
		return p23
	end,
	["tiers"] = {
		{
			["requirement"] = 10,
			["candy"] = 1200
		},
		{
			["requirement"] = 15,
			["candy"] = 2000
		},
		{
			["requirement"] = 20,
			["candy"] = 2560
		}
	}
}
v2.rings = v24
local v26 = {
	["title"] = "Crack <font color=\"rgb(%s)\">%s Safe%s</font>",
	["formatStat"] = function(p25)
		return p25
	end,
	["tiers"] = {
		{
			["requirement"] = 3,
			["candy"] = 4000
		},
		{
			["requirement"] = 5,
			["candy"] = 6400
		},
		{
			["requirement"] = 10,
			["candy"] = 12000
		},
		{
			["requirement"] = 15,
			["candy"] = 20000
		}
	}
}
v2.safes = v26
local v28 = {
	["title"] = "Place <font color=\"rgb(%s)\">%s Halloween Furniture</font>",
	["oneTime"] = true,
	["formatStat"] = function(p27)
		return p27
	end,
	["tiers"] = {
		{
			["requirement"] = 10,
			["candy"] = 5000
		}
	}
}
v2.halloweenFurniture = v28
return v2