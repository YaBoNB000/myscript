-- default-properties (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v34 = {
	["knocked"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = false,
		["checkFunc"] = function(_, p1)
			if type(p1) == "boolean" then
				return true
			end
		end
	},
	["cuffed"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = false,
		["checkFunc"] = function(_, p2)
			if type(p2) == "boolean" then
				return true
			end
		end
	},
	["carried"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p3)
			if type(p3) == "boolean" then
				return true
			end
		end
	},
	["ragdolled"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p4)
			if type(p4) == "boolean" then
				return true
			end
		end
	},
	["blocking"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p5)
			if type(p5) == "boolean" then
				return true
			end
		end
	},
	["stun"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p6)
			if type(p6) == "number" then
				return true
			end
		end
	},
	["aiming"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p7)
			if type(p7) == "boolean" then
				return true
			end
		end
	},
	["reloading"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p8)
			if type(p8) == "boolean" then
				return true
			end
		end
	},
	["fps"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p9)
			if type(p9) == "boolean" then
				return true
			end
		end
	},
	["scoped"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p10)
			if type(p10) == "boolean" then
				return true
			end
		end
	},
	["rmb"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p11)
			if type(p11) == "boolean" then
				return true
			end
		end
	},
	["lmb"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p12)
			if type(p12) == "boolean" then
				return true
			end
		end
	},
	["lmbdepressed"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p13)
			if type(p13) == "boolean" then
				return true
			end
		end
	},
	["forward"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p14)
			if type(p14) == "number" and (p14 == 0 or (p14 == -1 or p14 == 1)) then
				return true
			end
		end
	},
	["strafing"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p15)
			if type(p15) == "number" and (p15 == 0 or (p15 == -1 or p15 == 1)) then
				return true
			end
		end
	},
	["aimPoint"] = {
		["defaultValue"] = Vector3.new(),
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p16)
			if typeof(p16) == "Vector3" then
				return true
			end
		end
	},
	["cameraPos"] = {
		["defaultValue"] = Vector3.new(),
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p17)
			if typeof(p17) == "Vector3" then
				return true
			end
		end
	},
	["centerPoint"] = {
		["defaultValue"] = Vector3.new(),
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p18)
			if typeof(p18) == "Vector3" then
				return true
			end
		end
	},
	["aimPointSmooth"] = {
		["defaultValue"] = Vector3.new(),
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p19)
			if typeof(p19) == "Vector3" then
				return true
			end
		end
	},
	["yaw"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p20)
			if type(p20) == "number" then
				return true
			end
		end
	},
	["yawSmooth"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p21)
			if type(p21) == "number" then
				return true
			end
		end
	},
	["xAngle"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p22)
			if type(p22) == "number" then
				return true
			end
		end
	},
	["xSpeed"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p23)
			if type(p23) == "number" then
				return true
			end
		end
	},
	["yAngle"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p24)
			if type(p24) == "number" then
				return true
			end
		end
	},
	["ySpeed"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p25)
			if type(p25) == "number" then
				return true
			end
		end
	},
	["lastAimChange"] = {
		["defaultValue"] = os.clock(),
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p26)
			if type(p26) == "number" then
				return true
			end
		end
	},
	["lastShot"] = {
		["defaultValue"] = os.clock(),
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p27)
			if type(p27) == "number" then
				return true
			end
		end
	},
	["recoil"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p28)
			if type(p28) == "number" then
				return true
			end
		end
	},
	["recoilFastDiminish"] = {
		["defaultValue"] = 0,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p29)
			if type(p29) == "number" then
				return true
			end
		end
	},
	["sprint"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p30)
			if type(p30) == "boolean" then
				return true
			end
		end
	},
	["crouch"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p31)
			if type(p31) == "boolean" then
				return true
			end
		end
	},
	["crawl"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p32)
			if type(p32) == "boolean" then
				return true
			end
		end
	},
	["jump"] = {
		["defaultValue"] = false,
		["clientCanReplicate"] = true,
		["checkFunc"] = function(_, p33)
			if type(p33) == "boolean" then
				return true
			end
		end
	}
}
return v34