-- config (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > TimeHandler
-- Original

local v1 = {}
local v2 = {
	["ClockTime"] = 14.5,
	["MoonTextureId"] = "rbxasset://sky/moon.jpg",
	["Lighting"] = {
		["Ambient"] = Color3.fromRGB(182, 178, 185),
		["Brightness"] = 3,
		["ColorShift_Bottom"] = Color3.fromRGB(31, 65, 123),
		["ColorShift_Top"] = Color3.fromRGB(189, 177, 164),
		["EnvironmentDiffuseScale"] = 0.4,
		["EnvironmentSpecularScale"] = 0.7,
		["OutdoorAmbient"] = Color3.fromRGB(149, 149, 149),
		["ShadowSoftness"] = 0.1,
		["ExposureCompensation"] = 0.1
	},
	["Clouds"] = {
		["Cover"] = 0.629,
		["Density"] = 0.098,
		["Color"] = Color3.fromRGB(255, 232, 217)
	},
	["Atmosphere"] = {
		["Density"] = 0.31,
		["Offset"] = 0.3,
		["Color"] = Color3.fromRGB(204, 193, 185),
		["Decay"] = Color3.fromRGB(255, 253, 251),
		["Glare"] = 0.25,
		["Haze"] = 2.8
	},
	["ColorCorrection"] = {
		["Brightness"] = 0.01,
		["Contrast"] = 0.2,
		["Saturation"] = 0.4,
		["TintColor"] = Color3.fromRGB(246, 250, 255)
	},
	["SunRays"] = {
		["Intensity"] = 0.122,
		["Spread"] = 0.273
	},
	["Bloom"] = {
		["Intensity"] = 0.05,
		["Size"] = 50,
		["Threshold"] = 1.5
	}
}
v1.default = v2
v1.dawn = {
	["ClockTime"] = 6.5
}
v1.morning = {
	["ClockTime"] = 9
}
v1.noon = {
	["ClockTime"] = 11
}
v1.afternoon = {
	["ClockTime"] = 14.5
}
v1.dusk = {
	["ClockTime"] = 17.75
}
local v3 = {
	["ClockTime"] = 0,
	["MoonTextureId"] = "rbxasset://sky/moon.jpg",
	["Lighting"] = {
		["Ambient"] = Color3.fromRGB(193, 216, 231),
		["Brightness"] = 3.2,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(193, 193, 193),
		["EnvironmentDiffuseScale"] = 1,
		["EnvironmentSpecularScale"] = 1,
		["OutdoorAmbient"] = Color3.fromRGB(169, 185, 200),
		["ShadowSoftness"] = 0.2,
		["ExposureCompensation"] = 0.15
	},
	["Clouds"] = {
		["Cover"] = 0.713,
		["Density"] = 0.225,
		["Color"] = Color3.fromRGB(57, 62, 65)
	},
	["Atmosphere"] = {
		["Density"] = 0.4,
		["Offset"] = 0.453,
		["Color"] = Color3.fromRGB(121, 129, 134),
		["Decay"] = Color3.fromRGB(206, 219, 244),
		["Glare"] = 0.3,
		["Haze"] = 2.2
	},
	["ColorCorrection"] = {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0.6,
		["TintColor"] = Color3.fromRGB(252, 253, 255)
	},
	["SunRays"] = {
		["Intensity"] = 0.122,
		["Spread"] = 0.273
	},
	["Bloom"] = {
		["Intensity"] = 0.05,
		["Size"] = 50,
		["Threshold"] = 1.5
	}
}
v1.night = v3
local v4 = {
	["ClockTime"] = 0,
	["MoonTextureId"] = "rbxassetid://11864813837",
	["Lighting"] = {
		["Ambient"] = Color3.fromRGB(173, 108, 108),
		["Brightness"] = 6,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(193, 90, 0),
		["EnvironmentDiffuseScale"] = 1,
		["EnvironmentSpecularScale"] = 1,
		["OutdoorAmbient"] = Color3.fromRGB(140, 97, 97),
		["ShadowSoftness"] = 0.2,
		["ExposureCompensation"] = 0.25
	},
	["Clouds"] = {
		["Cover"] = 1,
		["Density"] = 0.098,
		["Color"] = Color3.fromRGB(61, 37, 37)
	},
	["Atmosphere"] = {
		["Density"] = 0.649,
		["Offset"] = 0.191,
		["Color"] = Color3.fromRGB(75, 49, 49),
		["Decay"] = Color3.fromRGB(0, 0, 0),
		["Glare"] = 3.36,
		["Haze"] = 1.22
	},
	["ColorCorrection"] = {
		["Brightness"] = 0.1,
		["Contrast"] = 0.2,
		["Saturation"] = 0.3,
		["TintColor"] = Color3.fromRGB(247, 253, 255)
	},
	["SunRays"] = {
		["Intensity"] = 0.122,
		["Spread"] = 0.273
	},
	["Bloom"] = {
		["Intensity"] = 0.15,
		["Size"] = 56,
		["Threshold"] = 0.6
	}
}
v1.nextBotEvent = v4
return v1