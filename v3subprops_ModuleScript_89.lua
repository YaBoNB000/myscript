-- v3subprops (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("deepCopy")
local v_u_2 = {}
local v3 = {}
local v_u_4 = {}
local v5 = script.bin.Shatterable
local v_u_6 = v5.Name
v3[v_u_6] = true
local function v17(p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4, (copy) v_u_6
	for _, v8 in pairs(p7:GetChildren()) do
		if v8:IsA("ModuleScript") then
			local v9 = require(v8)
			local v10 = v8.Name
			if v9.subtype then
				local function v_u_16(p11, p12)
					-- upvalues: (copy) v_u_16
					for v13, v14 in pairs(p11) do
						local v15 = p12[v13]
						if type(v15) == "table" then
							v_u_16(v14, p12[v13])
						elseif p12[v13] == nil then
							p12[v13] = v14
						end
					end
				end
				v_u_16(v_u_1(v_u_2[v9.subtype].data), v9)
				v_u_4[v10] = true
			end
			v_u_2[v10] = {
				["propType"] = v_u_6,
				["data"] = v9
			}
		end
	end
end
local v18 = v5:FindFirstChild("subtypes")
if v18 then
	v17(v18)
end
v17(v5)
return {
	["types"] = v3,
	["subprops"] = v_u_2,
	["worldTypes"] = v_u_4
}