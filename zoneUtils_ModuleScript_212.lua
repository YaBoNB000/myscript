-- zoneUtils (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > hitreg
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v1.devv).load("v3sound")
local v_u_5 = {}
local v_u_6 = Instance.new("Part")
v_u_6.Transparency = 1
v_u_6.Color = Color3.fromRGB(255, 0, 0)
v_u_6.CanCollide = false
v_u_6.CanQuery = false
v_u_6.CanTouch = false
v_u_6.Anchored = true
function v_u_5.partsInZone(p7)
	-- upvalues: (copy) v_u_6
	local v8 = p7.cframe
	local v9 = p7.size
	local v10 = p7.overlapParams or OverlapParams.new()
	v_u_6.Size = v9
	v_u_6.CFrame = v8
	v_u_6.Parent = workspace
	local v11 = workspace:GetPartsInPart(v_u_6, v10)
	v_u_6.Parent = nil
	return v11
end
local function v_u_13(p12)
	-- upvalues: (copy) v_u_2, (copy) v_u_13
	if (v_u_2:HasTag(p12.Parent, "prop") or v_u_2:HasTag(p12.Parent, "subprop")) and p12.Parent:GetAttribute("guid") then
		return p12.Parent
	end
	if p12.Parent:IsDescendantOf(workspace.Game.Props) then
		return v_u_13(p12.Parent)
	end
end
local function v_u_15(p14)
	-- upvalues: (copy) v_u_15
	if p14:IsDescendantOf(workspace.Game.Vehicles) then
		if p14.Parent == workspace.Game.Vehicles then
			return p14
		else
			return v_u_15(p14.Parent)
		end
	else
		return
	end
end
function v_u_5.zoneHitreg(p16)
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_15, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v17 = p16.hitOrigin or p16.cframe.p
	local v18 = v_u_5.partsInZone(p16)
	local v19 = {}
	for _, v34 in pairs(v18) do
		local v21 = (v34.Position - v17).magnitude
		if v34:IsDescendantOf(workspace.Game.Props) then
			local v22 = v_u_13(v34)
			if not v19[v22] then
				v19[v22] = {
					["hitDist"] = v21,
					["hitType"] = "prop",
					["hit"] = v34,
					["rootModel"] = v22
				}
			end
		elseif v34:IsDescendantOf(workspace.Game.Vehicles) then
			local v23
			if v34:IsDescendantOf(workspace.Game.Vehicles) then
				if v34.Parent == workspace.Game.Vehicles then
					v23 = v34
				else
					v23 = v_u_15(v34.Parent)
				end
			else
				v23 = nil
			end
			if not v19[v23] then
				v19[v23] = {
					["hitDist"] = v21,
					["hitType"] = "vehicle",
					["hit"] = v34,
					["rootModel"] = v23
				}
			end
		elseif v34.Parent:FindFirstChildOfClass("Humanoid") then
			local v24 = v_u_3:GetPlayerFromCharacter(v34.Parent)
			if v24 then
				local v25 = v24.Character
				if not v19[v25] then
					v19[v25] = {
						["hitDist"] = v21,
						["hitType"] = "player",
						["hit"] = v34,
						["rootModel"] = v25
					}
				end
			end
		elseif v34:IsDescendantOf(workspace.Tutorial) or v34:IsDescendantOf(workspace.ATMs) then
			local v26 = v34.Parent
			if v26 and v26.Parent then
				local v27 = v26:GetAttribute("health")
				if v27 and v27 > 0 then
					local v_u_28 = v_u_4.newLocalSound("metalImpact" .. math.random(1, 4))
					v_u_28.Volume = 0.4
					v_u_28:Play()
					task.delay(1, function()
						-- upvalues: (copy) v_u_28
						v_u_28:Destroy()
					end)
					v26:SetAttribute("health", v27 - 8)
				end
			end
		elseif v34:IsDescendantOf(workspace.GemRobbery.JewelryCases) then
			if v34.Name == "Glass" then
				local v29 = v34.Parent
				if not v19[v29] then
					v19[v29] = {
						["hitDist"] = v21,
						["hitType"] = "jewelcase",
						["hit"] = v34,
						["rootModel"] = v29
					}
				end
			end
		elseif v34:IsDescendantOf(workspace.HousingPlots) then
			local v30 = v34
			local v31 = nil
			local v32 = 0
			while true do
				if v31 or (v32 >= 10 or not v34) then
					v34 = v31
					break
				end
				local v33 = v34.Parent
				v32 = v32 + 1
				if v33 and v33.Name == "Furniture" then
					break
				end
				local v34 = v33
			end
			if v34 and (v_u_2:HasTag(v34, "hitFurniture") and not v19[v34]) then
				v19[v34] = {
					["hitDist"] = v21,
					["hitType"] = "furniture",
					["hit"] = v30,
					["rootModel"] = v34
				}
			end
		elseif v34:IsDescendantOf(workspace.Fireworks) then
			local v35 = v34.Parent
			if not v35:IsA("Model") then
				v35 = v35.Parent
			end
			if not v35:IsA("Model") then
				return
			end
			if v35 then
				v19[v35] = {
					["hitDist"] = v21,
					["hitType"] = "firework",
					["hit"] = v34,
					["rootModel"] = v35
				}
			end
		end
	end
	local v36 = {}
	for _, v37 in pairs(v19) do
		table.insert(v36, v37)
	end
	return v36
end
return v_u_5