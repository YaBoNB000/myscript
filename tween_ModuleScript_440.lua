-- tween (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > tween
-- Original

local v_u_1 = math.pow
local v_u_2 = math.sin
local v_u_3 = math.cos
local v_u_4 = math.sqrt
local v_u_5 = math.abs
local v_u_6 = math.asin
local function v_u_17(p7, p8, p9, p10, p11, p12)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_1, (copy) v_u_2
	if p7 == 0 then
		return p8
	end
	local v13 = p7 / p10
	if v13 == 1 then
		return p8 + p9
	end
	local v14 = p12 or p10 * 0.3
	local v15
	if p11 and p11 >= v_u_5(p9) then
		v15 = v14 / 6.283185307179586 * v_u_6(p9 / p11)
	else
		v15 = v14 / 4
		p11 = p9
	end
	local v16 = v13 - 1
	return -(p11 * v_u_1(2, 10 * v16) * v_u_2((v16 * p10 - v15) * 6.283185307179586 / v14)) + p8
end
local function v_u_27(p18, p19, p20, p21, p22, p23)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_1, (copy) v_u_2
	if p18 == 0 then
		return p19
	end
	local v24 = p18 / p21
	if v24 == 1 then
		return p19 + p20
	end
	local v25 = p23 or p21 * 0.3
	local v26
	if p22 and p22 >= v_u_5(p20) then
		v26 = v25 / 6.283185307179586 * v_u_6(p20 / p22)
	else
		v26 = v25 / 4
		p22 = p20
	end
	return p22 * v_u_1(2, -10 * v24) * v_u_2((v24 * p21 - v26) * 6.283185307179586 / v25) + p20 + p19
end
local function v_u_36(p28, p29, p30, p31)
	local v32 = p28 / p31
	if v32 < 0.36363636363636365 then
		return p30 * (7.5625 * v32 * v32) + p29
	elseif v32 < 0.7272727272727273 then
		local v33 = v32 - 0.5454545454545454
		return p30 * (7.5625 * v33 * v33 + 0.75) + p29
	elseif v32 < 0.9090909090909091 then
		local v34 = v32 - 0.8181818181818182
		return p30 * (7.5625 * v34 * v34 + 0.9375) + p29
	else
		local v35 = v32 - 0.9545454545454546
		return p30 * (7.5625 * v35 * v35 + 0.984375) + p29
	end
end
return {
	["linear"] = function(p37, p38, p39, p40)
		return p39 * p37 / p40 + p38
	end,
	["inQuad"] = function(p41, p42, p43, p44)
		-- upvalues: (copy) v_u_1
		return p43 * v_u_1(p41 / p44, 2) + p42
	end,
	["outQuad"] = function(p45, p46, p47, p48)
		local v49 = p45 / p48
		return -p47 * v49 * (v49 - 2) + p46
	end,
	["inOutQuad"] = function(p50, p51, p52, p53)
		-- upvalues: (copy) v_u_1
		local v54 = p50 / p53 * 2
		if v54 < 1 then
			return p52 / 2 * v_u_1(v54, 2) + p51
		else
			return -p52 / 2 * ((v54 - 1) * (v54 - 3) - 1) + p51
		end
	end,
	["outInQuad"] = function(p55, p56, p57, p58)
		-- upvalues: (copy) v_u_1
		if p55 >= p58 / 2 then
			local v59 = p55 * 2 - p58
			local v60 = p56 + p57 / 2
			return p57 / 2 * v_u_1(v59 / p58, 2) + v60
		end
		local v61 = p55 * 2
		local v62 = p57 / 2
		local v63 = v61 / p58
		return -v62 * v63 * (v63 - 2) + p56
	end,
	["inCubic"] = function(p64, p65, p66, p67)
		-- upvalues: (copy) v_u_1
		return p66 * v_u_1(p64 / p67, 3) + p65
	end,
	["outCubic"] = function(p68, p69, p70, p71)
		-- upvalues: (copy) v_u_1
		return p70 * (v_u_1(p68 / p71 - 1, 3) + 1) + p69
	end,
	["inOutCubic"] = function(p72, p73, p74, p75)
		local v76 = p72 / p75 * 2
		if v76 < 1 then
			return p74 / 2 * v76 * v76 * v76 + p73
		end
		local v77 = v76 - 2
		return p74 / 2 * (v77 * v77 * v77 + 2) + p73
	end,
	["outInCubic"] = function(p78, p79, p80, p81)
		-- upvalues: (copy) v_u_1
		if p78 < p81 / 2 then
			local v82 = p78 * 2
			return p80 / 2 * (v_u_1(v82 / p81 - 1, 3) + 1) + p79
		end
		local v83 = p78 * 2 - p81
		local v84 = p79 + p80 / 2
		return p80 / 2 * v_u_1(v83 / p81, 3) + v84
	end,
	["inQuart"] = function(p85, p86, p87, p88)
		-- upvalues: (copy) v_u_1
		return p87 * v_u_1(p85 / p88, 4) + p86
	end,
	["outQuart"] = function(p89, p90, p91, p92)
		-- upvalues: (copy) v_u_1
		local v93 = p89 / p92 - 1
		return -p91 * (v_u_1(v93, 4) - 1) + p90
	end,
	["inOutQuart"] = function(p94, p95, p96, p97)
		-- upvalues: (copy) v_u_1
		local v98 = p94 / p97 * 2
		if v98 < 1 then
			return p96 / 2 * v_u_1(v98, 4) + p95
		end
		local v99 = v98 - 2
		return -p96 / 2 * (v_u_1(v99, 4) - 2) + p95
	end,
	["outInQuart"] = function(p100, p101, p102, p103)
		-- upvalues: (copy) v_u_1
		if p100 >= p103 / 2 then
			local v104 = p100 * 2 - p103
			local v105 = p101 + p102 / 2
			return p102 / 2 * v_u_1(v104 / p103, 4) + v105
		end
		local v106 = p100 * 2
		local v107 = p102 / 2
		local v108 = v106 / p103 - 1
		return -v107 * (v_u_1(v108, 4) - 1) + p101
	end,
	["inQuint"] = function(p109, p110, p111, p112)
		-- upvalues: (copy) v_u_1
		return p111 * v_u_1(p109 / p112, 5) + p110
	end,
	["outQuint"] = function(p113, p114, p115, p116)
		-- upvalues: (copy) v_u_1
		return p115 * (v_u_1(p113 / p116 - 1, 5) + 1) + p114
	end,
	["inOutQuint"] = function(p117, p118, p119, p120)
		-- upvalues: (copy) v_u_1
		local v121 = p117 / p120 * 2
		if v121 < 1 then
			return p119 / 2 * v_u_1(v121, 5) + p118
		end
		local v122 = v121 - 2
		return p119 / 2 * (v_u_1(v122, 5) + 2) + p118
	end,
	["outInQuint"] = function(p123, p124, p125, p126)
		-- upvalues: (copy) v_u_1
		if p123 < p126 / 2 then
			local v127 = p123 * 2
			return p125 / 2 * (v_u_1(v127 / p126 - 1, 5) + 1) + p124
		end
		local v128 = p123 * 2 - p126
		local v129 = p124 + p125 / 2
		return p125 / 2 * v_u_1(v128 / p126, 5) + v129
	end,
	["inSine"] = function(p130, p131, p132, p133)
		-- upvalues: (copy) v_u_3
		return -p132 * v_u_3(p130 / p133 * 1.5707963267948966) + p132 + p131
	end,
	["outSine"] = function(p134, p135, p136, p137)
		-- upvalues: (copy) v_u_2
		return p136 * v_u_2(p134 / p137 * 1.5707963267948966) + p135
	end,
	["inOutSine"] = function(p138, p139, p140, p141)
		-- upvalues: (copy) v_u_3
		return -p140 / 2 * (v_u_3(3.141592653589793 * p138 / p141) - 1) + p139
	end,
	["outInSine"] = function(p142, p143, p144, p145)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		if p142 < p145 / 2 then
			local v146 = p142 * 2
			return p144 / 2 * v_u_2(v146 / p145 * 1.5707963267948966) + p143
		end
		local v147 = p142 * 2 - p145
		local v148 = p143 + p144 / 2
		local v149 = p144 / 2
		return -v149 * v_u_3(v147 / p145 * 1.5707963267948966) + v149 + v148
	end,
	["inExpo"] = function(p150, p151, p152, p153)
		-- upvalues: (copy) v_u_1
		if p150 == 0 then
			return p151
		else
			return p152 * v_u_1(2, 10 * (p150 / p153 - 1)) + p151 - p152 * 0.001
		end
	end,
	["outExpo"] = function(p154, p155, p156, p157)
		-- upvalues: (copy) v_u_1
		if p154 == p157 then
			return p155 + p156
		else
			return p156 * 1.001 * (-v_u_1(2, -10 * p154 / p157) + 1) + p155
		end
	end,
	["inOutExpo"] = function(p158, p159, p160, p161)
		-- upvalues: (copy) v_u_1
		if p158 == 0 then
			return p159
		end
		if p158 == p161 then
			return p159 + p160
		end
		local v162 = p158 / p161 * 2
		if v162 < 1 then
			return p160 / 2 * v_u_1(2, 10 * (v162 - 1)) + p159 - p160 * 0.0005
		end
		local v163 = v162 - 1
		return p160 / 2 * 1.0005 * (-v_u_1(2, -10 * v163) + 2) + p159
	end,
	["outInExpo"] = function(p164, p165, p166, p167)
		-- upvalues: (copy) v_u_1
		if p164 < p167 / 2 then
			local v168 = p164 * 2
			local v169 = p166 / 2
			if v168 == p167 then
				return p165 + v169
			else
				return v169 * 1.001 * (-v_u_1(2, -10 * v168 / p167) + 1) + p165
			end
		else
			local v170 = p164 * 2 - p167
			local v171 = p165 + p166 / 2
			local v172 = p166 / 2
			if v170 == 0 then
				return v171
			else
				return v172 * v_u_1(2, 10 * (v170 / p167 - 1)) + v171 - v172 * 0.001
			end
		end
	end,
	["inCirc"] = function(p173, p174, p175, p176)
		-- upvalues: (copy) v_u_1, (copy) v_u_4
		local v177 = p173 / p176
		return -p175 * (v_u_4(1 - v_u_1(v177, 2)) - 1) + p174
	end,
	["outCirc"] = function(p178, p179, p180, p181)
		-- upvalues: (copy) v_u_1, (copy) v_u_4
		return p180 * v_u_4(1 - v_u_1(p178 / p181 - 1, 2)) + p179
	end,
	["inOutCirc"] = function(p182, p183, p184, p185)
		-- upvalues: (copy) v_u_4
		local v186 = p182 / p185 * 2
		if v186 < 1 then
			return -p184 / 2 * (v_u_4(1 - v186 * v186) - 1) + p183
		end
		local v187 = v186 - 2
		return p184 / 2 * (v_u_4(1 - v187 * v187) + 1) + p183
	end,
	["outInCirc"] = function(p188, p189, p190, p191)
		-- upvalues: (copy) v_u_1, (copy) v_u_4
		if p188 < p191 / 2 then
			local v192 = p188 * 2
			return p190 / 2 * v_u_4(1 - v_u_1(v192 / p191 - 1, 2)) + p189
		end
		local v193 = p188 * 2 - p191
		local v194 = p189 + p190 / 2
		local v195 = p190 / 2
		local v196 = v193 / p191
		return -v195 * (v_u_4(1 - v_u_1(v196, 2)) - 1) + v194
	end,
	["inElastic"] = v_u_17,
	["outElastic"] = v_u_27,
	["inOutElastic"] = function(p197, p198, p199, p200, p201, p202)
		-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_1, (copy) v_u_2
		if p197 == 0 then
			return p198
		else
			local v203 = p197 / p200 * 2
			if v203 == 2 then
				return p198 + p199
			else
				local v204 = p202 or p200 * 0.44999999999999996
				local v205 = p201 or 0
				local v206
				if v205 and v205 >= v_u_5(p199) then
					v206 = v204 / 6.283185307179586 * v_u_6(p199 / v205)
				else
					v206 = v204 / 4
					v205 = p199
				end
				if v203 < 1 then
					local v207 = v203 - 1
					return -0.5 * (v205 * v_u_1(2, 10 * v207) * v_u_2((v207 * p200 - v206) * 6.283185307179586 / v204)) + p198
				else
					local v208 = v203 - 1
					return v205 * v_u_1(2, -10 * v208) * v_u_2((v208 * p200 - v206) * 6.283185307179586 / v204) * 0.5 + p199 + p198
				end
			end
		end
	end,
	["outInElastic"] = function(p209, p210, p211, p212, p213, p214)
		-- upvalues: (copy) v_u_27, (copy) v_u_17
		if p209 < p212 / 2 then
			return v_u_27(p209 * 2, p210, p211 / 2, p212, p213, p214)
		else
			return v_u_17(p209 * 2 - p212, p210 + p211 / 2, p211 / 2, p212, p213, p214)
		end
	end,
	["inBack"] = function(p215, p216, p217, p218, p219)
		local v220 = p219 or 1.70158
		local v221 = p215 / p218
		return p217 * v221 * v221 * ((v220 + 1) * v221 - v220) + p216
	end,
	["outBack"] = function(p222, p223, p224, p225, p226)
		local v227 = p226 or 1.70158
		local v228 = p222 / p225 - 1
		return p224 * (v228 * v228 * ((v227 + 1) * v228 + v227) + 1) + p223
	end,
	["inOutBack"] = function(p229, p230, p231, p232, p233)
		local v234 = (p233 or 1.70158) * 1.525
		local v235 = p229 / p232 * 2
		if v235 < 1 then
			return p231 / 2 * (v235 * v235 * ((v234 + 1) * v235 - v234)) + p230
		end
		local v236 = v235 - 2
		return p231 / 2 * (v236 * v236 * ((v234 + 1) * v236 + v234) + 2) + p230
	end,
	["outInBack"] = function(p237, p238, p239, p240, p241)
		if p237 < p240 / 2 then
			local v242 = p237 * 2
			local v243 = p239 / 2
			local v244 = p241 or 1.70158
			local v245 = v242 / p240 - 1
			return v243 * (v245 * v245 * ((v244 + 1) * v245 + v244) + 1) + p238
		end
		local v246 = p237 * 2 - p240
		local v247 = p238 + p239 / 2
		local v248 = p239 / 2
		local v249 = p241 or 1.70158
		local v250 = v246 / p240
		return v248 * v250 * v250 * ((v249 + 1) * v250 - v249) + v247
	end,
	["inBounce"] = function(p251, p252, p253, p254)
		-- upvalues: (copy) v_u_36
		return p253 - v_u_36(p254 - p251, 0, p253, p254) + p252
	end,
	["outBounce"] = v_u_36,
	["inOutBounce"] = function(p255, p256, p257, p258)
		-- upvalues: (copy) v_u_36
		if p255 < p258 / 2 then
			return (p257 - v_u_36(p258 - p255 * 2, 0, p257, p258) + 0) * 0.5 + p256
		else
			return v_u_36(p255 * 2 - p258, 0, p257, p258) * 0.5 + p257 * 0.5 + p256
		end
	end,
	["outInBounce"] = function(p259, p260, p261, p262)
		-- upvalues: (copy) v_u_36
		if p259 < p262 / 2 then
			return v_u_36(p259 * 2, p260, p261 / 2, p262)
		end
		local v263 = p259 * 2 - p262
		local v264 = p260 + p261 / 2
		local v265 = p261 / 2
		return v265 - v_u_36(p262 - v263, 0, v265, p262) + v264
	end
}