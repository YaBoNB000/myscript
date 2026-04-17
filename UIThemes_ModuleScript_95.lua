-- UIThemes (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load("retone")
local v2 = {}
local v3 = Color3.fromRGB(255, 255, 255)
local v4 = Color3.fromRGB(0, 0, 255)
local v5 = Color3.fromRGB(25, 50, 125)
local v6 = Color3.fromRGB(33, 71, 160)
Color3.fromRGB(193, 229, 255)
Color3.fromRGB(110, 143, 200)
local v7 = Color3.fromRGB(95, 184, 239)
local v8 = Color3.fromRGB(255, 0, 0)
local v9 = Color3.fromRGB(142, 2, 2)
local v10 = Color3.fromRGB(142, 2, 2)
Color3.fromRGB(98, 88, 88)
Color3.fromRGB(200, 110, 110)
local v11 = Color3.fromRGB(200, 110, 110)
local v12 = Color3.fromRGB(0, 255, 0)
Color3.fromRGB(4, 142, 92)
local v13 = Color3.fromRGB(4, 142, 92)
Color3.fromRGB(194, 255, 193)
Color3.fromRGB(110, 200, 129)
local v14 = Color3.fromRGB(110, 200, 129)
v1(v6, {
	["saturation"] = 1.1,
	["vibrance"] = 0.8
})
v1(v10, {
	["saturation"] = 1.1,
	["vibrance"] = 0.8
})
v1(v13, {
	["saturation"] = 1.1,
	["vibrance"] = 0.8
})
local v15 = {}
v2.mainMenu = v15
v15.gradients = {}
local v16 = {
	["Police"] = {
		["labelsSelected"] = v6,
		["labelsUnselected"] = v3,
		["bgSelected"] = v3,
		["bgUnselected"] = v6
	},
	["Criminals"] = {
		["labelsSelected"] = v10,
		["labelsUnselected"] = v3,
		["bgSelected"] = v3,
		["bgUnselected"] = v10
	},
	["Civilians"] = {
		["labelsSelected"] = v13,
		["labelsUnselected"] = v3,
		["bgSelected"] = v3,
		["bgUnselected"] = v13
	}
}
v15.topbar = v16
local v17 = {}
v2.hotbar = v17
v17.colors = {
	["Police"] = v4,
	["Criminals"] = v8,
	["Civilians"] = v12
}
local v18 = {}
v2.loadout = v18
local v19 = {}
local v20 = {
	["darker"] = v5,
	["dark"] = v6,
	["light"] = v1(v6, {
		["vibrance"] = 1.2
	})
}
v19.Police = v20
local v21 = {
	["darker"] = v9,
	["dark"] = v10,
	["light"] = v1(v10, {
		["vibrance"] = 1.2
	})
}
v19.Criminals = v21
local v22 = {
	["dark"] = v13,
	["light"] = v1(v13, {
		["vibrance"] = 1.2
	})
}
v19.Civilians = v22
v18.colors = v19
v18.gradients = {
	["Police"] = ColorSequence.new(v3, v7),
	["Criminals"] = ColorSequence.new(v3, v11),
	["Civilians"] = ColorSequence.new(v3, v14)
}
v2.white = v3
return v2