-- Season1 (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies > clanSeasons
-- Original

local v1 = {
	["endingTime"] = DateTime.fromUniversalTime(2023, 12, 15, 20, 57, 0).UnixTimestamp
}
local v2 = {}
local v3 = {
	["cashPot"] = 20000000,
	["skins"] = {
		{
			["gunName"] = "RPG",
			["skinName"] = "Diamond"
		},
		{
			["gunName"] = "Barrett M107",
			["skinName"] = "Diamond"
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
			["gunName"] = "Scar L",
			["skinName"] = "Diamond"
		},
		{
			["gunName"] = "AS Val",
			["skinName"] = "Diamond"
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
			["gunName"] = "Deagle",
			["skinName"] = "Diamond"
		},
		{
			["gunName"] = "Python",
			["skinName"] = "Diamond"
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
			["gunName"] = "Mossberg",
			["skinName"] = "Diamond"
		},
		{
			["gunName"] = "Double Barrel",
			["skinName"] = "Diamond"
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
			["gunName"] = "Mossberg",
			["skinName"] = "Diamond"
		},
		{
			["gunName"] = "Double Barrel",
			["skinName"] = "Diamond"
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
			["gunName"] = "Glock",
			["skinName"] = "Diamond"
		}
	}
}
local v9 = {
	["cashPot"] = 6500000,
	["skins"] = {
		{
			["gunName"] = "Glock",
			["skinName"] = "Diamond"
		}
	}
}
local v10 = {
	["cashPot"] = 6000000,
	["skins"] = {
		{
			["gunName"] = "Glock",
			["skinName"] = "Diamond"
		}
	}
}
local v11 = {
	["cashPot"] = 5500000,
	["skins"] = {
		{
			["gunName"] = "Glock",
			["skinName"] = "Diamond"
		}
	}
}
local v12 = {
	["cashPot"] = 5000000,
	["skins"] = {
		{
			["gunName"] = "Glock",
			["skinName"] = "Diamond"
		}
	}
}
local v13 = {
	["cashPot"] = 2000000,
	["displayText"] = "11. - 15.",
	["skins"] = {
		{
			["gunName"] = "RPG",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "Barrett M107",
			["skinName"] = "Bronze"
		}
	}
}
local v14 = {
	["cashPot"] = 1000000,
	["displayText"] = "16. - 20.",
	["skins"] = {
		{
			["gunName"] = "Scar L",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "AS Val",
			["skinName"] = "Bronze"
		}
	}
}
local v15 = {
	["cashPot"] = 250000,
	["displayText"] = "21. - 40.",
	["skins"] = {
		{
			["gunName"] = "Deagle",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "Python",
			["skinName"] = "Bronze"
		}
	}
}
local v16 = {
	["cashPot"] = 100000,
	["displayText"] = "41. - 100.",
	["skins"] = {
		{
			["gunName"] = "Mossberg",
			["skinName"] = "Bronze"
		},
		{
			["gunName"] = "Double Barrel",
			["skinName"] = "Bronze"
		}
	}
}
local v17 = {
	["cashPot"] = 50000,
	["displayText"] = "101. - 200.",
	["skins"] = {
		{
			["gunName"] = "Glock",
			["skinName"] = "Bronze"
		}
	}
}
__set_list(v2, 1, {v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17})
v1.rewards = v2
return v1