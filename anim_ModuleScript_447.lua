-- anim (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > tween
-- Original

local v1 = {}
local v_u_2 = {}
local v_u_4 = setmetatable({}, {
	["__index"] = function(_, p3)
		error(("No interpolator is defined for type %s."):format((tostring(p3))), 4)
	end
})
function v_u_4.bool(p_u_5, p_u_6)
	return function(p7)
		-- upvalues: (copy) p_u_5, (copy) p_u_6
		if p7 < 0.5 then
			return p_u_5
		else
			return p_u_6
		end
	end
end
function v_u_4.number(p_u_8, p9)
	local v_u_10 = p9 - p_u_8
	return function(p11)
		-- upvalues: (copy) p_u_8, (copy) v_u_10
		return p_u_8 + v_u_10 * p11
	end
end
local v_u_12 = string.match
local v_u_13 = string.format
local v_u_14 = tonumber
function v_u_4.string(p15, p16)
	-- upvalues: (copy) v_u_12, (copy) v_u_14, (copy) v_u_13
	local v_u_17 = nil
	local v_u_18 = nil
	local v19, v20, v21, v22 = v_u_12(p15, "^([+-]?)(%d*):[+-]?(%d*):[+-]?(%d*)$")
	local v23, v24, v25, v26 = v_u_12(p16, "^([+-]?)(%d*):[+-]?(%d*):[+-]?(%d*)$")
	if v19 and v23 then
		v_u_17 = 3600 * (v_u_14(v20) or 0) + 60 * (v_u_14(v21) or 0) + (v_u_14(v22) or 0)
		local v27 = 3600 * (v_u_14(v24) or 0) + 60 * (v_u_14(v25) or 0) + (v_u_14(v26) or 0)
		if v19 == "-" then
			v_u_17 = -v_u_17
		end
		local v28 = 43200
		if v23 == "-" or not v27 then
			v27 = -v27
		end
		v_u_18 = (v28 + v27 - v_u_17) % 86400 - 43200
	else
		error("Invalid TimeOfDay string", 4)
	end
	return function(p29)
		-- upvalues: (ref) v_u_17, (ref) v_u_18, (ref) v_u_13
		local v30 = (v_u_17 + v_u_18 * p29) % 86400
		local v31 = v30 > 0 and v30 and v30 or -v30
		return v_u_13(v30 < 0 and "-%.2u:%.2u:%.2u" or "%.2u:%.2u:%.2u", (v31 - v31 % 3600) / 3600, (v31 % 3600 - v31 % 60) / 60, v31 % 60)
	end
end
local v_u_32 = CFrame.new().lerp
function v_u_4.CFrame(p_u_33, p_u_34)
	-- upvalues: (copy) v_u_32
	return function(p35)
		-- upvalues: (ref) v_u_32, (copy) p_u_33, (copy) p_u_34
		return v_u_32(p_u_33, p_u_34, p35)
	end
end
local v_u_36 = math.clamp
local v_u_37 = Color3.new
local v_u_38 = v_u_37(0, 0, 0)
local function v_u_49(p39)
	local v40 = p39.r
	local v41 = p39.g
	local v42 = p39.b
	local v43 = v40 < 0.0404482362771076 and v40 / 12.92 or 0.87941546140213 * (v40 + 0.055) ^ 2.4
	local v44 = v41 < 0.0404482362771076 and v41 / 12.92 or 0.87941546140213 * (v41 + 0.055) ^ 2.4
	local v45 = v42 < 0.0404482362771076 and v42 / 12.92 or 0.87941546140213 * (v42 + 0.055) ^ 2.4
	local v46 = 0.2125862307855956 * v43 + 0.7151703037034108 * v44 + 0.0722004986433362 * v45
	local v47 = 3.6590806972265884 * v43 + 11.442689580057424 * v44 + 4.114991502426484 * v45
	local v48 = v46 > 0.008856451679035631 and 116 * v46 ^ 0.3333333333333333 - 16 or 903.296296296296 * v46
	if v47 > 1e-15 then
		return v48, v48 * (0.9257063972951867 * v43 - 0.8333736323779866 * v44 - 0.09209820666085898 * v45) / v47, v48 * (9 * v46 / v47 - 0.46832)
	else
		return v48, -0.19783 * v48, -0.46832 * v48
	end
end
function v_u_4.Color3(p50, p51)
	-- upvalues: (copy) v_u_49, (copy) v_u_38, (copy) v_u_37, (copy) v_u_36
	local v_u_52, v_u_53, v_u_54 = v_u_49(p50)
	local v_u_55, v_u_56, v_u_57 = v_u_49(p51)
	return function(p58)
		-- upvalues: (copy) v_u_52, (copy) v_u_55, (ref) v_u_38, (copy) v_u_53, (copy) v_u_56, (copy) v_u_54, (copy) v_u_57, (ref) v_u_37, (ref) v_u_36
		local v59 = (1 - p58) * v_u_52 + p58 * v_u_55
		if v59 < 0.0197955 then
			return v_u_38
		end
		local v60 = ((1 - p58) * v_u_53 + p58 * v_u_56) / v59 + 0.19783
		local v61 = ((1 - p58) * v_u_54 + p58 * v_u_57) / v59 + 0.46832
		local v62 = (v59 + 16) / 116
		local v63 = v62 > 0.20689655172413793 and v62 * v62 * v62 or 0.12841854934601665 * v62 - 0.01771290335807126
		local v64 = v63 * v60 / v61
		local v65 = v63 * ((3 - 0.75 * v60) / v61 - 5)
		local v66 = 7.2914074 * v64 - 1.537208 * v63 - 0.4986286 * v65
		local v67 = -2.180094 * v64 + 1.8757561 * v63 + 0.0415175 * v65
		local v68 = 0.1253477 * v64 - 0.2040211 * v63 + 1.0569959 * v65
		if v66 < 0 and (v66 < v67 and v66 < v68) then
			v67 = v67 - v66
			v68 = v68 - v66
			v66 = 0
		elseif v67 < 0 and v67 < v68 then
			v66 = v66 - v67
			v68 = v68 - v67
			v67 = 0
		elseif v68 < 0 then
			v66 = v66 - v68
			v67 = v67 - v68
			v68 = 0
		end
		return v_u_37(v_u_36(v66 < 0.0031306684425 and 12.92 * v66 or 1.055 * v66 ^ 0.4166666666666667 - 0.055, 0, 1), v_u_36(v67 < 0.0031306684425 and 12.92 * v67 or 1.055 * v67 ^ 0.4166666666666667 - 0.055, 0, 1), (v_u_36(v68 < 0.0031306684425 and 12.92 * v68 or 1.055 * v68 ^ 0.4166666666666667 - 0.055, 0, 1)))
	end
end
local v_u_69 = NumberRange.new
function v_u_4.NumberRange(p70, p71)
	-- upvalues: (copy) v_u_69
	local v_u_72 = p70.Min
	local v_u_73 = p70.Max
	local v_u_74 = p71.Min - v_u_72
	local v_u_75 = p71.Max - v_u_73
	return function(p76)
		-- upvalues: (ref) v_u_69, (copy) v_u_72, (copy) v_u_74, (copy) v_u_73, (copy) v_u_75
		return v_u_69(v_u_72 + p76 * v_u_74, v_u_73 + p76 * v_u_75)
	end
end
local v_u_77 = NumberSequenceKeypoint.new
function v_u_4.NumberSequenceKeypoint(p78, p79)
	-- upvalues: (copy) v_u_77
	local v_u_80 = p78.Time
	local v_u_81 = p78.Value
	local v_u_82 = p78.Envelope
	local v_u_83 = p79.Time - v_u_80
	local v_u_84 = p79.Value - v_u_81
	local v_u_85 = p79.Envelope - v_u_82
	return function(p86)
		-- upvalues: (ref) v_u_77, (copy) v_u_80, (copy) v_u_83, (copy) v_u_81, (copy) v_u_84, (copy) v_u_82, (copy) v_u_85
		return v_u_77(v_u_80 + p86 * v_u_83, v_u_81 + p86 * v_u_84, v_u_82 + p86 * v_u_85)
	end
end
local v_u_87 = PhysicalProperties.new
function v_u_4.PhysicalProperties(p88, p89)
	-- upvalues: (copy) v_u_87
	local v_u_90 = p88.Density
	local v_u_91 = p88.Elasticity
	local v_u_92 = p88.ElasticityWeight
	local v_u_93 = p88.Friction
	local v_u_94 = p88.FrictionWeight
	local v_u_95 = p89.Density - v_u_90
	local v_u_96 = p89.Elasticity - v_u_91
	local v_u_97 = p89.ElasticityWeight - v_u_92
	local v_u_98 = p89.Friction - v_u_93
	local v_u_99 = p89.FrictionWeight - v_u_94
	return function(p100)
		-- upvalues: (ref) v_u_87, (copy) v_u_90, (copy) v_u_95, (copy) v_u_91, (copy) v_u_96, (copy) v_u_92, (copy) v_u_97, (copy) v_u_93, (copy) v_u_98, (copy) v_u_94, (copy) v_u_99
		return v_u_87(v_u_90 + p100 * v_u_95, v_u_91 + p100 * v_u_96, v_u_92 + p100 * v_u_97, v_u_93 + p100 * v_u_98, v_u_94 + p100 * v_u_99)
	end
end
local v_u_101 = Ray.new
local v_u_102 = Vector3.new
function v_u_4.Ray(p103, p104)
	-- upvalues: (copy) v_u_101, (copy) v_u_102
	local v105 = p103.Origin
	local v106 = p103.Direction
	local v107 = p104.Origin
	local v108 = p104.Direction
	local v_u_109 = v105.x
	local v_u_110 = v105.y
	local v_u_111 = v105.z
	local v_u_112 = v106.x
	local v_u_113 = v106.y
	local v_u_114 = v106.z
	local _ = v108.x
	local _ = v108.y
	local _ = v108.z
	local v_u_115 = v107.x - v_u_109
	local v_u_116 = v107.y - v_u_110
	local v_u_117 = v107.z - v_u_111
	local v_u_118 = v108.x - v_u_112
	local v_u_119 = v108.y - v_u_113
	local v_u_120 = v108.z - v_u_114
	return function(p121)
		-- upvalues: (ref) v_u_101, (copy) v_u_109, (copy) v_u_115, (copy) v_u_110, (copy) v_u_116, (copy) v_u_111, (copy) v_u_117, (ref) v_u_102, (copy) v_u_112, (copy) v_u_118, (copy) v_u_113, (copy) v_u_119, (copy) v_u_114, (copy) v_u_120
		return v_u_101(v_u_102(v_u_109 + p121 * v_u_115, v_u_110 + p121 * v_u_116, v_u_111 + p121 * v_u_117), (v_u_102(v_u_112 + p121 * v_u_118, v_u_113 + p121 * v_u_119, v_u_114 + p121 * v_u_120)))
	end
end
local v_u_122 = UDim.new
function v_u_4.UDim(p123, p124)
	-- upvalues: (copy) v_u_122
	local v_u_125 = p123.Scale
	local v_u_126 = p123.Offset
	local v_u_127 = p124.Scale - v_u_125
	local v_u_128 = p124.Offset - v_u_126
	return function(p129)
		-- upvalues: (ref) v_u_122, (copy) v_u_125, (copy) v_u_127, (copy) v_u_126, (copy) v_u_128
		return v_u_122(v_u_125 + p129 * v_u_127, v_u_126 + p129 * v_u_128)
	end
end
local v_u_130 = UDim2.new().Lerp
function v_u_4.UDim2(p_u_131, p_u_132)
	-- upvalues: (copy) v_u_130
	return function(p133)
		-- upvalues: (ref) v_u_130, (copy) p_u_131, (copy) p_u_132
		return v_u_130(p_u_131, p_u_132, p133)
	end
end
local v_u_134 = Vector2.new
function v_u_4.Vector2(p135, p136)
	-- upvalues: (copy) v_u_134
	local v_u_137 = p135.x
	local v_u_138 = p135.y
	local v_u_139 = p136.x - v_u_137
	local v_u_140 = p136.y - v_u_138
	return function(p141)
		-- upvalues: (ref) v_u_134, (copy) v_u_137, (copy) v_u_139, (copy) v_u_138, (copy) v_u_140
		return v_u_134(v_u_137 + p141 * v_u_139, v_u_138 + p141 * v_u_140)
	end
end
local v_u_142 = Vector3.new
function v_u_4.Vector3(p143, p144)
	-- upvalues: (copy) v_u_142
	local v_u_145 = p143.x
	local v_u_146 = p143.y
	local v_u_147 = p143.z
	local v_u_148 = p144.x - v_u_145
	local v_u_149 = p144.y - v_u_146
	local v_u_150 = p144.z - v_u_147
	return function(p151)
		-- upvalues: (copy) v_u_145, (copy) v_u_148, (copy) v_u_146, (copy) v_u_149, (copy) v_u_147, (copy) v_u_150, (ref) v_u_142
		return v_u_142(v_u_145 + p151 * v_u_148, v_u_146 + p151 * v_u_149, v_u_147 + p151 * v_u_150)
	end
end
local v_u_152 = {}
local v_u_153 = {}
local v154 = game:GetService("RunService")
local v_u_155
if v154:IsServer() and not v154:IsClient() then
	v_u_155 = v154.Heartbeat
else
	v_u_155 = v154.RenderStepped
end
local v_u_156 = v_u_155.Wait
local v_u_157 = next
local _ = tick
local v_u_158 = typeof
local v_u_159 = 0.016666666666666666
local v_u_160 = os.clock()
v_u_155:Connect(function()
	-- upvalues: (ref) v_u_160, (ref) v_u_159
	local v161 = os.clock()
	local v162 = v_u_159 + (v161 - v_u_160 - v_u_159) / 4
	v_u_160 = v161
	v_u_159 = v162
end)
local function v_u_191(p163, p164, p165, p166, p167, p168)
	-- upvalues: (ref) v_u_153, (ref) v_u_159, (copy) v_u_157, (copy) v_u_152, (copy) v_u_2, (copy) v_u_4, (copy) v_u_158, (copy) v_u_156, (ref) v_u_155
	local v169 = v_u_153[p163]
	if p165 and p165 >= v_u_159 then
		if type(p166) ~= "function" then
			p166 = v_u_2[p166]
		end
		local v170 = os.clock() - v_u_159
		local v171 = p166(v_u_159 / p165)
		local v172 = {}
		local v173 = {}
		local v174
		if v169 then
			v174 = true
		else
			v169 = {}
			v_u_153[p163] = v169
			v174 = false
		end
		for v175, v176 in v_u_157, p164 do
			if v174 or (v169[v175] or (-1 / 0)) <= p167 then
				local v177 = v_u_152[v175]
				if not v177 then
					v177 = {}
					v_u_152[v175] = v177
				end
				local v178 = ((v177[p163] or 0) + 1) % 9007199254740992
				local v179 = v_u_4[v_u_158(v176)](p163[v175], v176)
				v173[v175] = v178
				v177[p163] = v178
				v169[v175] = p167
				v172[v175] = v179
				p163[v175] = v179(v171)
			end
		end
		while true do
			v_u_156(v_u_155)
			local v180 = os.clock() - v170
			if p165 <= v180 then
				break
			end
			local v181 = p166(v180 / p165)
			for v182, v183 in v_u_157, v172 do
				if v_u_152[v182][p163] == v173[v182] then
					p163[v182] = v183(v181)
				else
					v172[v182] = nil
				end
			end
			if not v_u_157(v172) then
				break
			end
		end
		for v184, _ in v_u_157, v172 do
			local v185 = v_u_152[v184]
			p163[v184] = p164[v184]
			v185[p163] = nil
			v169[v184] = nil
		end
		if not v_u_157(v169) then
			v_u_153[p163] = nil
		end
		if p168 then
			return p168()
		end
	else
		for v186, v187 in v_u_157, p164 do
			local v188
			if v169 then
				v188 = v169[v186]
			else
				v188 = v169
			end
			if (v188 or (-1 / 0)) <= p167 then
				local v189 = v_u_152[v186]
				local v190 = v189 and v189[p163]
				if v190 then
					v189[p163] = (v190 + 1) % 9007199254740992
				end
				if v188 then
					v169[v186] = nil
				end
				p163[v186] = v187
			end
		end
		if p168 then
			return p168()
		end
	end
end
local v_u_192 = type
local v_u_193 = coroutine.wrap
local v_u_194 = select
local function v_u_203(p195, p196, ...)
	-- upvalues: (copy) v_u_192, (copy) v_u_194
	local v197 = v_u_192(p196)
	local v198 = true
	local v199 = { ... }
	for v200 = 1, v_u_194("#", ...) do
		if v198 then
			v198 = v199[v200] ~= v197
		end
	end
	if v198 then
		local v201 = error
		local v202 = debug.traceback():gmatch("Script \'.-\', Line %d+ %- [globacupvefidmth]+ ([_%a][_%w]*)\n")
		v202()
		v202()
		v201(("bad argument #%u to %s (%s expected, got %s)"):format(p195, v202(), table.concat(v199, " or "), v197), 3)
	end
end
function v1.Animate(p204, p205, p206, p207, p208)
	-- upvalues: (ref) v_u_203, (ref) v_u_191
	v_u_203(1, p204, "userdata", "table")
	v_u_203(2, p205, "table")
	v_u_203(3, p206, "nil", "number")
	v_u_203(4, p207, "nil", "string", "function")
	v_u_203(5, p208, "nil", "number")
	return v_u_191(p204, p205, p206, p207, p208 or 0)
end
function v1.AnimateAsync(p209, p210, p211, p212, p213, p214)
	-- upvalues: (ref) v_u_203, (copy) v_u_193, (ref) v_u_191
	v_u_203(1, p209, "userdata", "table")
	v_u_203(2, p210, "table")
	v_u_203(3, p211, "nil", "number")
	v_u_203(4, p212, "nil", "string", "function")
	v_u_203(5, p213, "nil", "number")
	v_u_203(6, p214, "nil", "function")
	return v_u_193(v_u_191)(p209, p210, p211, p212, p213 or 0, p214)
end
function v1.Interrupt(p215)
	-- upvalues: (ref) v_u_203, (copy) v_u_152, (ref) v_u_153
	v_u_203(1, p215, "nil", "userdata", "table")
	for _, v216 in next, v_u_152 do
		if not p215 or v216[p215] then
			v216[p215] = nil
		end
	end
	if p215 then
		v_u_153[p215] = nil
	else
		v_u_153 = {}
	end
end
local v_u_217 = math.cos
local v_u_218 = math.sin
local v_u_219 = math.exp
function v_u_2.linear(p220)
	return p220
end
function v_u_2.inQuad(p221)
	return p221 * p221
end
function v_u_2.outQuad(p222)
	return p222 * (2 - p222)
end
function v_u_2.inOutQuad(p223)
	if p223 < 0.5 then
		return 2 * p223 * p223
	else
		return 2 * (2 - p223) * p223 - 1
	end
end
function v_u_2.inCube(p224)
	return p224 * p224 * p224
end
function v_u_2.outCube(p225)
	return 1 - (1 - p225) * (1 - p225) * (1 - p225)
end
function v_u_2.inOutCube(p226)
	if p226 < 0.5 then
		return 4 * p226 * p226 * p226
	else
		return 1 + 4 * (p226 - 1) * (p226 - 1) * (p226 - 1)
	end
end
function v_u_2.inQuart(p227)
	return p227 * p227 * (p227 * p227)
end
function v_u_2.outQuart(p228)
	return 1 - (p228 - 1) * (p228 - 1) * ((p228 - 1) * (p228 - 1))
end
function v_u_2.inOutQuart(p229)
	if p229 < 0.5 then
		return 8 * (p229 * p229) * (p229 * p229)
	else
		return 1 - 8 * ((p229 - 1) * (p229 - 1)) * ((p229 - 1) * (p229 - 1))
	end
end
function v_u_2.inQuint(p230)
	return p230 * p230 * (p230 * p230) * p230
end
function v_u_2.outQuint(p231)
	local v232 = p231 - 1
	return v232 * v232 * (v232 * v232) * v232 + 1
end
function v_u_2.inOutQuint(p233)
	if p233 < 0.5 then
		return 16 * (p233 * p233) * (p233 * p233) * p233
	end
	local v234 = p233 - 1
	return 16 * (v234 * v234) * (v234 * v234) * v234 + 1
end
function v_u_2.inBack(p235)
	return p235 * p235 * (3 * p235 - 2)
end
function v_u_2.outBack(p236)
	return (p236 - 1) * (p236 - 1) * (p236 * 2 + p236 - 1) + 1
end
function v_u_2.inOutBack(p237)
	if p237 < 0.5 then
		return 2 * p237 * p237 * (6 * p237 - 2)
	else
		return 1 + 2 * (p237 - 1) * (p237 - 1) * (6 * p237 - 2 - 2)
	end
end
function v_u_2.inSine(p238)
	-- upvalues: (copy) v_u_217
	return 1 - v_u_217(p238 * 1.5707963267948966)
end
function v_u_2.outSine(p239)
	-- upvalues: (copy) v_u_218
	return v_u_218(p239 * 1.5707963267948966)
end
function v_u_2.inOutSine(p240)
	-- upvalues: (copy) v_u_217
	return (1 - v_u_217(3.141592653589793 * p240)) / 2
end
function v_u_2.outBounce(p241)
	if p241 < 0.36363636363636365 then
		return 7.5625 * p241 * p241
	elseif p241 < 0.7272727272727273 then
		return 3 + p241 * (11 * p241 - 12) * 0.6875
	elseif p241 < 0.9090909090909091 then
		return 6 + p241 * (11 * p241 - 18) * 0.6875
	else
		return 7.875 + p241 * (11 * p241 - 21) * 0.6875
	end
end
function v_u_2.inBounce(p242)
	if p242 > 0.6363636363636364 then
		return 1 - (p242 - 1) * (p242 - 1) * 7.5625
	elseif p242 > 0.2727272727272727 then
		return (11 * p242 - 7) * (11 * p242 - 3) / -16
	elseif p242 > 0.09090909090909091 then
		return (11 * (4 - 11 * p242) * p242 - 3) / 16
	else
		return p242 * (11 * p242 - 1) * -0.6875
	end
end
local v_u_243 = 3.141592653589793 * (4 * 2 - 1.5)
local v244 = 1
local v245 = 0
while true do
	local v246 = v_u_218(v_u_243 * v244)
	local v247 = v_u_217(v_u_243 * v244)
	local v248 = v244 + (v_u_243 * 2 * (v244 * 8 + 1) * v247 + ((v244 * 8 + 2) * 8 - v_u_243 * v_u_243 * v244) * v246) / (v_u_243 * (v_u_243 * v_u_243 * v244 - (v244 * 8 + 2) * 24) * v247 + (v_u_243 * 3 * v_u_243 * (v244 * 8 + 1) - (v244 * 8 + 3) * 64) * v246)
	v245 = v245 + 1
	if v244 <= v248 or v245 > 63 then
		break
	end
	v244 = v248
end
local v_u_249 = v248
local v_u_250 = 1 / (v_u_219((v248 - 1) * 8) * v248 * v_u_218(v_u_243 * v248))
function v_u_2.inElastic(p251)
	-- upvalues: (ref) v_u_249, (copy) v_u_219, (ref) v_u_243, (copy) v_u_218, (ref) v_u_250
	return v_u_219((p251 * v_u_249 - 1) * 8) * p251 * v_u_249 * v_u_218(v_u_243 * p251 * v_u_249) * v_u_250
end
function v_u_2.outElastic(p252)
	-- upvalues: (ref) v_u_249, (copy) v_u_219, (ref) v_u_243, (copy) v_u_218, (ref) v_u_250
	return 1 + v_u_219(8 * (v_u_249 - v_u_249 * p252 - 1)) * v_u_249 * (p252 - 1) * v_u_218(v_u_243 * v_u_249 * (1 - p252)) * v_u_250
end
function v_u_2.inOutElastic(p253)
	-- upvalues: (ref) v_u_249, (copy) v_u_219, (ref) v_u_243, (copy) v_u_218, (ref) v_u_250
	if p253 < 0.5 then
		return v_u_219(8 * (2 * v_u_249 * p253 - 1)) * v_u_249 * p253 * v_u_218(v_u_243 * 2 * v_u_249 * p253) * v_u_250
	else
		return 1 + v_u_219(8 * (v_u_249 * (2 - 2 * p253) - 1)) * v_u_249 * (p253 - 1) * v_u_218(v_u_243 * v_u_249 * (2 - 2 * p253)) * v_u_250
	end
end
function v_u_2.inExpo(p254)
	-- upvalues: (copy) v_u_219
	return p254 * p254 * v_u_219(4 * (p254 - 1))
end
function v_u_2.outExpo(p255)
	-- upvalues: (copy) v_u_219
	return 1 - (1 - p255) * (1 - p255) / v_u_219(4 * p255)
end
function v_u_2.inOutExpo(p256)
	-- upvalues: (copy) v_u_219
	if p256 < 0.5 then
		return 2 * p256 * p256 * v_u_219(4 * (2 * p256 - 1))
	else
		return 1 - 2 * (p256 - 1) * (p256 - 1) * v_u_219(4 * (1 - 2 * p256))
	end
end
setmetatable(v_u_2, {
	["__index"] = function(_, p257)
		error(tostring(p257) .. " is not a valid easing style.", 2)
	end
})
return v1