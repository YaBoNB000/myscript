-- Season7 (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > clanSeasons
-- Original

local v1 = {
	["endingTime"] = DateTime.fromUniversalTime(2024, 3, 8, 21, 0, 0).UnixTimestamp
}
local v2 = {}
local v3 = {
	["cashPot"] = 20000000,
	["skins"] = {
		{
			["gunName"] = "Minigun",
			["skinName"] = "Emerald"
		},
		{
			["gunName"] = "AUG",
			["skinName"] = "Emerald"
		}
	},
	["furniture"] = {
		{
			["furnitureName"] = "DiamondStatue"
		}
	}
}
local v4 = {
	["cashPot"] = 15000000,
	["skins"] = {
		{
			["gunName"] = "Tommy Gun",
			["skinName"] = "Emerald"
		},
		{
			["gunName"] = "M249 SAW",
			["skinName"] = "Emerald"
		}
	},
	["furniture"] = {
		{
			["furnitureName"] = "DiamondStatue"
		}
	}
}
local v5 = {
	["cashPot"] = 10000000,
	["skins"] = {
		{
			["gunName"] = "M4A1",
			["skinName"] = "Emerald"
		},
		{
			["gunName"] = "Dragunov",
			["skinName"] = "Emerald"
		}
	},
	["furniture"] = {
		{
			["furnitureName"] = "DiamondStatue"
		}
	}
}
local v6 = {
	["cashPot"] = 8000000,
	["skins"] = {
		{
			["gunName"] = "MP7",
			["skinName"] = "Emerald"
		},
		{
			["gunName"] = "Riot Shield",
			["skinName"] = "Emerald"
		}
	},
	["furniture"] = {
		{
			["furnitureName"] = "DiamondStatue"
		}
	}
}
local v7 = {
	["cashPot"] = 7500000,
	["skins"] = {
		{
			["gunName"] = "Saiga 12",
			["skinName"] = "Emerald"
		},
		{
			["gunName"] = "Sawn Off",
			["skinName"] = "Emerald"
		}
	},
	["furniture"] = {
		{
			["furnitureName"] = "DiamondStatue"
		}
	}
}
local v8 = {
	["cashPot"] = 7000000,
	["skins"] = {
		{
			["gunName"] = "M1911",
			["skinName"] = "Emerald"
		}
	}
}
local v9 = {
	["cashPot"] = 6500000,
	["skins"] = {
		{
			["gunName"] = "M1911",
			["skinName"] = "Emerald"
		}
	}
}
local v10 = {
	["cashPot"] = 6000000,
	["skins"] = {
		{
			["gunName"] = "M1911",
			["skinName"] = "Emerald"
		}
	}
}
local v11 = {
	["cashPot"] = 5500000,
	["skins"] = {
		{
			["gunName"] = "M1911",
			["skinName"] = "Emerald"
		}
	}
}
local v12 = {
	["cashPot"] = 5000000,
	["skins"] = {
		{
			["gunName"] = "M1911",
			["skinName"] = "Emerald"
		}
	}
}
local v13 = {
	["cashPot"] = 2000000,
	["displayText"] = "11. - 15.",
	["skins"] = {
		{
			["gunName"] = "Minigun",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "AUG",
			["skinName"] = "Bronze"
		}
	}
}
local v14 = {
	["cashPot"] = 1000000,
	["displayText"] = "16. - 20.",
	["skins"] = {
		{
			["gunName"] = "Tommy Gun",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "M249 SAW",
			["skinName"] = "Bronze"
		}
	}
}
local v15 = {
	["cashPot"] = 250000,
	["displayText"] = "21. - 40.",
	["skins"] = {
		{
			["gunName"] = "M4A1",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "Dragunov",
			["skinName"] = "Bronze"
		}
	}
}
local v16 = {
	["cashPot"] = 100000,
	["displayText"] = "41. - 100.",
	["skins"] = {
		{
			["gunName"] = "Saiga 12",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "Sawn Off",
			["skinName"] = "Bronze"
		}
	}
}
local v17 = {
	["cashPot"] = 50000,
	["displayText"] = "101. - 200.",
	["skins"] = {
		{
			["gunName"] = "M1911",
			["skinName"] = "Bronze"
		}
	}
}
__set_list(v2, 1, {v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17})
v1.rewards = v2
return v1