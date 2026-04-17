-- v3props (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("deepCopy")
local v_u_2 = {}
local v3 = {}
local v_u_4 = {}
local v5 = script.bin
local v6 = v5.Destructible
local v_u_7 = v6.Name
v3[v_u_7] = true
local function v18(p8)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4, (copy) v_u_7
	for _, v9 in pairs(p8:GetChildren()) do
		if v9:IsA("ModuleScript") then
			local v10 = require(v9)
			local v11 = v9.Name
			if v10.subtype then
				local function v_u_17(p12, p13)
					-- upvalues: (copy) v_u_17
					for v14, v15 in pairs(p12) do
						local v16 = p13[v14]
						if type(v16) == "table" then
							v_u_17(v15, p13[v14])
						elseif p13[v14] == nil then
							p13[v14] = v15
						end
					end
				end
				v_u_17(v_u_1(v_u_2[v10.subtype].data), v10)
				v_u_4[v11] = true
			end
			v_u_2[v11] = {
				["propType"] = v_u_7,
				["data"] = v10
			}
		end
	end
end
local v19 = v6:FindFirstChild("subtypes")
if v19 then
	v18(v19)
end
v18(v6)
local v20 = v5.Pushable
local v_u_21 = v20.Name
v3[v_u_21] = true
local function v32(p22)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4, (copy) v_u_21
	for _, v23 in pairs(p22:GetChildren()) do
		if v23:IsA("ModuleScript") then
			local v24 = require(v23)
			local v25 = v23.Name
			if v24.subtype then
				local function v_u_31(p26, p27)
					-- upvalues: (copy) v_u_31
					for v28, v29 in pairs(p26) do
						local v30 = p27[v28]
						if type(v30) == "table" then
							v_u_31(v29, p27[v28])
						elseif p27[v28] == nil then
							p27[v28] = v29
						end
					end
				end
				v_u_31(v_u_1(v_u_2[v24.subtype].data), v24)
				v_u_4[v25] = true
			end
			v_u_2[v25] = {
				["propType"] = v_u_21,
				["data"] = v24
			}
		end
	end
end
local v33 = v20:FindFirstChild("subtypes")
if v33 then
	v32(v33)
end
v32(v20)
local v34 = v5.Static
local v_u_35 = v34.Name
v3[v_u_35] = true
local function v46(p36)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4, (copy) v_u_35
	for _, v37 in pairs(p36:GetChildren()) do
		if v37:IsA("ModuleScript") then
			local v38 = require(v37)
			local v39 = v37.Name
			if v38.subtype then
				local function v_u_45(p40, p41)
					-- upvalues: (copy) v_u_45
					for v42, v43 in pairs(p40) do
						local v44 = p41[v42]
						if type(v44) == "table" then
							v_u_45(v43, p41[v42])
						elseif p41[v42] == nil then
							p41[v42] = v43
						end
					end
				end
				v_u_45(v_u_1(v_u_2[v38.subtype].data), v38)
				v_u_4[v39] = true
			end
			v_u_2[v39] = {
				["propType"] = v_u_35,
				["data"] = v38
			}
		end
	end
end
local v47 = v34:FindFirstChild("subtypes")
if v47 then
	v46(v47)
end
v46(v34)
return {
	["types"] = v3,
	["props"] = v_u_2,
	["worldTypes"] = v_u_4
}