-- crafts (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = {
	["scrap"] = {
		["displayName"] = "Scrap",
		["maxAmount"] = 200,
		["icon"] = ""
	},
	["cheapMetal"] = {
		["displayName"] = "Cheap Metal",
		["maxAmount"] = 200,
		["icon"] = ""
	},
	["refinedMetal"] = {
		["displayName"] = "Refined Metal",
		["maxAmount"] = 200,
		["icon"] = ""
	},
	["circuitboard"] = {
		["displayName"] = "Circuitboard",
		["maxAmount"] = 50,
		["icon"] = ""
	},
	["gunpowder"] = {
		["displayName"] = "Gunpowder",
		["maxAmount"] = 200,
		["icon"] = ""
	},
	["chemicals"] = {
		["displayName"] = "Chemicals",
		["maxAmount"] = 200,
		["icon"] = ""
	},
	["plastic"] = {
		["displayName"] = "Plastic",
		["maxAmount"] = 200,
		["icon"] = ""
	},
	["cloth"] = {
		["displayName"] = "Cloth",
		["maxAmount"] = 50,
		["icon"] = ""
	}
}
local v2 = {}
local v3 = {
	["components"] = {
		"scrap",
		"cheapMetal",
		"refinedMetal",
		"circuitboard",
		"gunpowder",
		"chemicals",
		"plastic",
		"cloth"
	},
	["recipeCategories"] = {
		["Weapons"] = {},
		["Items"] = {},
		["Consumables"] = {},
		["Furniture"] = {}
	}
}
v2.workbench = v3
return {
	["recipes"] = {},
	["breakdown"] = {},
	["components"] = v1,
	["tableTypes"] = v2
}