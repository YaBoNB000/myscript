-- RbxCharacterSounds (LocalScript)
-- StarterPlayer > StarterPlayerScripts
-- Original

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = "UserAtomicCharacterSoundsUnparent"
local v4, v5 = pcall(function()
	-- upvalues: (copy) v_u_3
	return UserSettings():IsUserFeatureEnabled(v_u_3)
end)
local v_u_6 = v4 and v5
local v_u_7 = {
	["Climbing"] = {
		["SoundId"] = "rbxasset://sounds/action_footsteps_plastic.mp3",
		["Looped"] = true
	},
	["Died"] = {
		["SoundId"] = "rbxasset://sounds/uuhhh.mp3"
	},
	["FreeFalling"] = {
		["SoundId"] = "rbxasset://sounds/action_falling.mp3",
		["Looped"] = true
	},
	["GettingUp"] = {
		["SoundId"] = "rbxasset://sounds/action_get_up.mp3"
	},
	["Jumping"] = {
		["SoundId"] = "rbxasset://sounds/action_jump.mp3"
	},
	["Landing"] = {
		["SoundId"] = "rbxasset://sounds/action_jump_land.mp3"
	},
	["Splash"] = {
		["SoundId"] = "rbxasset://sounds/impact_water.mp3"
	},
	["Swimming"] = {
		["SoundId"] = "rbxasset://sounds/action_swim.mp3",
		["Looped"] = true,
		["Pitch"] = 1.6
	}
}
local v_u_114 = require(script:WaitForChild("AtomicBinding")).new({
	["humanoid"] = "Humanoid",
	["rootPart"] = "HumanoidRootPart"
}, function(p8)
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_6
	local _ = p8.player
	local v9 = p8.humanoid
	local v_u_10 = p8.rootPart
	local v_u_11 = {}
	for v12, v13 in pairs(v_u_7) do
		local v14 = Instance.new("Sound")
		v14.Name = v12
		v14.Archivable = false
		v14.RollOffMinDistance = 5
		v14.RollOffMaxDistance = 150
		v14.Volume = 0.65
		for v15, v16 in pairs(v13) do
			v14[v15] = v16
		end
		v14.Parent = v_u_10
		v_u_11[v12] = v14
	end
	local v_u_17 = {}
	local v_u_95 = {
		[Enum.HumanoidStateType.FallingDown] = function()
			-- upvalues: (copy) v_u_17
			local v18 = pairs
			local v19 = v_u_17
			local v20 = {}
			for v21, v22 in pairs(v19) do
				v20[v21] = v22
			end
			for v23 in v18(v20) do
				if v23 ~= nil then
					v23.Playing = false
					v_u_17[v23] = nil
				end
			end
		end,
		[Enum.HumanoidStateType.GettingUp] = function()
			-- upvalues: (copy) v_u_17, (copy) v_u_11
			local v24 = pairs
			local v25 = v_u_17
			local v26 = {}
			for v27, v28 in pairs(v25) do
				v26[v27] = v28
			end
			for v29 in v24(v26) do
				if v29 ~= nil then
					v29.Playing = false
					v_u_17[v29] = nil
				end
			end
			local v30 = v_u_11.GettingUp
			v30.TimePosition = 0
			v30.Playing = true
		end,
		[Enum.HumanoidStateType.Jumping] = function()
			-- upvalues: (copy) v_u_17, (copy) v_u_11
			local v31 = pairs
			local v32 = v_u_17
			local v33 = {}
			for v34, v35 in pairs(v32) do
				v33[v34] = v35
			end
			for v36 in v31(v33) do
				if v36 ~= nil then
					v36.Playing = false
					v_u_17[v36] = nil
				end
			end
			local v37 = v_u_11.Jumping
			v37.TimePosition = 0
			v37.Playing = true
		end,
		[Enum.HumanoidStateType.Swimming] = function()
			-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_17
			local v38 = v_u_10.AssemblyLinearVelocity.Y
			local v39 = math.abs(v38)
			if v39 > 0.1 then
				local v40 = v_u_11.Splash
				local v41 = (v39 - 100) * 0.72 / 250 + 0.28
				v40.Volume = math.clamp(v41, 0, 1)
				local v42 = v_u_11.Splash
				v42.TimePosition = 0
				v42.Playing = true
			end
			local v43 = v_u_11.Swimming
			local v44 = pairs
			local v45 = v_u_17
			local v46 = {}
			for v47, v48 in pairs(v45) do
				v46[v47] = v48
			end
			for v49 in v44(v46) do
				if v49 ~= v43 then
					v49.Playing = false
					v_u_17[v49] = nil
				end
			end
			v_u_11.Swimming.Playing = true
			v_u_17[v_u_11.Swimming] = true
		end,
		[Enum.HumanoidStateType.Freefall] = function()
			-- upvalues: (copy) v_u_11, (copy) v_u_17
			v_u_11.FreeFalling.Volume = 0
			local v50 = v_u_11.FreeFalling
			local v51 = pairs
			local v52 = v_u_17
			local v53 = {}
			for v54, v55 in pairs(v52) do
				v53[v54] = v55
			end
			for v56 in v51(v53) do
				if v56 ~= v50 then
					v56.Playing = false
					v_u_17[v56] = nil
				end
			end
			v_u_17[v_u_11.FreeFalling] = true
		end,
		[Enum.HumanoidStateType.Landed] = function()
			-- upvalues: (copy) v_u_17, (copy) v_u_10, (copy) v_u_11
			local v57 = pairs
			local v58 = v_u_17
			local v59 = {}
			for v60, v61 in pairs(v58) do
				v59[v60] = v61
			end
			for v62 in v57(v59) do
				if v62 ~= nil then
					v62.Playing = false
					v_u_17[v62] = nil
				end
			end
			local v63 = v_u_10.AssemblyLinearVelocity.Y
			local v64 = math.abs(v63)
			if v64 > 75 then
				local v65 = v_u_11.Landing
				local v66 = (v64 - 50) * 1 / 50 + 0
				v65.Volume = math.clamp(v66, 0, 1)
				local v67 = v_u_11.Landing
				v67.TimePosition = 0
				v67.Playing = true
			end
		end,
		[Enum.HumanoidStateType.Climbing] = function()
			-- upvalues: (copy) v_u_11, (copy) v_u_10, (copy) v_u_17
			local v68 = v_u_11.Climbing
			local v69 = v_u_10.AssemblyLinearVelocity.Y
			if math.abs(v69) > 0.1 then
				v68.Playing = true
				local v70 = pairs
				local v71 = v_u_17
				local v72 = {}
				for v73, v74 in pairs(v71) do
					v72[v73] = v74
				end
				for v75 in v70(v72) do
					if v75 ~= v68 then
						v75.Playing = false
						v_u_17[v75] = nil
					end
				end
			else
				local v76 = pairs
				local v77 = v_u_17
				local v78 = {}
				for v79, v80 in pairs(v77) do
					v78[v79] = v80
				end
				for v81 in v76(v78) do
					if v81 ~= nil then
						v81.Playing = false
						v_u_17[v81] = nil
					end
				end
			end
			v_u_17[v68] = true
		end,
		[Enum.HumanoidStateType.Seated] = function()
			-- upvalues: (copy) v_u_17
			local v82 = pairs
			local v83 = v_u_17
			local v84 = {}
			for v85, v86 in pairs(v83) do
				v84[v85] = v86
			end
			for v87 in v82(v84) do
				if v87 ~= nil then
					v87.Playing = false
					v_u_17[v87] = nil
				end
			end
		end,
		[Enum.HumanoidStateType.Dead] = function()
			-- upvalues: (copy) v_u_17, (copy) v_u_11
			local v88 = pairs
			local v89 = v_u_17
			local v90 = {}
			for v91, v92 in pairs(v89) do
				v90[v91] = v92
			end
			for v93 in v88(v90) do
				if v93 ~= nil then
					v93.Playing = false
					v_u_17[v93] = nil
				end
			end
			local v94 = v_u_11.Died
			v94.TimePosition = 0
			v94.Playing = true
		end
	}
	local v_u_102 = {
		[v_u_11.Climbing] = function(_, p96, p97)
			p96.Playing = p97.Magnitude > 0.1
		end,
		[v_u_11.FreeFalling] = function(p98, p99, p100)
			if p100.Magnitude > 75 then
				local v101 = p99.Volume + p98 * 0.9
				p99.Volume = math.clamp(v101, 0, 1)
			else
				p99.Volume = 0
			end
		end
	}
	local v_u_103 = {
		[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
	}
	local v_u_104 = v_u_103[v9:GetState()] or v9:GetState()
	local v_u_108 = v9.StateChanged:Connect(function(_, p105)
		-- upvalues: (copy) v_u_103, (ref) v_u_104, (copy) v_u_95
		local v106 = v_u_103[p105] or p105
		if v106 ~= v_u_104 then
			local v107 = v_u_95[v106]
			if v107 then
				v107()
			end
			v_u_104 = v106
		end
	end)
	local v_u_112 = v_u_2.Stepped:Connect(function(_, p109)
		-- upvalues: (copy) v_u_17, (copy) v_u_102, (copy) v_u_10
		for v110 in pairs(v_u_17) do
			local v111 = v_u_102[v110]
			if v111 then
				v111(p109, v110, v_u_10.AssemblyLinearVelocity)
			end
		end
	end)
	return function()
		-- upvalues: (copy) v_u_108, (copy) v_u_112, (ref) v_u_6, (copy) v_u_11
		v_u_108:Disconnect()
		v_u_112:Disconnect()
		if v_u_6 then
			for _, v113 in pairs(v_u_11) do
				v113:Destroy()
			end
			table.clear(v_u_11)
		end
	end
end)
local v_u_115 = {}
local function v_u_117(p116)
	-- upvalues: (copy) v_u_114
	v_u_114:bindRoot(p116)
end
local function v_u_119(p118)
	-- upvalues: (copy) v_u_114
	v_u_114:unbindRoot(p118)
end
local function v126(p120)
	-- upvalues: (copy) v_u_115, (copy) v_u_114, (copy) v_u_117, (copy) v_u_119
	local v121 = v_u_115[p120]
	if not v121 then
		v121 = {}
		v_u_115[p120] = v121
	end
	if p120.Character then
		v_u_114:bindRoot(p120.Character)
	end
	local v122 = p120.CharacterAdded
	local v123 = v_u_117
	table.insert(v121, v122:Connect(v123))
	local v124 = p120.CharacterRemoving
	local v125 = v_u_119
	table.insert(v121, v124:Connect(v125))
end
local function v130(p127)
	-- upvalues: (copy) v_u_115, (copy) v_u_114
	local v128 = v_u_115[p127]
	if v128 then
		for _, v129 in ipairs(v128) do
			v129:Disconnect()
		end
		v_u_115[p127] = nil
	end
	if p127.Character then
		v_u_114:unbindRoot(p127.Character)
	end
end
for _, v131 in ipairs(v1:GetPlayers()) do
	task.spawn(v126, v131)
end
v1.PlayerAdded:Connect(v126)
v1.PlayerRemoving:Connect(v130)