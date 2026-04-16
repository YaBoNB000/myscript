-- default-vehicle-properties (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v12 = {
	["isOn"] = {
		["defaultValue"] = false,
		["checkFunc"] = function(_, p1)
			if type(p1) == "boolean" then
				return true
			end
		end,
		["clientCanReplicate"] = true
	},
	["cGear"] = {
		["defaultValue"] = 0,
		["checkFunc"] = function(_, p2)
			if type(p2) == "number" then
				return true
			end
		end,
		["clientCanReplicate"] = true
	},
	["headlights"] = {
		["defaultValue"] = false,
		["checkFunc"] = function(_, p3)
			if type(p3) == "boolean" then
				return true
			end
		end,
		["clientCanReplicate"] = true
	},
	["locked"] = {
		["defaultValue"] = true,
		["checkFunc"] = function(_, p4)
			if type(p4) == "boolean" then
				return true
			end
		end,
		["clientCanReplicate"] = true
	},
	["horn"] = {
		["defaultValue"] = false,
		["checkFunc"] = function(_, p5)
			if type(p5) == "boolean" then
				return true
			end
		end,
		["clientCanReplicate"] = true
	},
	["siren"] = {
		["defaultValue"] = false,
		["checkFunc"] = function(_, p6)
			if type(p6) == "boolean" then
				return true
			end
		end,
		["clientCanReplicate"] = true
	},
	["destroyed"] = {
		["defaultValue"] = false,
		["checkFunc"] = function(_, p7)
			if type(p7) == "boolean" then
				return true
			end
		end,
		["clientCanReplicate"] = false
	},
	["health"] = {
		["defaultValue"] = 1200,
		["checkFunc"] = function(_, p8)
			if type(p8) == "number" then
				return true
			end
		end,
		["clientCanReplicate"] = false
	},
	["maxHealth"] = {
		["defaultValue"] = 800,
		["checkFunc"] = function(_, p9)
			if type(p9) == "number" then
				return true
			end
		end,
		["clientCanReplicate"] = false
	},
	["burnInt"] = {
		["defaultValue"] = 0,
		["checkFunc"] = function(_, p10)
			if type(p10) == "number" then
				return true
			end
		end,
		["clientCanReplicate"] = false
	},
	["collisionModel"] = {
		["defaultValue"] = {},
		["checkFunc"] = function(_, p11)
			if type(p11) == "table" then
				return true
			end
		end,
		["clientCanReplicate"] = true
	}
}
return v12