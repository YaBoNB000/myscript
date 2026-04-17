-- v3entities (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("deepCopy")
local v_u_2 = {}
local v3 = {}
local v4 = script.bin
local v5 = v4.Pickups
local v_u_6 = v5.Name
v3[v_u_6] = true
local function v17(p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_6
	for _, v8 in pairs(p7:GetChildren()) do
		if v8:IsA("ModuleScript") then
			local v9 = require(v8)
			if v9.subtype then
				local function v_u_15(p10, p11)
					-- upvalues: (copy) v_u_15
					for v12, v13 in pairs(p10) do
						local v14 = p11[v12]
						if type(v14) == "table" then
							v_u_15(v13, p11[v12])
						elseif p11[v12] == nil then
							p11[v12] = v13
						end
					end
				end
				v_u_15(v_u_1(v_u_2[v9.subtype].data), v9)
			end
			local v16 = {
				["type"] = v_u_6,
				["data"] = v9
			}
			v_u_2[v8.Name] = v16
		end
	end
end
local v18 = v5:FindFirstChild("subtypes")
if v18 then
	v17(v18)
end
v17(v5)
local v19 = v4.NextBots
local v_u_20 = v19.Name
v3[v_u_20] = true
local function v31(p21)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_20
	for _, v22 in pairs(p21:GetChildren()) do
		if v22:IsA("ModuleScript") then
			local v23 = require(v22)
			if v23.subtype then
				local function v_u_29(p24, p25)
					-- upvalues: (copy) v_u_29
					for v26, v27 in pairs(p24) do
						local v28 = p25[v26]
						if type(v28) == "table" then
							v_u_29(v27, p25[v26])
						elseif p25[v26] == nil then
							p25[v26] = v27
						end
					end
				end
				v_u_29(v_u_1(v_u_2[v23.subtype].data), v23)
			end
			local v30 = {
				["type"] = v_u_20,
				["data"] = v23
			}
			v_u_2[v22.Name] = v30
		end
	end
end
local v32 = v19:FindFirstChild("subtypes")
if v32 then
	v31(v32)
end
v31(v19)
local v33 = v4.Safes
local v_u_34 = v33.Name
v3[v_u_34] = true
local function v45(p35)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_34
	for _, v36 in pairs(p35:GetChildren()) do
		if v36:IsA("ModuleScript") then
			local v37 = require(v36)
			if v37.subtype then
				local function v_u_43(p38, p39)
					-- upvalues: (copy) v_u_43
					for v40, v41 in pairs(p38) do
						local v42 = p39[v40]
						if type(v42) == "table" then
							v_u_43(v41, p39[v40])
						elseif p39[v40] == nil then
							p39[v40] = v41
						end
					end
				end
				v_u_43(v_u_1(v_u_2[v37.subtype].data), v37)
			end
			local v44 = {
				["type"] = v_u_34,
				["data"] = v37
			}
			v_u_2[v36.Name] = v44
		end
	end
end
local v46 = v33:FindFirstChild("subtypes")
if v46 then
	v45(v46)
end
v45(v33)
return {
	["types"] = v3,
	["entities"] = v_u_2
}