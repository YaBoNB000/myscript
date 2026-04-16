-- Promise (ModuleScript)
-- ReplicatedStorage > devv > vendor
-- Original

local v_u_1 = {
	["__mode"] = "k"
}
local v2 = game:GetService("RunService")
local function v8(p_u_3, p4)
	local v5 = {}
	for _, v6 in ipairs(p4) do
		v5[v6] = v6
	end
	return setmetatable(v5, {
		["__index"] = function(_, p7)
			-- upvalues: (copy) p_u_3
			error(("%s is not in %s!"):format(p7, p_u_3), 2)
		end,
		["__newindex"] = function()
			-- upvalues: (copy) p_u_3
			error(("Creating new members in %s is not allowed!"):format(p_u_3), 2)
		end
	})
end
local v_u_9 = {
	["Kind"] = v8("Promise.Error.Kind", {
		"ExecutionError",
		"AlreadyCancelled",
		"NotResolvedInTime",
		"TimedOut"
	})
}
v_u_9.__index = v_u_9
function v_u_9.new(p10, p11)
	-- upvalues: (ref) v_u_9
	local v12 = p10 or {}
	local v13 = {}
	local v14 = v12.error
	v13.error = tostring(v14) or "[This error has no error text.]"
	v13.trace = v12.trace
	v13.context = v12.context
	v13.kind = v12.kind
	v13.parent = p11
	v13.createdTick = tick()
	v13.createdTrace = debug.traceback()
	local v15 = v_u_9
	return setmetatable(v13, v15)
end
function v_u_9.is(p16)
	if type(p16) == "table" then
		local v17 = getmetatable(p16)
		if type(v17) == "table" then
			local v18
			if rawget(p16, "error") == nil then
				v18 = false
			else
				local v19 = rawget(v17, "extend")
				v18 = type(v19) == "function"
			end
			return v18
		end
	end
	return false
end
function v_u_9.isKind(p20, p21)
	-- upvalues: (ref) v_u_9
	local v22 = p21 ~= nil
	assert(v22, "Argument #2 to Promise.Error.isKind must not be nil")
	local v23 = v_u_9.is(p20)
	if v23 then
		v23 = p20.kind == p21
	end
	return v23
end
function v_u_9.extend(p24, p25)
	-- upvalues: (ref) v_u_9
	local v26 = p25 or {}
	v26.kind = v26.kind or p24.kind
	return v_u_9.new(v26, p24)
end
function v_u_9.getErrorChain(p27)
	local v28 = { p27 }
	while v28[#v28].parent do
		local v29 = v28[#v28].parent
		table.insert(v28, v29)
	end
	return v28
end
function v_u_9.__tostring(p30)
	local v31 = { ("-- Promise.Error(%s) --"):format(p30.kind or "?") }
	for _, v32 in ipairs(p30:getErrorChain()) do
		local v33 = table.concat
		local v34 = { v32.trace or v32.error, v32.context }
		table.insert(v31, v33(v34, "\n"))
	end
	return table.concat(v31, "\n")
end
local function v_u_35(...)
	return select("#", ...), { ... }
end
local function v_u_37(p36, ...)
	return p36, select("#", ...), { ... }
end
local function v_u_44(p_u_38, p39, ...)
	-- upvalues: (copy) v_u_37, (ref) v_u_9
	local v40 = v_u_37
	local v41 = xpcall
	local v42 = p_u_38 ~= nil
	assert(v42)
	return v40(v41(p39, function(p43)
		-- upvalues: (ref) v_u_9, (copy) p_u_38
		if type(p43) == "table" then
			return p43
		else
			return v_u_9.new({
				["error"] = p43,
				["kind"] = v_u_9.Kind.ExecutionError,
				["trace"] = debug.traceback(tostring(p43), 2),
				["context"] = "Promise created at:\n\n" .. p_u_38
			})
		end
	end, ...))
end
local v_u_45 = {
	["Error"] = v_u_9,
	["Status"] = v8("Promise.Status", {
		"Started",
		"Resolved",
		"Rejected",
		"Cancelled"
	}),
	["_timeEvent"] = v2.Heartbeat,
	["_getTime"] = tick,
	["prototype"] = {}
}
v_u_45.__index = v_u_45.prototype
function v_u_45._new(p46, p_u_47, p48)
	-- upvalues: (copy) v_u_45, (copy) v_u_1, (copy) v_u_44
	if p48 ~= nil and not v_u_45.is(p48) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end
	local v_u_49 = {
		["_source"] = p46,
		["_status"] = v_u_45.Status.Started,
		["_values"] = nil,
		["_valuesLength"] = -1,
		["_unhandledRejection"] = true,
		["_queuedResolve"] = {},
		["_queuedReject"] = {},
		["_queuedFinally"] = {},
		["_cancellationHook"] = nil,
		["_parent"] = p48
	}
	local v50 = v_u_1
	v_u_49._consumers = setmetatable({}, v50)
	if p48 and p48._status == v_u_45.Status.Started then
		p48._consumers[v_u_49] = true
	end
	local v51 = v_u_45
	setmetatable(v_u_49, v51)
	local function v_u_52(...)
		-- upvalues: (copy) v_u_49
		v_u_49:_resolve(...)
	end
	local function v_u_53(...)
		-- upvalues: (copy) v_u_49
		v_u_49:_reject(...)
	end
	local function v_u_55(p54)
		-- upvalues: (copy) v_u_49, (ref) v_u_45
		if p54 then
			if v_u_49._status == v_u_45.Status.Cancelled then
				p54()
			else
				v_u_49._cancellationHook = p54
			end
		end
		return v_u_49._status == v_u_45.Status.Cancelled
	end
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_44, (copy) v_u_49, (copy) p_u_47, (copy) v_u_52, (copy) v_u_53, (copy) v_u_55
		local v56, _, v57 = v_u_44(v_u_49._source, p_u_47, v_u_52, v_u_53, v_u_55)
		if not v56 then
			v_u_53(v57[1])
		end
	end)()
	return v_u_49
end
function v_u_45.new(p58)
	-- upvalues: (copy) v_u_45
	return v_u_45._new(debug.traceback(nil, 2), p58)
end
function v_u_45.__tostring(p59)
	return ("Promise(%s)"):format(p59:getStatus())
end
function v_u_45.defer(p_u_60)
	-- upvalues: (copy) v_u_45, (copy) v_u_44
	local v_u_61 = debug.traceback(nil, 2)
	return v_u_45._new(v_u_61, function(p_u_62, p_u_63, p_u_64)
		-- upvalues: (ref) v_u_45, (ref) v_u_44, (copy) v_u_61, (copy) p_u_60
		local v_u_65 = nil
		v_u_65 = v_u_45._timeEvent:Connect(function()
			-- upvalues: (ref) v_u_65, (ref) v_u_44, (ref) v_u_61, (ref) p_u_60, (copy) p_u_62, (copy) p_u_63, (copy) p_u_64
			v_u_65:Disconnect()
			local v66, _, v67 = v_u_44(v_u_61, p_u_60, p_u_62, p_u_63, p_u_64)
			if not v66 then
				p_u_63(v67[1])
			end
		end)
	end)
end
v_u_45.async = v_u_45.defer
function v_u_45.resolve(...)
	-- upvalues: (copy) v_u_35, (copy) v_u_45
	local v_u_68, v_u_69 = v_u_35(...)
	return v_u_45._new(debug.traceback(nil, 2), function(p70)
		-- upvalues: (copy) v_u_69, (copy) v_u_68
		local v71 = v_u_69
		local v72 = v_u_68
		p70(unpack(v71, 1, v72))
	end)
end
function v_u_45.reject(...)
	-- upvalues: (copy) v_u_35, (copy) v_u_45
	local v_u_73, v_u_74 = v_u_35(...)
	return v_u_45._new(debug.traceback(nil, 2), function(_, p75)
		-- upvalues: (copy) v_u_74, (copy) v_u_73
		local v76 = v_u_74
		local v77 = v_u_73
		p75(unpack(v76, 1, v77))
	end)
end
function v_u_45._try(p78, p_u_79, ...)
	-- upvalues: (copy) v_u_35, (copy) v_u_45
	local v_u_80, v_u_81 = v_u_35(...)
	return v_u_45._new(p78, function(p82, _)
		-- upvalues: (copy) p_u_79, (copy) v_u_81, (copy) v_u_80
		local v83 = v_u_81
		local v84 = v_u_80
		p82(p_u_79(unpack(v83, 1, v84)))
	end)
end
function v_u_45.try(...)
	-- upvalues: (copy) v_u_45
	return v_u_45._try(debug.traceback(nil, 2), ...)
end
function v_u_45._all(p85, p_u_86, p_u_87)
	-- upvalues: (copy) v_u_45
	if type(p_u_86) ~= "table" then
		error(("Please pass a list of promises to %s"):format("Promise.all"), 3)
	end
	for v88, v89 in pairs(p_u_86) do
		if not v_u_45.is(v89) then
			error(("Non-promise value passed into %s at index %s"):format("Promise.all", (tostring(v88))), 3)
		end
	end
	if #p_u_86 == 0 or p_u_87 == 0 then
		return v_u_45.resolve({})
	else
		return v_u_45._new(p85, function(p_u_90, p_u_91, p92)
			-- upvalues: (copy) p_u_87, (copy) p_u_86
			local v_u_93 = {}
			local v_u_94 = {}
			local v_u_95 = 0
			local v_u_96 = 0
			local v_u_97 = false
			local function v_u_100(p98, ...)
				-- upvalues: (ref) v_u_97, (ref) v_u_95, (ref) p_u_87, (copy) v_u_93, (ref) p_u_86, (copy) p_u_90, (copy) v_u_94
				if not v_u_97 then
					v_u_95 = v_u_95 + 1
					if p_u_87 == nil then
						v_u_93[p98] = ...
					else
						v_u_93[v_u_95] = ...
					end
					if v_u_95 >= (p_u_87 or #p_u_86) then
						v_u_97 = true
						p_u_90(v_u_93)
						for _, v99 in ipairs(v_u_94) do
							v99:cancel()
						end
					end
				end
			end
			p92(function()
				-- upvalues: (copy) v_u_94
				for _, v101 in ipairs(v_u_94) do
					v101:cancel()
				end
			end)
			local v_u_102 = v_u_97
			for v_u_103, v104 in ipairs(p_u_86) do
				local function v106(...)
					-- upvalues: (ref) v_u_96, (ref) p_u_87, (ref) p_u_86, (copy) v_u_94, (ref) v_u_102, (copy) p_u_91
					v_u_96 = v_u_96 + 1
					if p_u_87 == nil or #p_u_86 - v_u_96 < p_u_87 then
						for _, v105 in ipairs(v_u_94) do
							v105:cancel()
						end
						v_u_102 = true
						p_u_91(...)
					end
				end
				table.insert(v_u_94, v104:andThen(function(...)
					-- upvalues: (copy) v_u_100, (copy) v_u_103
					v_u_100(v_u_103, ...)
				end, v106))
			end
			if v_u_102 then
				for _, v107 in ipairs(v_u_94) do
					v107:cancel()
				end
			end
		end)
	end
end
function v_u_45.all(p108)
	-- upvalues: (copy) v_u_45
	return v_u_45._all(debug.traceback(nil, 2), p108)
end
function v_u_45.some(p109, p110)
	-- upvalues: (copy) v_u_45
	local v111 = type(p110) == "number"
	assert(v111, "Bad argument #2 to Promise.some: must be a number")
	return v_u_45._all(debug.traceback(nil, 2), p109, p110)
end
function v_u_45.any(p112)
	-- upvalues: (copy) v_u_45
	return v_u_45._all(debug.traceback(nil, 2), p112, 1):andThen(function(p113)
		return p113[1]
	end)
end
function v_u_45.allSettled(p_u_114)
	-- upvalues: (copy) v_u_45
	if type(p_u_114) ~= "table" then
		error(("Please pass a list of promises to %s"):format("Promise.allSettled"), 2)
	end
	for v115, v116 in pairs(p_u_114) do
		if not v_u_45.is(v116) then
			error(("Non-promise value passed into %s at index %s"):format("Promise.allSettled", (tostring(v115))), 2)
		end
	end
	if #p_u_114 == 0 then
		return v_u_45.resolve({})
	else
		return v_u_45._new(debug.traceback(nil, 2), function(p_u_117, _, p118)
			-- upvalues: (copy) p_u_114
			local v_u_119 = {}
			local v_u_120 = {}
			local v_u_121 = 0
			local function v_u_123(p122, ...)
				-- upvalues: (ref) v_u_121, (copy) v_u_119, (ref) p_u_114, (copy) p_u_117
				v_u_121 = v_u_121 + 1
				v_u_119[p122] = ...
				if v_u_121 >= #p_u_114 then
					p_u_117(v_u_119)
				end
			end
			p118(function()
				-- upvalues: (copy) v_u_120
				for _, v124 in ipairs(v_u_120) do
					v124:cancel()
				end
			end)
			for v_u_125, v126 in ipairs(p_u_114) do
				table.insert(v_u_120, v126:finally(function(...)
					-- upvalues: (copy) v_u_123, (copy) v_u_125
					v_u_123(v_u_125, ...)
				end))
			end
		end)
	end
end
function v_u_45.race(p_u_127)
	-- upvalues: (copy) v_u_45
	local v128 = type(p_u_127) == "table"
	assert(v128, ("Please pass a list of promises to %s"):format("Promise.race"))
	for v129, v130 in pairs(p_u_127) do
		local v131 = v_u_45.is(v130)
		local v132 = tostring(v129)
		assert(v131, ("Non-promise value passed into %s at index %s"):format("Promise.race", v132))
	end
	return v_u_45._new(debug.traceback(nil, 2), function(p_u_133, p_u_134, p135)
		-- upvalues: (copy) p_u_127
		local v_u_136 = {}
		local v_u_137 = false
		if not p135(function(...)
			-- upvalues: (copy) v_u_136, (ref) v_u_137, (copy) p_u_134
			for _, v138 in ipairs(v_u_136) do
				v138:cancel()
			end
			v_u_137 = true
			return p_u_134(...)
		end) then
			local v_u_139 = v_u_137
			for _, v140 in ipairs(p_u_127) do
				table.insert(v_u_136, v140:andThen(function(...)
					-- upvalues: (copy) v_u_136, (ref) v_u_139, (copy) p_u_133
					for _, v141 in ipairs(v_u_136) do
						v141:cancel()
					end
					v_u_139 = true
					return p_u_133(...)
				end, function(...)
					-- upvalues: (copy) v_u_136, (ref) v_u_139, (copy) p_u_134
					for _, v142 in ipairs(v_u_136) do
						v142:cancel()
					end
					v_u_139 = true
					return p_u_134(...)
				end))
			end
			if v_u_139 then
				for _, v143 in ipairs(v_u_136) do
					v143:cancel()
				end
			end
		end
	end)
end
function v_u_45.each(p_u_144, p_u_145)
	-- upvalues: (copy) v_u_45, (ref) v_u_9
	local v146 = type(p_u_144) == "table"
	assert(v146, ("Please pass a list of promises to %s"):format("Promise.each"))
	local v147 = type(p_u_145) == "function"
	assert(v147, ("Please pass a handler function to %s!"):format("Promise.each"))
	return v_u_45._new(debug.traceback(nil, 2), function(p148, p149, p150)
		-- upvalues: (copy) p_u_144, (ref) v_u_45, (ref) v_u_9, (copy) p_u_145
		local v151 = {}
		local v_u_152 = {}
		local v_u_153 = false
		p150(function()
			-- upvalues: (ref) v_u_153, (copy) v_u_152
			v_u_153 = true
			for _, v154 in ipairs(v_u_152) do
				v154:cancel()
			end
		end)
		local v155 = v_u_153
		local v156 = {}
		for v157, v158 in ipairs(p_u_144) do
			if v_u_45.is(v158) then
				if v158:getStatus() == v_u_45.Status.Cancelled then
					for _, v159 in ipairs(v_u_152) do
						v159:cancel()
					end
					return p149(v_u_9.new({
						["error"] = "Promise is cancelled",
						["kind"] = v_u_9.Kind.AlreadyCancelled,
						["context"] = ("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s"):format(v157, v158._source)
					}))
				end
				if v158:getStatus() == v_u_45.Status.Rejected then
					for _, v160 in ipairs(v_u_152) do
						v160:cancel()
					end
					return p149(select(2, v158:await()))
				end
				local v161 = v158:andThen(function(...)
					return ...
				end)
				table.insert(v_u_152, v161)
				v156[v157] = v161
			else
				v156[v157] = v158
			end
		end
		for v162, v165 in ipairs(v156) do
			if v_u_45.is(v165) then
				local v164, v165 = v165:await()
				if not v164 then
					for _, v166 in ipairs(v_u_152) do
						v166:cancel()
					end
					return p149(v165)
				end
			end
			if v155 then
				return
			end
			local v167 = v_u_45.resolve(p_u_145(v165, v162))
			table.insert(v_u_152, v167)
			local v168, v169 = v167:await()
			if not v168 then
				for _, v170 in ipairs(v_u_152) do
					v170:cancel()
				end
				return p149(v169)
			end
			v151[v162] = v169
		end
		p148(v151)
	end)
end
function v_u_45.is(p171)
	-- upvalues: (copy) v_u_45
	if type(p171) == "table" then
		local v172 = getmetatable(p171)
		if v172 == v_u_45 then
			return true
		elseif v172 == nil then
			local v173 = p171.andThen
			return type(v173) == "function"
		else
			if type(v172) == "table" then
				local v174 = rawget(v172, "andThen")
				if type(v174) == "function" then
					return true
				end
			end
			return false
		end
	else
		return false
	end
end
function v_u_45.promisify(p_u_175)
	-- upvalues: (copy) v_u_45
	return function(...)
		-- upvalues: (ref) v_u_45, (copy) p_u_175
		return v_u_45._try(debug.traceback(nil, 2), p_u_175, ...)
	end
end
local v_u_176 = nil
local v_u_177 = nil
function v_u_45.delay(p178)
	-- upvalues: (copy) v_u_45, (ref) v_u_177, (ref) v_u_176
	local v179 = type(p178) == "number"
	assert(v179, "Bad argument #1 to Promise.delay, must be a number.")
	local v_u_180 = (p178 < 0.016666666666666666 or p178 == (1 / 0)) and 0.016666666666666666 or p178
	return v_u_45._new(debug.traceback(nil, 2), function(p181, _, p182)
		-- upvalues: (ref) v_u_45, (ref) v_u_180, (ref) v_u_177, (ref) v_u_176
		local v183 = v_u_45._getTime()
		local v184 = v183 + v_u_180
		local v_u_185 = {
			["resolve"] = p181,
			["startTime"] = v183,
			["endTime"] = v184
		}
		if v_u_177 == nil then
			v_u_176 = v_u_185
			v_u_177 = v_u_45._timeEvent:Connect(function()
				-- upvalues: (ref) v_u_45, (ref) v_u_176, (ref) v_u_177
				local v186 = v_u_45._getTime()
				while v_u_176.endTime <= v186 do
					v_u_176.resolve(v_u_45._getTime() - v_u_176.startTime)
					v_u_176 = v_u_176.next
					if v_u_176 == nil then
						v_u_177:Disconnect()
						v_u_177 = nil
						return
					end
					v_u_176.previous = nil
				end
			end)
		elseif v_u_176.endTime < v184 then
			local v187 = v_u_176
			local v188 = v187.next
			while v188 ~= nil and v188.endTime < v184 do
				local v189 = v188.next
				v187 = v188
				v188 = v189
			end
			v187.next = v_u_185
			v_u_185.previous = v187
			if v188 ~= nil then
				v_u_185.next = v188
				v188.previous = v_u_185
			end
		else
			v_u_185.next = v_u_176
			v_u_176.previous = v_u_185
			v_u_176 = v_u_185
		end
		p182(function()
			-- upvalues: (copy) v_u_185, (ref) v_u_176, (ref) v_u_177
			local v190 = v_u_185.next
			if v_u_176 == v_u_185 then
				if v190 == nil then
					v_u_177:Disconnect()
					v_u_177 = nil
				else
					v190.previous = nil
				end
				v_u_176 = v190
			else
				local v191 = v_u_185.previous
				v191.next = v190
				if v190 ~= nil then
					v190.previous = v191
				end
			end
		end)
	end)
end
local function v196(p192, p_u_193, p_u_194)
	-- upvalues: (copy) v_u_45, (ref) v_u_9
	local v_u_195 = debug.traceback(nil, 2)
	return v_u_45.race({ v_u_45.delay(p_u_193):andThen(function()
			-- upvalues: (ref) v_u_45, (copy) p_u_194, (ref) v_u_9, (copy) p_u_193, (copy) v_u_195
			return v_u_45.reject(p_u_194 == nil and v_u_9.new({
				["kind"] = v_u_9.Kind.TimedOut,
				["error"] = "Timed out",
				["context"] = ("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s"):format(p_u_193, v_u_195)
			}) or p_u_194)
		end), p192 })
end
v_u_45.prototype.timeout = v196
function v_u_45.prototype.getStatus(p197)
	return p197._status
end
local function v222(p_u_198, p_u_199, p_u_200, p_u_201)
	-- upvalues: (copy) v_u_45, (copy) v_u_44, (ref) v_u_9
	p_u_198._unhandledRejection = false
	return v_u_45._new(p_u_199, function(p_u_202, p_u_203)
		-- upvalues: (copy) p_u_200, (copy) p_u_199, (ref) v_u_44, (copy) p_u_201, (copy) p_u_198, (ref) v_u_45, (ref) v_u_9
		local v204
		if p_u_200 then
			local v_u_205 = p_u_199
			local v_u_206 = p_u_200
			v204 = function(...)
				-- upvalues: (ref) v_u_44, (copy) v_u_205, (copy) v_u_206, (copy) p_u_202, (copy) p_u_203
				local v207, v208, v209 = v_u_44(v_u_205, v_u_206, ...)
				if v207 then
					p_u_202(unpack(v209, 1, v208))
				else
					p_u_203(v209[1])
				end
			end
		else
			v204 = p_u_202
		end
		local v210
		if p_u_201 then
			local v_u_211 = p_u_199
			local v_u_212 = p_u_201
			v210 = function(...)
				-- upvalues: (ref) v_u_44, (copy) v_u_211, (copy) v_u_212, (copy) p_u_202, (copy) p_u_203
				local v213, v214, v215 = v_u_44(v_u_211, v_u_212, ...)
				if v213 then
					p_u_202(unpack(v215, 1, v214))
				else
					p_u_203(v215[1])
				end
			end
		else
			v210 = p_u_203
		end
		if p_u_198._status == v_u_45.Status.Started then
			local v216 = p_u_198._queuedResolve
			table.insert(v216, v204)
			local v217 = p_u_198._queuedReject
			table.insert(v217, v210)
			return
		elseif p_u_198._status == v_u_45.Status.Resolved then
			local v218 = p_u_198._values
			local v219 = p_u_198._valuesLength
			v204(unpack(v218, 1, v219))
			return
		elseif p_u_198._status == v_u_45.Status.Rejected then
			local v220 = p_u_198._values
			local v221 = p_u_198._valuesLength
			v210(unpack(v220, 1, v221))
		elseif p_u_198._status == v_u_45.Status.Cancelled then
			p_u_203(v_u_9.new({
				["error"] = "Promise is cancelled",
				["kind"] = v_u_9.Kind.AlreadyCancelled,
				["context"] = "Promise created at\n\n" .. p_u_199
			}))
		end
	end, p_u_198)
end
v_u_45.prototype._andThen = v222
function v_u_45.prototype.andThen(p223, p224, p225)
	local v226 = p224 == nil and true or type(p224) == "function"
	assert(v226, ("Please pass a handler function to %s!"):format("Promise:andThen"))
	local v227 = p225 == nil and true or type(p225) == "function"
	assert(v227, ("Please pass a handler function to %s!"):format("Promise:andThen"))
	return p223:_andThen(debug.traceback(nil, 2), p224, p225)
end
function v_u_45.prototype.catch(p228, p229)
	local v230 = p229 == nil and true or type(p229) == "function"
	assert(v230, ("Please pass a handler function to %s!"):format("Promise:catch"))
	return p228:_andThen(debug.traceback(nil, 2), nil, p229)
end
function v_u_45.prototype.tap(p231, p_u_232)
	-- upvalues: (copy) v_u_45, (copy) v_u_35
	local v233 = type(p_u_232) == "function"
	assert(v233, ("Please pass a handler function to %s!"):format("Promise:tap"))
	return p231:_andThen(debug.traceback(nil, 2), function(...)
		-- upvalues: (copy) p_u_232, (ref) v_u_45, (ref) v_u_35
		local v234 = p_u_232(...)
		if not v_u_45.is(v234) then
			return ...
		end
		local v_u_235, v_u_236 = v_u_35(...)
		return v234:andThen(function()
			-- upvalues: (copy) v_u_236, (copy) v_u_235
			local v237 = v_u_236
			local v238 = v_u_235
			return unpack(v237, 1, v238)
		end)
	end)
end
function v_u_45.prototype.andThenCall(p239, p_u_240, ...)
	-- upvalues: (copy) v_u_35
	local v241 = type(p_u_240) == "function"
	assert(v241, ("Please pass a handler function to %s!"):format("Promise:andThenCall"))
	local v_u_242, v_u_243 = v_u_35(...)
	return p239:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_240, (copy) v_u_243, (copy) v_u_242
		local v244 = v_u_243
		local v245 = v_u_242
		return p_u_240(unpack(v244, 1, v245))
	end)
end
function v_u_45.prototype.andThenReturn(p246, ...)
	-- upvalues: (copy) v_u_35
	local v_u_247, v_u_248 = v_u_35(...)
	return p246:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_248, (copy) v_u_247
		local v249 = v_u_248
		local v250 = v_u_247
		return unpack(v249, 1, v250)
	end)
end
function v_u_45.prototype.cancel(p251)
	-- upvalues: (copy) v_u_45
	if p251._status == v_u_45.Status.Started then
		p251._status = v_u_45.Status.Cancelled
		if p251._cancellationHook then
			p251._cancellationHook()
		end
		if p251._parent then
			p251._parent:_consumerCancelled(p251)
		end
		for v252 in pairs(p251._consumers) do
			v252:cancel()
		end
		p251:_finalize()
	end
end
function v_u_45.prototype._consumerCancelled(p253, p254)
	-- upvalues: (copy) v_u_45
	if p253._status == v_u_45.Status.Started then
		p253._consumers[p254] = nil
		if next(p253._consumers) == nil then
			p253:cancel()
		end
	end
end
function v_u_45.prototype._finally(p_u_255, p_u_256, p_u_257, p_u_258)
	-- upvalues: (copy) v_u_45, (copy) v_u_44
	if not p_u_258 then
		p_u_255._unhandledRejection = false
	end
	return v_u_45._new(p_u_256, function(p_u_259, p_u_260)
		-- upvalues: (copy) p_u_257, (copy) p_u_256, (ref) v_u_44, (copy) p_u_258, (copy) p_u_255, (ref) v_u_45
		local v_u_261
		if p_u_257 then
			local v_u_262 = p_u_256
			local v_u_263 = p_u_257
			v_u_261 = function(...)
				-- upvalues: (ref) v_u_44, (copy) v_u_262, (copy) v_u_263, (copy) p_u_259, (copy) p_u_260
				local v264, v265, v266 = v_u_44(v_u_262, v_u_263, ...)
				if v264 then
					p_u_259(unpack(v266, 1, v265))
				else
					p_u_260(v266[1])
				end
			end
		else
			v_u_261 = p_u_259
		end
		local v267 = p_u_258 and function(...)
			-- upvalues: (ref) p_u_255, (ref) v_u_45, (copy) p_u_259, (copy) v_u_261
			if p_u_255._status == v_u_45.Status.Rejected then
				return p_u_259(p_u_255)
			else
				return v_u_261(...)
			end
		end or v_u_261
		if p_u_255._status == v_u_45.Status.Started then
			local v268 = p_u_255._queuedFinally
			table.insert(v268, v267)
		else
			v267(p_u_255._status)
		end
	end, p_u_255)
end
function v_u_45.prototype.finally(p269, p270)
	local v271 = p270 == nil and true or type(p270) == "function"
	assert(v271, ("Please pass a handler function to %s!"):format("Promise:finally"))
	return p269:_finally(debug.traceback(nil, 2), p270)
end
function v_u_45.prototype.finallyCall(p272, p_u_273, ...)
	-- upvalues: (copy) v_u_35
	local v274 = type(p_u_273) == "function"
	assert(v274, ("Please pass a handler function to %s!"):format("Promise:finallyCall"))
	local v_u_275, v_u_276 = v_u_35(...)
	return p272:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_273, (copy) v_u_276, (copy) v_u_275
		local v277 = v_u_276
		local v278 = v_u_275
		return p_u_273(unpack(v277, 1, v278))
	end)
end
function v_u_45.prototype.finallyReturn(p279, ...)
	-- upvalues: (copy) v_u_35
	local v_u_280, v_u_281 = v_u_35(...)
	return p279:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_281, (copy) v_u_280
		local v282 = v_u_281
		local v283 = v_u_280
		return unpack(v282, 1, v283)
	end)
end
function v_u_45.prototype.done(p284, p285)
	local v286 = p285 == nil and true or type(p285) == "function"
	assert(v286, ("Please pass a handler function to %s!"):format("Promise:finallyO"))
	return p284:_finally(debug.traceback(nil, 2), p285, true)
end
function v_u_45.prototype.doneCall(p287, p_u_288, ...)
	-- upvalues: (copy) v_u_35
	local v289 = type(p_u_288) == "function"
	assert(v289, ("Please pass a handler function to %s!"):format("Promise:doneCall"))
	local v_u_290, v_u_291 = v_u_35(...)
	return p287:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_288, (copy) v_u_291, (copy) v_u_290
		local v292 = v_u_291
		local v293 = v_u_290
		return p_u_288(unpack(v292, 1, v293))
	end, true)
end
function v_u_45.prototype.doneReturn(p294, ...)
	-- upvalues: (copy) v_u_35
	local v_u_295, v_u_296 = v_u_35(...)
	return p294:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_296, (copy) v_u_295
		local v297 = v_u_296
		local v298 = v_u_295
		return unpack(v297, 1, v298)
	end, true)
end
function v_u_45.prototype.awaitStatus(p299)
	-- upvalues: (copy) v_u_45
	p299._unhandledRejection = false
	if p299._status == v_u_45.Status.Started then
		local v_u_300 = Instance.new("BindableEvent")
		p299:finally(function()
			-- upvalues: (copy) v_u_300
			v_u_300:Fire()
		end)
		v_u_300.Event:Wait()
		v_u_300:Destroy()
	end
	if p299._status == v_u_45.Status.Resolved then
		local v301 = p299._status
		local v302 = p299._values
		local v303 = p299._valuesLength
		return v301, unpack(v302, 1, v303)
	end
	if p299._status ~= v_u_45.Status.Rejected then
		return p299._status
	end
	local v304 = p299._status
	local v305 = p299._values
	local v306 = p299._valuesLength
	return v304, unpack(v305, 1, v306)
end
local function v_u_308(p307, ...)
	-- upvalues: (copy) v_u_45
	return p307 == v_u_45.Status.Resolved, ...
end
function v_u_45.prototype.await(p309)
	-- upvalues: (copy) v_u_308
	return v_u_308(p309:awaitStatus())
end
local function v_u_311(p310, ...)
	-- upvalues: (copy) v_u_45
	if p310 ~= v_u_45.Status.Resolved then
		error(... == nil and "Expected Promise rejected with no value." or ..., 3)
	end
	return ...
end
function v_u_45.prototype.expect(p312)
	-- upvalues: (copy) v_u_311
	return v_u_311(p312:awaitStatus())
end
v_u_45.prototype.awaitValue = v_u_45.prototype.expect
function v_u_45.prototype._unwrap(p313)
	-- upvalues: (copy) v_u_45
	if p313._status == v_u_45.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	local v314 = p313._status == v_u_45.Status.Resolved
	local v315 = p313._values
	local v316 = p313._valuesLength
	return v314, unpack(v315, 1, v316)
end
local function v325(p_u_317, ...)
	-- upvalues: (copy) v_u_45, (ref) v_u_9, (copy) v_u_35
	if p_u_317._status == v_u_45.Status.Started then
		if v_u_45.is((...)) then
			if select("#", ...) > 1 then
				local v318 = ("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(p_u_317._source)
				warn(v318)
			end
			local v_u_319 = ...
			local v321 = v_u_319:andThen(function(...)
				-- upvalues: (copy) p_u_317
				p_u_317:_resolve(...)
			end, function(...)
				-- upvalues: (copy) v_u_319, (ref) v_u_9, (copy) p_u_317
				local v320 = v_u_319._values[1]
				if v_u_319._error then
					v320 = v_u_9.new({
						["error"] = v_u_319._error,
						["kind"] = v_u_9.Kind.ExecutionError,
						["context"] = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
					})
				end
				if v_u_9.isKind(v320, v_u_9.Kind.ExecutionError) then
					return p_u_317:_reject(v320:extend({
						["error"] = "This Promise was chained to a Promise that errored.",
						["trace"] = "",
						["context"] = ("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n"):format(p_u_317._source)
					}))
				end
				p_u_317:_reject(...)
			end)
			if v321._status == v_u_45.Status.Cancelled then
				p_u_317:cancel()
			elseif v321._status == v_u_45.Status.Started then
				p_u_317._parent = v321
				v321._consumers[p_u_317] = true
			end
		else
			p_u_317._status = v_u_45.Status.Resolved
			local v322, v323 = v_u_35(...)
			p_u_317._valuesLength = v322
			p_u_317._values = v323
			for _, v324 in ipairs(p_u_317._queuedResolve) do
				v324(...)
			end
			p_u_317:_finalize()
			return
		end
	else
		if v_u_45.is((...)) then
			(...):_consumerCancelled(p_u_317)
		end
		return
	end
end
v_u_45.prototype._resolve = v325
function v_u_45.prototype._reject(p_u_326, ...)
	-- upvalues: (copy) v_u_45, (copy) v_u_35
	if p_u_326._status == v_u_45.Status.Started then
		p_u_326._status = v_u_45.Status.Rejected
		local v327, v328 = v_u_35(...)
		p_u_326._valuesLength = v327
		p_u_326._values = v328
		local v329 = p_u_326._queuedReject
		if next(v329) == nil then
			local v_u_330 = tostring((...))
			coroutine.wrap(function()
				-- upvalues: (ref) v_u_45, (copy) p_u_326, (copy) v_u_330
				v_u_45._timeEvent:Wait()
				if p_u_326._unhandledRejection then
					local v331 = ("Unhandled Promise rejection:\n\n%s\n\n%s"):format(v_u_330, p_u_326._source)
					if not v_u_45.TEST then
						warn(v331)
					end
				else
					return
				end
			end)()
		else
			for _, v332 in ipairs(p_u_326._queuedReject) do
				v332(...)
			end
		end
		p_u_326:_finalize()
	end
end
function v_u_45.prototype._finalize(p333)
	-- upvalues: (copy) v_u_45
	for _, v334 in ipairs(p333._queuedFinally) do
		v334(p333._status)
	end
	if not v_u_45.TEST then
		p333._parent = nil
		p333._consumers = nil
	end
end
local function v339(p335, p336)
	-- upvalues: (copy) v_u_45, (ref) v_u_9
	local v337 = debug.traceback(nil, 2)
	if p335:getStatus() == v_u_45.Status.Resolved then
		return p335:_andThen(v337, function(...)
			return ...
		end)
	end
	local v338 = v_u_45.reject
	if p336 == nil then
		p336 = v_u_9.new({
			["kind"] = v_u_9.Kind.NotResolvedInTime,
			["error"] = "This Promise was not resolved in time for :now()",
			["context"] = ":now() was called at:\n\n" .. v337
		}) or p336
	end
	return v338(p336)
end
v_u_45.prototype.now = v339
function v_u_45.retry(p_u_340, p_u_341, ...)
	-- upvalues: (copy) v_u_45
	local v342 = type(p_u_340) == "function"
	assert(v342, "Parameter #1 to Promise.retry must be a function")
	local v343 = type(p_u_341) == "number"
	assert(v343, "Parameter #2 to Promise.retry must be a number")
	local v_u_344 = { ... }
	local v_u_345 = select("#", ...)
	return v_u_45.resolve(p_u_340(...)):catch(function(...)
		-- upvalues: (copy) p_u_341, (ref) v_u_45, (copy) p_u_340, (copy) v_u_344, (copy) v_u_345
		if p_u_341 <= 0 then
			return v_u_45.reject(...)
		end
		local v346 = v_u_344
		local v347 = v_u_345
		return v_u_45.retry(p_u_340, p_u_341 - 1, unpack(v346, 1, v347))
	end)
end
function v_u_45.fromEvent(p_u_348, p349)
	-- upvalues: (copy) v_u_45
	local v_u_350 = p349 or function()
		return true
	end
	return v_u_45._new(debug.traceback(nil, 2), function(p_u_351, _, p352)
		-- upvalues: (copy) p_u_348, (ref) v_u_350
		local v_u_353 = nil
		local v_u_354 = false
		local function v355()
			-- upvalues: (ref) v_u_353
			v_u_353:Disconnect()
			v_u_353 = nil
		end
		v_u_353 = p_u_348:Connect(function(...)
			-- upvalues: (ref) v_u_350, (copy) p_u_351, (ref) v_u_353, (ref) v_u_354
			local v356 = v_u_350(...)
			if v356 == true then
				p_u_351(...)
				if v_u_353 then
					v_u_353:Disconnect()
					v_u_353 = nil
				else
					v_u_354 = true
				end
			else
				if type(v356) ~= "boolean" then
					error("Promise.fromEvent predicate should always return a boolean")
				end
				return
			end
		end)
		if v_u_354 and v_u_353 then
			return v355()
		end
		p352(function()
			-- upvalues: (ref) v_u_353
			v_u_353:Disconnect()
			v_u_353 = nil
		end)
	end)
end
return v_u_45