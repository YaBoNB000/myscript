-- specialRoles (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v_u_1 = {}
local v2 = {
	["tag"] = {
		["TagColor"] = Color3.fromRGB(219, 112, 147),
		["TagText"] = "Admin"
	},
	["users"] = {
		277861465,
		38476745,
		63233311,
		339310190,
		4099588323,
		29734938,
		5866099,
		-1,
		0,
		-1,
		-2,
		-3
	},
	["commands"] = { "teleport", "tp" }
}
v_u_1.developer = v2
local v3 = {
	["tag"] = {
		["TagColor"] = Color3.fromRGB(219, 112, 147),
		["TagText"] = "Admin"
	},
	["users"] = { 521093933, 153650149, 7696695022 },
	["commands"] = { "teleport", "tp" }
}
v_u_1.admins = v3
v_u_1.heros = {
	["users"] = {
		7988504360,
		8163459403,
		479538904,
		4121670020,
		9877213115,
		479801227,
		9287052525,
		8168051282,
		9936815868,
		3770605037,
		3577163470,
		8740640657,
		9929655660,
		10666522975,
		10681276986,
		10784876402,
		1649381149,
		3561336433,
		3632891716,
		10165882946
	}
}
function v_u_1.isDeveloper(p4)
	-- upvalues: (copy) v_u_1
	return table.find(v_u_1.developer.users, p4) ~= nil
end
function v_u_1.isHero(p5)
	-- upvalues: (copy) v_u_1
	return table.find(v_u_1.developer.users, p5) ~= nil and true or ((table.find(v_u_1.developer.users, p5) ~= nil and true or table.find(v_u_1.admins.users, p5) ~= nil) and true or table.find(v_u_1.heros.users, p5) ~= nil)
end
function v_u_1.isAdmin(p6)
	-- upvalues: (copy) v_u_1
	return table.find(v_u_1.developer.users, p6) ~= nil and true or table.find(v_u_1.admins.users, p6) ~= nil
end
return v_u_1