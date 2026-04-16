-- DevvObject (ModuleScript)
-- ReplicatedStorage > devv > shared > Objects
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v_u_3 = v2("Maid")
local v_u_4 = v2("GUID")
local v_u_5 = {
	["ClassName"] = "DevvObject"
}
v_u_5.__index = v_u_5
function v_u_5.new(p6)
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	local v7 = v_u_5
	local v8 = setmetatable({}, v7)
	for v9, v10 in p6 or {} do
		v8[v9] = v10
	end
	v8.objectId = v_u_4()
	v8.maid = v_u_3.new()
	return v8
end
function v_u_5.Inherit(p11, p12)
	assert(p12, "toInherit cannot be nil")
	local v13 = typeof(p12) == "table"
	assert(v13, "toInherit must be a table")
	for _, v14 in p12 do
		for v15, v16 in v14 do
			p11[v15] = v16
		end
	end
end
function v_u_5.Destroy(p17)
	if p17.maid then
		p17.maid:DoCleaning()
		p17.maid = nil
	end
	setmetatable(p17, nil)
end
return v_u_5