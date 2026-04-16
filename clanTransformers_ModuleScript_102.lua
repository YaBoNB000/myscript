-- clanTransformers (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v1.devv).load
return {
	["addMember"] = function(p5, p6, p7)
		assert(p5)
		local v8 = tonumber(p6)
		p5.members = p5.members or {}
		local v9 = false
		for _, v10 in p5.members do
			if v10.userId == v8 then
				v9 = true
			end
		end
		if v9 then
			return p5
		end
		local v11 = {
			["userId"] = v8
		}
		local v12
		if p7 and p7 > 0 then
			v11.points = p7
			v12 = true
		else
			v12 = false
		end
		local v13 = p5.members
		table.insert(v13, v11)
		if v12 then
			local v14 = 0
			for _, v15 in p5.members do
				v14 = v14 + (v15.points or 0)
			end
			p5.points = v14
		end
		return p5
	end,
	["removeMember"] = function(p16, p17, p18)
		-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
		assert(p16)
		local v19 = tonumber(p17)
		p16.members = p16.members or {}
		for v20, v21 in p16.members do
			if v21.userId == v19 then
				table.remove(p16.members, v20)
				break
			end
		end
		if p16.roles then
			for v22, v23 in p16.roles do
				if v23.userId == v19 then
					table.remove(p16.roles, v22)
					break
				end
			end
		end
		local v24 = 0
		for _, v25 in p16.members do
			v24 = v24 + (v25.points or 0)
		end
		p16.points = v24
		if v_u_2:IsServer() and p18 == "kick" then
			for _, v26 in v_u_3:GetPlayers() do
				if v26.UserId == v19 then
					v_u_4("ServerClans").ResetPlayerClan(v26)
					return p16
				end
			end
		end
		return p16
	end,
	["roleChanged"] = function(p27, p28, p29)
		assert(p27)
		local v30 = false
		local v31 = nil
		if p27.roles then
			for v32, v33 in p27.roles do
				if v33.userId == p28 then
					v33.role = p29
					if p29 then
						v30 = true
					else
						v31 = v32
					end
				end
			end
			if not v30 then
				local v34 = p27.roles
				table.insert(v34, {
					["userId"] = p28,
					["role"] = p29
				})
				return p27
			end
			if v31 then
				table.remove(p27.roles, v31)
			end
		end
		return p27
	end,
	["rankChanged"] = function(p35, p36, p37)
		assert(p35)
		p35.members = p35.members or {}
		for _, v38 in p35.members do
			if v38.userId == p36 then
				v38.rank = p37
			end
		end
		return p35
	end,
	["updateJoinType"] = function(p39, p40)
		assert(p39)
		p39.joinType = p40
		return p39
	end,
	["updateJoinRequirement"] = function(p41, p42)
		assert(p41)
		p41.joinRequirement = p42
		return p41
	end,
	["updateTag"] = function(p43, p44)
		assert(p43)
		p43.tag = p44
		return p43
	end,
	["updateName"] = function(p45, p46)
		assert(p45)
		p45.name = p46
		return p45
	end,
	["updateIcon"] = function(p47, p48)
		assert(p47)
		p47.icon = p48
		return p47
	end,
	["updateDescription"] = function(p49, p50)
		assert(p49)
		p49.description = p50
		return p49
	end,
	["pointsUpdated"] = function(p51, p52, p53)
		assert(p51)
		p51.members = p51.members or {}
		local v54 = 0
		for _, v55 in p51.members do
			if v55.userId == p52 then
				v55.points = p53
			end
			v54 = v54 + (v55.points or 0)
		end
		p51.points = v54
		return p51
	end
}