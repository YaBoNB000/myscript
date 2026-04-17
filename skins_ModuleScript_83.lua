-- skins (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v_u_3 = v2("LimitedEvents")
v2("globals")
local v_u_4 = {}
local v_u_5 = {}
local v_u_6 = {
	["compatabilities"] = {
		["Generic"] = {
			"AK-47",
			"AR-15",
			"AS Val",
			"AUG",
			"AWP",
			"Barrett M107",
			"Deagle",
			"Double Barrel",
			"Dragunov",
			"Flamethrower",
			"Glock",
			"Glock 18",
			"M1911",
			"M249 SAW",
			"M4A1",
			"Minigun",
			"MP7",
			"Mossberg",
			"M1 Garand",
			"P90",
			"Python",
			"Raygun",
			"RPG",
			"Riot Shield",
			"RPK",
			"Saiga 12",
			"Scar L",
			"SPAS-12",
			"FN FAL",
			"Sawn Off",
			"Stagecoach",
			"Tommy Gun",
			"USP 45",
			"Uzi"
		}
	}
}
local v7 = {}
local v8 = {
	["displayName"] = "Series 3 Light",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 2,
	["cashPrice"] = 10000,
	["eventName"] = -1,
	["isRegular"] = true,
	["contents"] = {
		"Oakwood",
		"Cherrywood",
		"Snow Camo",
		"Pink Camo",
		"Woodland Camo",
		"Mosaic",
		"Carbon Fiber",
		"Binary Code",
		"Pink Hex",
		"Orange Hex",
		"Frigid Tigerprint",
		"Orange Tigerprint",
		"Maze",
		"Trippy",
		"Rainbow Tigerprint",
		"Toxic Matter",
		"Inferno Matter",
		"Cursed Matter",
		"Crimson Blood",
		"Void Reaper"
	},
	["compatabilities"] = {
		"M1911",
		"Glock",
		"USP 45",
		"Python",
		"Deagle",
		"Uzi",
		"Double Barrel",
		"Sawn Off",
		"Glock 18",
		"Stagecoach",
		"Mossberg",
		"Riot Shield"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.Series3Light = v8
local v9 = {
	["displayName"] = "Series 3 Heavy",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 1,
	["cashPrice"] = 20000,
	["eventName"] = -1,
	["isRegular"] = true,
	["contents"] = {
		"Oakwood",
		"Cherrywood",
		"Snow Camo",
		"Pink Camo",
		"Woodland Camo",
		"Mosaic",
		"Carbon Fiber",
		"Binary Code",
		"Pink Hex",
		"Orange Hex",
		"Frigid Tigerprint",
		"Orange Tigerprint",
		"Maze",
		"Trippy",
		"Rainbow Tigerprint",
		"Toxic Matter",
		"Inferno Matter",
		"Cursed Matter",
		"Crimson Blood",
		"Void Reaper",
		"Cannon",
		"Gold Cannon"
	},
	["compatabilities"] = {
		"AK-47",
		"AR-15",
		"AS Val",
		"AUG",
		"Barrett M107",
		"Dragunov",
		"Flamethrower",
		"M249 SAW",
		"Scar L",
		"SPAS-12",
		"M4A1",
		"MP7",
		"RPG",
		"RPK",
		"AWP",
		"Saiga 12",
		"Tommy Gun",
		"Raygun",
		"Minigun",
		"P90",
		"M1 Garand",
		"FN FAL"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.Series3Heavy = v9
local v10 = {
	["displayName"] = "Series 2 Light",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 4,
	["cashPrice"] = 10000,
	["eventName"] = -1,
	["isRegular"] = true,
	["contents"] = {
		"Blue Oceano",
		"Red Oceano",
		"Green Oceano",
		"Pink Oceano",
		"Aztec",
		"Butterfly",
		"Tidal",
		"Venetian",
		"Flower",
		"CADPAT",
		"Zebra",
		"Caution Tape",
		"Orange Swirl",
		"Pathfinder",
		"Hazy",
		"Skull",
		"Electric Hive",
		"Pink Ivy",
		"Aqua Ivy",
		"Gold Ivy",
		"Icefire",
		"Dark Matter S2",
		"Anti Matter S2"
	},
	["compatabilities"] = {
		"M1911",
		"Glock",
		"USP 45",
		"Python",
		"Deagle",
		"Uzi",
		"Double Barrel",
		"Sawn Off",
		"Glock 18",
		"Stagecoach",
		"Mossberg",
		"Riot Shield"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.Series2Light = v10
local v11 = {
	["displayName"] = "Series 2 Heavy",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 3,
	["cashPrice"] = 20000,
	["eventName"] = -1,
	["isRegular"] = true,
	["contents"] = {
		"Blue Oceano",
		"Red Oceano",
		"Green Oceano",
		"Pink Oceano",
		"Aztec",
		"Butterfly",
		"Tidal",
		"Venetian",
		"Flower",
		"CADPAT",
		"Zebra",
		"Caution Tape",
		"Orange Swirl",
		"Pathfinder",
		"Hazy",
		"Skull",
		"Electric Hive",
		"Pink Ivy",
		"Aqua Ivy",
		"Gold Ivy",
		"Icefire",
		"Dark Matter S2",
		"Anti Matter S2"
	},
	["compatabilities"] = {
		"AK-47",
		"AR-15",
		"AS Val",
		"AUG",
		"Barrett M107",
		"Dragunov",
		"Flamethrower",
		"M249 SAW",
		"Scar L",
		"M4A1",
		"MP7",
		"RPG",
		"RPK",
		"AWP",
		"Saiga 12",
		"SPAS-12",
		"Tommy Gun",
		"Raygun",
		"Minigun",
		"P90",
		"M1 Garand",
		"FN FAL"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.Series2Heavy = v11
local v12 = {
	["displayName"] = "Series 1 Light",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 6,
	["cashPrice"] = 10000,
	["eventName"] = -1,
	["isRegular"] = true,
	["contents"] = {
		"Ashen",
		"Rusty",
		"Frozen",
		"Stone",
		"Blue Gumball",
		"Pink Gumball",
		"Icicle",
		"Honeycomb",
		"Orange Tigerstripe",
		"Blue Tigerstripe",
		"Magma",
		"Red Topographic",
		"Hacker",
		"Buzzkill",
		"Cosmic",
		"Rainbow",
		"Underworld",
		"Neon",
		"Dark Matter",
		"Anti Matter"
	},
	["compatabilities"] = {
		"M1911",
		"Glock",
		"USP 45",
		"Python",
		"Deagle",
		"Uzi",
		"Double Barrel",
		"Sawn Off",
		"Glock 18",
		"Stagecoach",
		"Mossberg",
		"Riot Shield"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.SmallArms = v12
local v13 = {
	["displayName"] = "Series 1 Heavy",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 5,
	["cashPrice"] = 20000,
	["eventName"] = -1,
	["isRegular"] = true,
	["contents"] = {
		"Ashen",
		"Rusty",
		"Frozen",
		"Stone",
		"Blue Gumball",
		"Pink Gumball",
		"Icicle",
		"Honeycomb",
		"Orange Tigerstripe",
		"Blue Tigerstripe",
		"Magma",
		"Red Topographic",
		"Hacker",
		"Buzzkill",
		"Cosmic",
		"Rainbow",
		"Underworld",
		"Neon",
		"Dark Matter",
		"Anti Matter"
	},
	["compatabilities"] = {
		"AK-47",
		"AR-15",
		"AS Val",
		"AUG",
		"Barrett M107",
		"Dragunov",
		"Flamethrower",
		"M249 SAW",
		"Scar L",
		"M4A1",
		"MP7",
		"RPG",
		"RPK",
		"AWP",
		"Saiga 12",
		"SPAS-12",
		"Tommy Gun",
		"Raygun",
		"Minigun",
		"P90",
		"M1 Garand",
		"FN FAL"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.HeavyWeapons = v13
local v14 = {
	["displayName"] = "Firework Case",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = -2,
	["cashPrice"] = 10000,
	["eventName"] = "July4th2025",
	["contents"] = {
		"Neon Red",
		"Neon White",
		"Neon Blue",
		"Peace",
		"TNT",
		"Burger",
		"Prismatic",
		"Murica",
		"Sparkler",
		"Rainbow Firework",
		"Solid Gold Tactical S2"
	},
	["compatabilities"] = {
		"AK-47",
		"AR-15",
		"AS Val",
		"AUG",
		"AWP",
		"Barrett M107",
		"Deagle",
		"Double Barrel",
		"Dragunov",
		"Flamethrower",
		"Glock",
		"Glock 18",
		"M1911",
		"M249 SAW",
		"M4A1",
		"Minigun",
		"MP7",
		"Mossberg",
		"M1 Garand",
		"P90",
		"Python",
		"Raygun",
		"RPG",
		"Riot Shield",
		"RPK",
		"Saiga 12",
		"Scar L",
		"FN FAL",
		"Sawn Off",
		"Stagecoach",
		"Tommy Gun",
		"USP 45",
		"Uzi"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.Firework = v14
local v15 = {
	["displayName"] = "July 4th Case",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 1,
	["cashPrice"] = 10000,
	["eventName"] = "July4th",
	["contents"] = {
		"Red",
		"White",
		"Blue",
		"USA",
		"Firework",
		"Starry",
		"Hotdog",
		"Freedom"
	},
	["compatabilities"] = {
		"M1911",
		"Glock",
		"USP 45",
		"Python",
		"Deagle",
		"Uzi",
		"Double Barrel",
		"Sawn Off",
		"Glock 18",
		"Stagecoach",
		"Mossberg",
		"Riot Shield",
		"AK-47",
		"AR-15",
		"AS Val",
		"AUG",
		"Barrett M107",
		"Dragunov",
		"Flamethrower",
		"M249 SAW",
		"M4A1",
		"MP7",
		"RPG",
		"RPK",
		"Saiga 12",
		"Tommy Gun",
		"Raygun"
	},
	["chances"] = {
		["Common"] = 0.625,
		["Rare"] = 0.3,
		["Epic"] = 0.04,
		["Mythic"] = 0.015,
		["Legendary"] = 0.0035
	}
}
v7.America = v15
local v16 = {
	["displayName"] = "Halloween Case",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 1,
	["candyPrice"] = 10000,
	["eventName"] = "Halloween",
	["contents"] = {
		"BOO",
		"Spidey",
		"Blood Ghost",
		"Radioactive",
		"Ethereal",
		"Spectral",
		"Holy Fire",
		"Fallout",
		"Bloody Heart",
		"Atomic Pumpkin"
	},
	["compatabilities"] = {
		"M1911",
		"Glock",
		"USP 45",
		"Python",
		"Deagle",
		"Uzi",
		"Double Barrel",
		"Sawn Off",
		"Glock 18",
		"Stagecoach",
		"Mossberg",
		"Riot Shield",
		"AK-47",
		"AR-15",
		"AS Val",
		"AUG",
		"Barrett M107",
		"Dragunov",
		"Flamethrower",
		"M249 SAW",
		"M4A1",
		"MP7",
		"RPG",
		"RPK",
		"Saiga 12",
		"Scar L",
		"Tommy Gun",
		"Raygun",
		"Minigun",
		"P90",
		"M1 Garand",
		"AWP",
		"FN FAL"
	},
	["chances"] = {
		["Epic"] = 1,
		["Mythic"] = 0.35,
		["Legendary"] = 0.075
	}
}
v7.Halloween = v16
local v17 = {
	["displayName"] = "Christmas Case",
	["animId"] = "rbxassetid://12947868715",
	["displayOrder"] = 0,
	["gingerbreadPrice"] = 10000,
	["eventName"] = "Christmas",
	["contents"] = {
		"Snowman",
		"Blue Ghost",
		"Merry Wraps",
		"Holy",
		"Frosty Gift",
		"Frozen Amethyst",
		"Christmas Nightmare",
		"Mystic Ice",
		"Snowglobe",
		"Peppercane",
		"Mistletoe"
	},
	["compatabilities"] = {
		"M1911",
		"Glock",
		"USP 45",
		"Python",
		"Deagle",
		"Uzi",
		"Double Barrel",
		"Sawn Off",
		"Glock 18",
		"Stagecoach",
		"Mossberg",
		"Riot Shield",
		"AK-47",
		"AR-15",
		"AS Val",
		"AUG",
		"Barrett M107",
		"Dragunov",
		"Flamethrower",
		"M249 SAW",
		"M4A1",
		"MP7",
		"RPG",
		"RPK",
		"Saiga 12",
		"Scar L",
		"Tommy Gun",
		"Raygun",
		"Minigun",
		"P90",
		"M1 Garand"
	},
	["chances"] = {
		["Epic"] = 1,
		["Mythic"] = 0.35,
		["Legendary"] = 0.075
	}
}
v7.Christmas = v17
local v18 = {
	["displayName"] = "Atomic Pack",
	["isPack"] = true,
	["eventName"] = "AtomicPack",
	["hasImage"] = true
}
local v19 = {}
local v20 = {
	["displayName"] = "Atomic Amethyst Pack",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Atomic Amethyst"
		},
		{
			["itemName"] = "M4A1",
			["skinName"] = "Atomic Amethyst"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Atomic Amethyst"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Atomic Amethyst"
		},
		{
			["itemName"] = "Sawn Off",
			["skinName"] = "Atomic Amethyst"
		}
	}
}
v19.AtomicAmethystPack = v20
local v21 = {
	["displayName"] = "Atomic Water Pack",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Atomic Water"
		},
		{
			["itemName"] = "M4A1",
			["skinName"] = "Atomic Water"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Atomic Water"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Atomic Water"
		},
		{
			["itemName"] = "Sawn Off",
			["skinName"] = "Atomic Water"
		}
	}
}
v19.AtomicWaterPack = v21
local v22 = {
	["displayName"] = "Atomic Flame Pack",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Atomic Flame"
		},
		{
			["itemName"] = "M4A1",
			["skinName"] = "Atomic Flame"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Atomic Flame"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Atomic Flame"
		},
		{
			["itemName"] = "Sawn Off",
			["skinName"] = "Atomic Flame"
		}
	}
}
v19.AtomicFlamePack = v22
local v23 = {
	["displayName"] = "Atomic Nature Pack",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Atomic Nature"
		},
		{
			["itemName"] = "M4A1",
			["skinName"] = "Atomic Nature"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Atomic Nature"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Atomic Nature"
		},
		{
			["itemName"] = "Sawn Off",
			["skinName"] = "Atomic Nature"
		}
	}
}
v19.AtomicNaturePack = v23
v18.packs = v19
v7.Atomic = v18
local v24 = {
	["displayName"] = "Future Pack",
	["isPack"] = true,
	["eventName"] = "FuturePack",
	["hasImage"] = true
}
local v25 = {}
local v26 = {
	["displayName"] = "Future Black Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Future Black"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Future Black"
		},
		{
			["itemName"] = "AK-47",
			["skinName"] = "Future Black"
		},
		{
			["itemName"] = "Mossberg",
			["skinName"] = "Future Black"
		},
		{
			["itemName"] = "Python",
			["skinName"] = "Future Black"
		}
	}
}
v25.FutureBlackPack = v26
local v27 = {
	["displayName"] = "Future White Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Future White"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Future White"
		},
		{
			["itemName"] = "AK-47",
			["skinName"] = "Future White"
		},
		{
			["itemName"] = "Mossberg",
			["skinName"] = "Future White"
		},
		{
			["itemName"] = "Python",
			["skinName"] = "Future White"
		}
	}
}
v25.FutureWhitePack = v27
v24.packs = v25
v7.Future = v24
local v28 = {
	["displayName"] = "Steampunk Pack",
	["isPack"] = true,
	["eventName"] = "Steampunk",
	["hasImage"] = true,
	["imageId"] = "rbxassetid://15309606772"
}
local v29 = {}
local v30 = {
	["displayName"] = "Steampunk Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Steampunk"
		},
		{
			["itemName"] = "Tommy Gun",
			["skinName"] = "Steampunk"
		},
		{
			["itemName"] = "MP7",
			["skinName"] = "Steampunk"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Steampunk"
		},
		{
			["itemName"] = "Sawn Off",
			["skinName"] = "Steampunk"
		}
	}
}
v29.SteampunkPack = v30
v28.packs = v29
v7.Steampunk = v28
local v31 = {
	["displayName"] = "Elite Pack",
	["isPack"] = true,
	["eventName"] = "Elite",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://15949721379"
}
local v32 = {}
local v33 = {
	["displayName"] = "Elite Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Elite"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Elite"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Elite"
		},
		{
			["itemName"] = "AUG",
			["skinName"] = "Elite"
		},
		{
			["itemName"] = "M4A1",
			["skinName"] = "Elite"
		}
	}
}
v32.ElitePack = v33
v31.packs = v32
v7.Elite = v31
local v34 = {
	["displayName"] = "Sub-Zero Pack",
	["isPack"] = true,
	["eventName"] = "Subzero",
	["hasImage"] = true,
	["displayOrder"] = -1,
	["imageId"] = "rbxassetid://15516317730"
}
local v35 = {}
local v36 = {
	["displayName"] = "Sub-Zero Pack",
	["contents"] = {
		{
			["itemName"] = "M4A1",
			["skinName"] = "Subzero"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Subzero"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Subzero"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Subzero"
		},
		{
			["itemName"] = "Deagle",
			["skinName"] = "Subzero"
		}
	}
}
v35.SubzeroPack = v36
v34.packs = v35
v7.Subzero = v34
local v37 = {
	["displayName"] = "Sakura Pack",
	["isPack"] = true,
	["eventName"] = "Sakura",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://16291663062"
}
local v38 = {}
local v39 = {
	["displayName"] = "Sakura Pack",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Sakura"
		},
		{
			["itemName"] = "Tommy Gun",
			["skinName"] = "Sakura"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Sakura"
		},
		{
			["itemName"] = "Python",
			["skinName"] = "Sakura"
		},
		{
			["itemName"] = "Uzi",
			["skinName"] = "Sakura"
		}
	}
}
v38.SakuraPack = v39
v37.packs = v38
v7.Sakura = v37
local v40 = {
	["displayName"] = "Lucky Clover Pack",
	["isPack"] = true,
	["eventName"] = "StPatricks2025",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://85427689504105"
}
local v41 = {}
local v42 = {
	["displayName"] = "Lucky Clover Pack",
	["contents"] = {
		{
			["itemName"] = "FN FAL",
			["skinName"] = "Lucky Clover"
		},
		{
			["itemName"] = "Scar L",
			["skinName"] = "Lucky Clover"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "Lucky Clover"
		},
		{
			["itemName"] = "RPK",
			["skinName"] = "Lucky Clover"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Lucky Clover"
		}
	}
}
v41.LuckyCloverPack = v42
v40.packs = v41
v7.LuckyClover = v40
local v43 = {
	["displayName"] = "Rose Pack",
	["isPack"] = true,
	["eventName"] = "LastValentines",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://102774855880538"
}
local v44 = {}
local v45 = {
	["displayName"] = "Rose Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Rose"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "Rose"
		},
		{
			["itemName"] = "M1 Garand",
			["skinName"] = "Rose"
		},
		{
			["itemName"] = "Dragunov",
			["skinName"] = "Rose"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Rose"
		}
	}
}
v44.RosePack = v45
v43.packs = v44
v7.Rose = v43
local v46 = {
	["displayName"] = "Wasteland Pack",
	["isPack"] = true,
	["eventName"] = "Wasteland",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://16927329181"
}
local v47 = {}
local v48 = {
	["displayName"] = "Wasteland Pack",
	["contents"] = {
		{
			["itemName"] = "AK-47",
			["skinName"] = "Wasteland"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Wasteland"
		},
		{
			["itemName"] = "MP7",
			["skinName"] = "Wasteland"
		},
		{
			["itemName"] = "Tommy Gun",
			["skinName"] = "Wasteland"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Wasteland"
		}
	}
}
v47.WastelandPack = v48
v46.packs = v47
v7.Wasteland = v46
local v49 = {
	["displayName"] = "Mystic Pack",
	["isPack"] = true,
	["eventName"] = "Mystic",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://17592768285"
}
local v50 = {}
local v51 = {
	["displayName"] = "Mystic Pack",
	["contents"] = {
		{
			["itemName"] = "AUG",
			["skinName"] = "Mystic"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Mystic"
		},
		{
			["itemName"] = "M249 SAW",
			["skinName"] = "Mystic"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Mystic"
		},
		{
			["itemName"] = "AK-47",
			["skinName"] = "Mystic"
		}
	}
}
v50.MysticPack = v51
v49.packs = v50
v7.Mystic = v49
local v52 = {
	["displayName"] = "Pirate Pack",
	["isPack"] = true,
	["eventName"] = "Pirate",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://18165209742"
}
local v53 = {}
local v54 = {
	["displayName"] = "Pirate Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Pirate"
		},
		{
			["itemName"] = "RPK",
			["skinName"] = "Pirate"
		},
		{
			["itemName"] = "Python",
			["skinName"] = "Pirate"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Pirate"
		},
		{
			["itemName"] = "Sawn Off",
			["skinName"] = "Pirate"
		}
	}
}
v53.PiratePack = v54
v52.packs = v53
v7.Pirate = v52
local v55 = {
	["displayName"] = "Pixel Pack",
	["isPack"] = true,
	["eventName"] = "Easter2025",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://140208719926660"
}
local v56 = {}
local v57 = {
	["displayName"] = "Pixel Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Pixel"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "Pixel"
		},
		{
			["itemName"] = "FN FAL",
			["skinName"] = "Pixel"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Pixel"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Pixel"
		}
	}
}
v56.PixelPack = v57
v55.packs = v56
v7.Pixel = v55
local v58 = {
	["displayName"] = "Biohazard Pack",
	["isPack"] = true,
	["eventName"] = "Biohazard",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://18791476178"
}
local v59 = {}
local v60 = {
	["displayName"] = "Biohazard Pack",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Biohazard"
		},
		{
			["itemName"] = "Tommy Gun",
			["skinName"] = "Biohazard"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Biohazard"
		},
		{
			["itemName"] = "AUG",
			["skinName"] = "Biohazard"
		},
		{
			["itemName"] = "MP7",
			["skinName"] = "Biohazard"
		}
	}
}
v59.BiohazardPack = v60
v58.packs = v59
v7.Biohazard = v58
local v61 = {
	["displayName"] = "Void Nightmare Pack",
	["isPack"] = true,
	["eventName"] = "VoidNightmare",
	["hasImage"] = true,
	["displayOrder"] = -1,
	["imageId"] = "rbxassetid://86880114795004"
}
local v62 = {}
local v63 = {
	["displayName"] = "Void Nightmare Pack",
	["contents"] = {
		{
			["itemName"] = "P90",
			["skinName"] = "Void Nightmare"
		},
		{
			["itemName"] = "AUG",
			["skinName"] = "Void Nightmare"
		},
		{
			["itemName"] = "Scar L",
			["skinName"] = "Void Nightmare"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Void Nightmare"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Void Nightmare"
		}
	}
}
v62.VoidNightmarePack = v63
v61.packs = v62
v7.VoidNightmare = v61
local v64 = {
	["displayName"] = "Gingerbread Gun Pack",
	["isPack"] = true,
	["eventName"] = "ChristmasOld",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://114643594762754"
}
local v65 = {}
local v66 = {
	["displayName"] = "Gingerbread Gun Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Gingerbread Gun"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Gingerbread Gun"
		},
		{
			["itemName"] = "M1 Garand",
			["skinName"] = "Gingerbread Gun"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Gingerbread Gun"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "Gingerbread Gun"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Gingerbread Gun"
		}
	}
}
v65.GingerbreadGunPack = v66
v64.packs = v65
v7.GingerbreadGun = v64
local v67 = {
	["displayName"] = "Freeze-Ray Pack",
	["isPack"] = true,
	["eventName"] = "ChristmasOld",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://123133788014222"
}
local v68 = {}
local v69 = {
	["displayName"] = "Freeze-Ray Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Freeze-Ray"
		},
		{
			["itemName"] = "AUG",
			["skinName"] = "Freeze-Ray"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "Freeze-Ray"
		},
		{
			["itemName"] = "MP7",
			["skinName"] = "Freeze-Ray"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Freeze-Ray"
		}
	}
}
v68.FreezeRayPack = v69
v67.packs = v68
v7.FreezeRay = v67
local v70 = {
	["displayName"] = "WW2 Pack",
	["isPack"] = true,
	["eventName"] = "WW2",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://78614502539218"
}
local v71 = {}
local v72 = {
	["displayName"] = "World War 2 Pack",
	["contents"] = {
		{
			["itemName"] = "M249 SAW",
			["skinName"] = "WW2"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "WW2"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "WW2"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "WW2"
		},
		{
			["itemName"] = "M1911",
			["skinName"] = "WW2"
		}
	}
}
v71.WW2Pack = v72
v70.packs = v71
v7.WW2 = v70
local v73 = {
	["displayName"] = "Hyperlaser Pack",
	["isPack"] = true,
	["eventName"] = "Hyperlaser",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://124464589687115"
}
local v74 = {}
local v75 = {
	["displayName"] = "Hyperlaser",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Hyperlaser"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Hyperlaser"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Hyperlaser"
		},
		{
			["itemName"] = "M4A1",
			["skinName"] = "Hyperlaser"
		},
		{
			["itemName"] = "Mossberg",
			["skinName"] = "Hyperlaser"
		}
	}
}
v74.HyperlaserPack = v75
v73.packs = v74
v7.Hyperlaser = v73
local v76 = {
	["displayName"] = "Tactical Pack",
	["isPack"] = true,
	["eventName"] = "TacticalPack",
	["hasImage"] = true,
	["imageId"] = "rbxassetid://14696483529"
}
local v77 = {}
local v78 = {
	["displayName"] = "Tactical Pack 1",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "AK-47",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "Scar L",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "Dragunov",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "Glock",
			["skinName"] = "Tactical"
		}
	}
}
v77.TacticalPack1 = v78
local v79 = {
	["displayName"] = "Tactical Pack 2",
	["contents"] = {
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "M249 SAW",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "AUG",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "MP7",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "Glock 18",
			["skinName"] = "Tactical"
		}
	}
}
v77.TacticalPack2 = v79
v76.packs = v77
v7.Tactical = v76
local v80 = {
	["displayName"] = "Tactical Pack 3",
	["isPack"] = true,
	["eventName"] = "TacticalThree",
	["hasImage"] = true,
	["displayOrder"] = -2,
	["imageId"] = "rbxassetid://122813795549474"
}
local v81 = {}
local v82 = {
	["displayName"] = "Tactical Pack 3",
	["contents"] = {
		{
			["itemName"] = "FN FAL",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "AWP",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "M1 Garand",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "RPG",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "RPK",
			["skinName"] = "Tactical"
		},
		{
			["itemName"] = "Deagle",
			["skinName"] = "Tactical"
		}
	}
}
v81.TacticalPack3 = v82
v80.packs = v81
v7.TacticalThree = v80
local v83 = {
	["displayName"] = "Patriot Pack",
	["isPack"] = true,
	["eventName"] = "July4th2025",
	["hasImage"] = true,
	["displayOrder"] = -3,
	["imageId"] = "rbxassetid://107929750739634"
}
local v84 = {}
local v85 = {
	["displayName"] = "Patriot Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Patriot"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "Patriot"
		},
		{
			["itemName"] = "M1 Garand",
			["skinName"] = "Patriot"
		},
		{
			["itemName"] = "AWP",
			["skinName"] = "Patriot"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Patriot"
		}
	}
}
v84.PatriotPack = v85
v83.packs = v84
v7.Patriot = v83
local v86 = {
	["displayName"] = "Toon Pack",
	["isPack"] = true,
	["eventName"] = "Toon",
	["hasImage"] = true,
	["displayOrder"] = -3,
	["imageId"] = "rbxassetid://102162889405018"
}
local v87 = {}
local v88 = {
	["displayName"] = "Toon Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Toon"
		},
		{
			["itemName"] = "AS Val",
			["skinName"] = "Toon"
		},
		{
			["itemName"] = "SPAS-12",
			["skinName"] = "Toon"
		},
		{
			["itemName"] = "Tommy Gun",
			["skinName"] = "Toon"
		},
		{
			["itemName"] = "Barrett M107",
			["skinName"] = "Toon"
		}
	}
}
v87.ToonPack = v88
v86.packs = v87
v7.Toon = v86
local v89 = {
	["displayName"] = "Golden Dragon Pack",
	["isPack"] = true,
	["eventName"] = "LunarNewYear",
	["hasImage"] = true,
	["displayOrder"] = -3,
	["imageId"] = "rbxassetid://102162889405018"
}
local v90 = {}
local v91 = {
	["displayName"] = "Golden Dragon Pack",
	["contents"] = {
		{
			["itemName"] = "Scar L",
			["skinName"] = "Golden Dragon"
		},
		{
			["itemName"] = "P90",
			["skinName"] = "Golden Dragon"
		},
		{
			["itemName"] = "M1 Garand",
			["skinName"] = "Golden Dragon"
		},
		{
			["itemName"] = "SPAS-12",
			["skinName"] = "Golden Dragon"
		},
		{
			["itemName"] = "FN FAL",
			["skinName"] = "Golden Dragon"
		}
	}
}
v90.GoldenDragonPack = v91
v89.packs = v90
v7["Golden Dragon"] = v89
local v92 = {
	["displayName"] = "Sakura Pack 2",
	["isPack"] = true,
	["eventName"] = "Valentines",
	["hasImage"] = true,
	["displayOrder"] = -3,
	["imageId"] = "rbxassetid://94453100898585"
}
local v93 = {}
local v94 = {
	["displayName"] = "Sakura Pack 2",
	["contents"] = {
		{
			["itemName"] = "SPAS-12",
			["skinName"] = "Sakura 2"
		},
		{
			["itemName"] = "Raygun",
			["skinName"] = "Sakura 2"
		},
		{
			["itemName"] = "AWP",
			["skinName"] = "Sakura 2"
		},
		{
			["itemName"] = "RPK",
			["skinName"] = "Sakura 2"
		},
		{
			["itemName"] = "AK-47",
			["skinName"] = "Sakura 2"
		}
	}
}
v93.SakuraPack2 = v94
v92.packs = v93
v7.Sakura2 = v92
local v95 = {
	["displayName"] = "Cyberpunk Pack",
	["isPack"] = true,
	["eventName"] = "CyberpunkPack",
	["hasImage"] = true,
	["imageId"] = "rbxassetid://13025656068"
}
local v96 = {}
local v97 = {
	["displayName"] = "Cyberpunk Pack 1",
	["contents"] = {
		{
			["itemName"] = "AS Val",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "AK-47",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "RPK",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "Uzi",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "Glock 18",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "Glock",
			["skinName"] = "Cyberpunk"
		}
	}
}
v96.CyberpunkPack1 = v97
local v98 = {
	["displayName"] = "Cyberpunk Pack 2",
	["contents"] = {
		{
			["itemName"] = "Tommy Gun",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "M4A1",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "AUG",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "Double Barrel",
			["skinName"] = "Cyberpunk"
		},
		{
			["itemName"] = "Sawn Off",
			["skinName"] = "Cyberpunk"
		}
	}
}
v96.CyberpunkPack2 = v98
v95.packs = v96
v7.Cyberpunk = v95
v_u_6.cases = v7
local v99 = {
	["Common"] = {
		["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(145, 255, 126)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 249, 83)) })
	},
	["Rare"] = {
		["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 160, 235)), ColorSequenceKeypoint.new(1, Color3.fromRGB(112, 255, 203)) })
	},
	["Epic"] = {
		["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(86, 23, 138)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 242)) })
	},
	["Mythic"] = {
		["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 28, 7)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0)) })
	},
	["Legendary"] = {
		["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(198, 106, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 217, 0)) })
	}
}
v_u_6.rarities = v99
function v_u_6.GetSkinCounts(p100)
	-- upvalues: (copy) v_u_6
	local v101 = v_u_6.cases[p100]
	if v101 and v101.skinCounts then
		return v101.skinCounts
	end
end
function v_u_6.GetSkinType(p102)
	-- upvalues: (copy) v_u_6
	local v103 = v_u_6.skinData[p102]
	if v103 then
		return v103.skinType
	end
end
function v_u_6.IsCaseOnSale(p104)
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	local v105 = v_u_6.cases[p104]
	return v105.eventName == -1 and true or v_u_3.IsActive(v105.eventName)
end
function v_u_6.GetCaseFromSkin(p106, p107)
	-- upvalues: (copy) v_u_6
	for v108, v109 in v_u_6.cases do
		if v109.isPack then
			for v110, v111 in v109.packs do
				for _, v112 in v111.contents do
					if v112.itemName == p106 and v112.skinName == p107 then
						return v108, v110
					end
				end
			end
		elseif table.find(v109.contents, p107) and table.find(v109.compatabilities, p106) then
			return v108
		end
	end
end
function v_u_6.GetCompatabilityTable(p113, p114)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	if p114 then
		local v115 = v_u_5[p113]
		if v115 and v115[p114] then
			return v115[p114]
		end
	end
	return v_u_4[p113]
end
function v_u_6.MakeCompatabilityTable(p116, p117)
	-- upvalues: (copy) v_u_6
	local v118 = v_u_6.skinData[p116]
	if not v118 then
		warn(p116)
	end
	local v119 = v118.compatabilities
	if typeof(v119) == "string" and v_u_6.compatabilities[v119] then
		v119 = v_u_6.compatabilities[v119]
	end
	local v120 = v_u_6.cases[p117]
	if v120 then
		v120 = v120.compatabilities
	end
	if v120 then
		v119 = table.clone(v119)
		for v121 = #v119, 1, -1 do
			if not table.find(v120, v119[v121]) then
				table.remove(v119, v121)
			end
		end
	end
	return v119
end
function v_u_6.IsSkinCompatible(p122, p123)
	-- upvalues: (copy) v_u_6
	if v_u_6.skinData[p123] then
		local v124 = v_u_6.GetCompatabilityTable(p123)
		if v124 then
			return table.find(v124, p122) and true or false
		else
			return false
		end
	else
		return false
	end
end
v_u_6.skinData = {}
for _, v125 in script.bin:GetChildren() do
	for _, v126 in v125:GetChildren() do
		if v126:IsA("ModuleScript") then
			v_u_6.skinData[v126.Name] = require(v126)
		end
	end
end
for v127, v128 in v_u_6.cases do
	if not v128.isPack and v128.contents then
		for _, v129 in v128.contents do
			if not v_u_5[v129] then
				v_u_5[v129] = {}
			end
			local v130 = v_u_6.MakeCompatabilityTable(v129, v127)
			v_u_5[v129][v127] = v130
		end
	end
end
for v131, _ in v_u_6.skinData do
	v_u_4[v131] = v_u_6.MakeCompatabilityTable(v131)
end
local function v141(p132)
	-- upvalues: (copy) v_u_6
	local v133 = v_u_6.cases[p132]
	if v133 then
		local v134 = v133.chances
		local v135 = {
			["Total"] = 0,
			["All_Skins"] = {}
		}
		for v136 in v134 do
			v135[v136] = 0
			v135[v136 .. "_Skins"] = {}
		end
		for _, v137 in v133.contents do
			for _, v138 in v_u_6.GetCompatabilityTable(v137, p132) do
				local v139 = v_u_6.skinData[v137].rarity
				local v140 = v134[v139] or 1
				v135.Total = v135.Total + 1
				v135.All_Skins[v138 .. "_" .. v137] = v140
				v135[v139] = v135[v139] + 1
				v135[v139 .. "_Skins"][v138 .. "_" .. v137] = v140
			end
		end
		v133.skinCount = v135
	end
end
v141("SmallArms")
v141("HeavyWeapons")
v141("Series2Light")
v141("Series2Heavy")
v141("Series3Light")
v141("Series3Heavy")
v141("Firework")
v141("Christmas")
v141("Halloween")
v141("America")
return v_u_6