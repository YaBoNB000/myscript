-- v3items (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("deepCopy")
local v_u_3 = v1("crafts")
local v_u_4 = {}
local v_u_5 = {}
local v_u_6 = {}
local function v29(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_3, (copy) v_u_6
	local v_u_8 = p7.Name
	v_u_5[v_u_8] = true
	local function v23(p9)
		-- upvalues: (ref) v_u_4, (ref) v_u_2, (copy) v_u_8, (ref) v_u_3, (ref) v_u_6
		if p9:IsA("ModuleScript") then
			local v10 = require(p9)
			if v10.subtype then
				if not v_u_4[v10.subtype] then
					return
				end
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
				v_u_16(v_u_2(v_u_4[v10.subtype].data), v10)
			end
			local v17 = p9.Name
			v_u_4[v17] = {
				["type"] = v_u_8,
				["data"] = v10
			}
			if v10.craft then
				if v10.craft.breakdown then
					v_u_3.breakdown[v17] = v10.craft.breakdown
				end
				if v10.craft.recipes then
					for v18, v19 in v10.craft.recipes do
						if not v_u_6[v18] then
							v_u_6[v18] = true
							v_u_3.recipes[v18] = v19
							if v_u_8 == "Gun" or v_u_8 == "Melee" then
								local v20 = v_u_3.tableTypes.workbench.recipeCategories.Weapons
								table.insert(v20, v18)
							elseif v_u_8 == "Throwable" or (v_u_8 == "Droppable" or v_u_8 == "Consumable") then
								local v21 = v_u_3.tableTypes.workbench.recipeCategories.Consumables
								table.insert(v21, v18)
							else
								local v22 = v_u_3.tableTypes.workbench.recipeCategories.Items
								table.insert(v22, v18)
							end
						end
					end
				end
			end
		end
	end
	local v24 = p7:FindFirstChild("subtypes")
	if v24 then
		for _, v25 in pairs(v24:GetChildren()) do
			v23(v25)
		end
	end
	for _, v26 in pairs(p7:GetChildren()) do
		v23(v26)
	end
	local v27 = p7:FindFirstChild("modified")
	if v27 then
		for _, v28 in pairs(v27:GetChildren()) do
			v23(v28)
		end
	end
end
local function v31(p30)
	-- upvalues: (copy) v_u_4
	if v_u_4[p30] then
		return v_u_4[p30].data, v_u_4[p30].type
	end
end
local function v34(p32)
	-- upvalues: (copy) v_u_4
	for v33 in v_u_4 do
		if v33:gsub("%s+", "") == p32 then
			return v33
		end
	end
	return ""
end
for _, v35 in script.bin:GetChildren() do
	v29(v35)
end
return {
	["types"] = v_u_5,
	["items"] = v_u_4,
	["getItemData"] = v31,
	["getNameFromPartial"] = v34
}