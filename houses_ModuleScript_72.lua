-- houses (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = {}
local v2 = {}
local v3 = {
	["name"] = "DefaultHouse",
	["displayName"] = "Starter House",
	["price"] = 0,
	["furnitureLimit"] = 35,
	["displayOrder"] = 1,
	["defaultColors"] = {
		["exterior"] = "orange",
		["accent"] = "brown",
		["interior"] = "grey"
	}
}
v2.DefaultHouse = v3
local v4 = {
	["name"] = "Tier2House",
	["displayName"] = "Medium House",
	["price"] = 10000,
	["furnitureLimit"] = 50,
	["displayOrder"] = 2,
	["defaultColors"] = {
		["exterior"] = "orange",
		["accent"] = "brown",
		["interior"] = "grey"
	}
}
v2.Tier2House = v4
local v5 = {
	["name"] = "Tier3House",
	["displayName"] = "Big House",
	["price"] = 200000,
	["furnitureLimit"] = 100,
	["displayOrder"] = 3,
	["defaultColors"] = {
		["exterior"] = "orange",
		["accent"] = "brown",
		["interior"] = "grey"
	}
}
v2.Tier3House = v5
local v6 = {
	["name"] = "Tier4House",
	["displayName"] = "Huge House",
	["price"] = 400000,
	["furnitureLimit"] = 125,
	["displayOrder"] = 4,
	["defaultColors"] = {
		["exterior"] = "flint",
		["exterior2"] = "brown",
		["accent"] = "brown",
		["accent2"] = "black",
		["interior"] = "grey"
	}
}
v2.Tier4House = v6
local v7 = {
	["name"] = "Tier5House",
	["displayName"] = "Mansion",
	["price"] = 1000000,
	["furnitureLimit"] = 180,
	["displayOrder"] = 5,
	["defaultColors"] = {
		["exterior"] = "silver",
		["exterior2"] = "flint",
		["accent"] = "black",
		["accent2"] = "brown",
		["interior"] = "grey"
	}
}
v2.Tier5House = v7
local v8 = {
	["name"] = "Tier6House",
	["displayName"] = "Modern Mansion",
	["price"] = 3500000,
	["furnitureLimit"] = 200,
	["displayOrder"] = 6,
	["defaultColors"] = {
		["exterior"] = "silver",
		["exterior2"] = "taupe",
		["accent"] = "black",
		["accent2"] = "veryblack",
		["accent3"] = "brown",
		["interior"] = "lightgrey"
	}
}
v2.Tier6House = v8
local v9 = {
	["name"] = "HauntedMansion",
	["displayName"] = "Haunted Mansion",
	["furnitureLimit"] = 200,
	["displayOrder"] = 11,
	["price"] = 6000000,
	["offsale"] = true,
	["defaultColors"] = {
		["exterior"] = "darktaupe",
		["exterior2"] = "darktaupe",
		["accent"] = "greenishbrown",
		["accent2"] = "greenishbrown",
		["accent3"] = "black",
		["interior"] = "greenishbrown"
	}
}
v2.HauntedMansion = v9
local v10 = {
	["name"] = "NightmareHouse",
	["displayName"] = "Nightmare House",
	["furnitureLimit"] = 200,
	["displayOrder"] = 10,
	["price"] = 4500000,
	["offsale"] = true,
	["defaultColors"] = {
		["exterior"] = "purpleblack",
		["accent"] = "veryblack",
		["accent2"] = "lavender",
		["interior"] = "purpleblack"
	}
}
v2.NightmareHouse = v10
local v11 = {
	["name"] = "PumpkinCottage",
	["displayName"] = "Pumpkin Cottage",
	["furnitureLimit"] = 200,
	["displayOrder"] = 14,
	["candyPrice"] = 500000,
	["price"] = 99999999,
	["offsale"] = true,
	["defaultColors"] = {
		["exterior"] = "orange",
		["exterior2"] = "flint",
		["accent"] = "black",
		["accent2"] = "silver",
		["accent3"] = "veryorange"
	}
}
v2.PumpkinCottage = v11
local v12 = {
	["name"] = "GingerbreadHouse",
	["displayName"] = "Gingerbread House",
	["furnitureLimit"] = 200,
	["displayOrder"] = 15,
	["gingerbreadPrice"] = 500000,
	["price"] = 99999999,
	["offsale"] = true,
	["defaultColors"] = {
		["exterior"] = "gold",
		["exterior2"] = "brown",
		["accent"] = "darkspringgreen",
		["accent2"] = "veryred",
		["accent3"] = "gold",
		["interior"] = "sandyellow"
	}
}
v2.GingerbreadHouse = v12
local v13 = {
	["name"] = "FrozenCastle",
	["displayName"] = "Frozen Castle",
	["price"] = 4500000,
	["gingerbreadPrice"] = 1000000,
	["furnitureLimit"] = 200,
	["displayOrder"] = 13,
	["defaultColors"] = {
		["exterior"] = "lightBluishViolet",
		["exterior2"] = "lightRoyalBlue",
		["accent"] = "babyBlue",
		["accent2"] = "institutionalWhite",
		["accent3"] = "mediumblueviolet",
		["interior"] = "institutionalWhite"
	}
}
v2.FrozenCastle = v13
local v14 = {
	["name"] = "LogCabin",
	["displayName"] = "Log Cabin",
	["furnitureLimit"] = 200,
	["displayOrder"] = 8,
	["price"] = 6000000,
	["defaultColors"] = {
		["exterior"] = "orange",
		["exterior2"] = "brown",
		["accent"] = "brown",
		["accent2"] = "brown",
		["accent3"] = "veryblack",
		["interior"] = "orange"
	}
}
v2.LogCabin = v14
local v15 = {
	["name"] = "PirateHouse",
	["displayName"] = "Pirate Base",
	["furnitureLimit"] = 200,
	["displayOrder"] = 9,
	["price"] = 3500000,
	["defaultColors"] = {
		["exterior"] = "silver",
		["exterior2"] = "taupe",
		["accent"] = "taupe",
		["accent2"] = "blue",
		["accent3"] = "brown",
		["interior"] = "lightgrey"
	}
}
v2.PirateHouse = v15
local v16 = {
	["name"] = "Temple",
	["displayName"] = "Temple",
	["furnitureLimit"] = 200,
	["displayOrder"] = 15,
	["price"] = 35000000000,
	["offsale"] = true,
	["defaultColors"] = {
		["exterior"] = "linen",
		["exterior2"] = "cacao",
		["accent"] = "crimson",
		["accent2"] = "curry",
		["accent3"] = "black",
		["interior"] = "slimegreen"
	}
}
v2.Temple = v16
v1.models = v2
local v17 = {
	["price"] = 600000,
	["furnitureLimit"] = 100,
	["roomFurnitureLimit"] = 30,
	["upgrades"] = {},
	["defaultColors"] = {
		["exterior"] = "black",
		["exterior2"] = "darktaupe",
		["accent"] = "flint",
		["accent2"] = "darktaupe",
		["interior"] = "taupe"
	}
}
v1.clanBase = v17
v1.swatches = {
	["orange"] = Color3.fromRGB(106, 71, 57),
	["brown"] = Color3.fromRGB(62, 47, 39),
	["black"] = Color3.fromRGB(47, 47, 47),
	["veryblack"] = Color3.fromRGB(39, 39, 39),
	["lightgrey"] = Color3.fromRGB(173, 173, 173),
	["grey"] = Color3.fromRGB(153, 145, 142),
	["flint"] = Color3.fromRGB(112, 101, 88),
	["silver"] = Color3.fromRGB(141, 141, 141),
	["red"] = Color3.fromRGB(106, 38, 38),
	["gold"] = Color3.fromRGB(168, 125, 52),
	["blue"] = Color3.fromRGB(113, 140, 168),
	["pink"] = Color3.fromRGB(164, 130, 168),
	["sandyellow"] = Color3.fromRGB(140, 131, 116),
	["taupe"] = Color3.fromRGB(93, 76, 66),
	["darktaupe"] = Color3.fromRGB(77, 73, 69),
	["greenishbrown"] = Color3.fromRGB(56, 51, 47),
	["lavender"] = Color3.fromRGB(67, 59, 94),
	["purpleblack"] = Color3.fromRGB(52, 47, 61),
	["green"] = Color3.fromRGB(35, 201, 6),
	["earthgreen"] = Color3.fromRGB(16, 105, 0),
	["hotpink"] = Color3.fromRGB(191, 0, 255),
	["purple"] = Color3.fromRGB(99, 7, 166),
	["babyblue"] = Color3.fromRGB(0, 162, 255),
	["veryred"] = Color3.fromRGB(250, 69, 32),
	["lightRoyalBlue"] = Color3.fromRGB(152, 183, 255),
	["lightBluishViolet"] = Color3.fromRGB(191, 211, 222),
	["babyBlue"] = Color3.fromRGB(158, 208, 222),
	["institutionalWhite"] = Color3.fromRGB(255, 255, 255),
	["reallyBlack"] = Color3.fromRGB(0, 0, 0),
	["firebrick"] = Color3.fromRGB(187, 37, 40),
	["darkspringgreen"] = Color3.fromRGB(20, 107, 58),
	["mediumblueviolet"] = Color3.fromRGB(92, 119, 149),
	["veryorange"] = Color3.fromRGB(235, 150, 101),
	["darkmaroon"] = Color3.fromRGB(54, 0, 0)
}
return v1