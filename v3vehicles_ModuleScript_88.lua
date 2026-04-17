-- v3vehicles (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load("deepCopy")
local v_u_2 = {}
local v3 = {}
local v4 = script.bin
local v5 = v4.Car
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
local v19 = v4.Heli
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
return {
	["types"] = v3,
	["vehicles"] = v_u_2
}