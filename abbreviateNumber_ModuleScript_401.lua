-- abbreviateNumber (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > string
-- Original

local v_u_1 = {
	"K",
	"M",
	"B",
	"T",
	"Q"
}
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = math.log(p2, 1000)
	local v4 = p2 / 1000 ^ math.floor(v3) * 100 + 0.5
	local v5 = math.floor(v4) / 100
	local v6 = v_u_1
	local v7 = math.log(p2, 1000)
	return v5 .. (v6[math.floor(v7)] or "")
end