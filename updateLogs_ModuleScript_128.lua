-- updateLogs (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = {}
local v2 = {}
local v3 = {
	["text"] = "NEW UPDATE!",
	["textColor"] = Color3.fromRGB(255, 255, 255),
	["gradient"] = {
		["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 83, 209)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 190, 252)) }),
		["Offset"] = Vector2.new(0, -0.05),
		["Rotation"] = -90
	}
}
v2.header = v3
v2.changes = {
	"\240\159\146\152 Valentines Event",
	"\240\159\142\150\239\184\143 Military Base Revamp",
	"\240\159\146\179 Military Robbery",
	"\240\159\140\183 New Furniture",
	"\226\157\132\239\184\143 Removed Snow",
	"\240\159\144\155 Bug Fixes"
}
local v4 = {}
local v5 = {
	["text"] = "\240\159\140\184 SAKURA GUNS \240\159\140\184",
	["textColor"] = Color3.fromRGB(255, 255, 255),
	["gradient"] = {
		["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 83, 209)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 190, 252)) }),
		["Offset"] = Vector2.new(0, -0.05),
		["Rotation"] = -90
	}
}
v4.header = v5
v4.caseName = "Sakura"
v4.skinRender = "rbxassetid://16291663062"
v2.skinPack = v4
v1["28"] = v2
local v6 = {
	["header"] = {
		["text"] = "NEW UPDATE!",
		["textColor"] = Color3.fromRGB(117, 234, 0)
	},
	["frameHeight"] = 480,
	["changes"] = {
		"\240\159\148\171 Case Series #3",
		"\240\159\146\188 Daily Case Quest",
		"\226\173\144 Lucky Block Event",
		"\240\159\164\157 8 Trade Slots",
		"\240\159\148\168 Advanced Build Pass",
		"\240\159\155\161\239\184\143 Clan Improvements",
		"\240\159\142\174 Console Fixes",
		"\226\152\129\239\184\143 Performance Boosts",
		"\240\159\141\128 St. Paddy\'s Furniture",
		"\240\159\144\155 Bug Fixes"
	}
}
v1["29"] = v6
local v7 = {
	["header"] = {
		["text"] = "NEW UPDATE!",
		["textColor"] = Color3.fromRGB(255, 170, 255)
	},
	["frameHeight"] = 503,
	["changes"] = {
		"\240\159\165\154 Egg Hunt Event",
		"\240\159\144\176 Easter Furniture",
		"\226\152\129\239\184\143 Performance Boosts",
		"\240\159\144\155 Bug Fixes"
	}
}
local v8 = {}
local v9 = {
	["text"] = "WASTELAND GUNS",
	["textColor"] = Color3.fromRGB(255, 255, 255),
	["gradient"] = {
		["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 132, 207)), ColorSequenceKeypoint.new(1, Color3.fromRGB(177, 206, 255)) }),
		["Offset"] = Vector2.new(0, -0.05),
		["Rotation"] = -90
	}
}
v8.header = v9
v8.caseName = "Wasteland"
v8.skinRender = "rbxassetid://16927329181"
v7.skinPack = v8
v1["30"] = v7
local v10 = {
	["header"] = {
		["text"] = "NEW UPDATE!",
		["textColor"] = Color3.fromRGB(255, 255, 255)
	},
	["frameHeight"] = 270,
	["changes"] = {
		"\240\159\148\167 Crafting",
		"\226\154\146\239\184\143 Crafting Bench",
		"\240\159\147\166 Components Box",
		"\226\173\144 Trident Launcher, Pulse Rifle",
		"\226\173\144 El Fuego, C5, Big Sign",
		"\226\152\129\239\184\143 Performance Boosts",
		"\240\159\144\155 Bug Fixes"
	}
}
v1["31"] = v10
return v1