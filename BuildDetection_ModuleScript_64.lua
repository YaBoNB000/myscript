-- BuildDetection (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > ClientHouse
-- Original

game:GetService("CollectionService")
local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v3 = require(v1.devv).load
v3("FurniturePlacer")
local v_u_4 = v3("contextButtons")
local v_u_5 = nil
local v_u_6 = {
	["_buildType"] = nil
}
local function v_u_12(p7, p8)
	-- upvalues: (copy) v_u_2
	local v9 = v_u_2.Character
	local v10
	if v9 then
		v10 = v9.PrimaryPart
	else
		v10 = v9
	end
	if not v10 then
		return false
	end
	local v11 = OverlapParams.new()
	v11.FilterType = Enum.RaycastFilterType.Include
	v11.FilterDescendantsInstances = { v9 }
	return #workspace:GetPartBoundsInBox(p7, p8, v11) > 0
end
function v_u_6.GetBuildType(p13)
	return p13._buildType
end
function v_u_6.SetBuildType(_)
	-- upvalues: (ref) v_u_5, (copy) v_u_12
	if v_u_5.house then
		local v14 = v_u_5.house.Building:FindFirstChildOfClass("Model")
		if v14 and v_u_12(v14:GetAttribute("cframe") * CFrame.new(0, -500, 0), v14:GetAttribute("size") + Vector3.new(0, 1500, 0)) then
			return "house"
		end
	end
	if v_u_5.room then
		local v15 = v_u_5.room.Building:FindFirstChildOfClass("Model")
		if v15 and v_u_12(v15:GetAttribute("cframe"), (v15:GetAttribute("size"))) then
			return "room"
		end
	end
	if v_u_5.base then
		local v16 = v_u_5.base.Building:FindFirstChildOfClass("Model")
		if v16 and v_u_12(v16:GetAttribute("cframe") * CFrame.new(0, -500, 0), v16:GetAttribute("size") + Vector3.new(0, 1500, 0)) then
			return "base"
		end
	end
end
function v_u_6.initBuildDetection(p17, p18)
	-- upvalues: (ref) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_4
	v_u_5 = p18
	while task.wait(0.5) do
		local v19 = v_u_6:SetBuildType()
		p17._buildType = v19
		local v20 = v_u_2.Character
		if v20 then
			v20 = v20.PrimaryPart
		end
		if v20 then
			if v_u_5.house and (v_u_5.house:FindFirstChild("Sign") and v_u_2:DistanceFromCharacter(v_u_5.house.Sign.PrimaryPart.Position) > 20) then
				v_u_5.HomeManager:setMenuClosed()
			end
			if v_u_5.room and (v_u_5.room:FindFirstChild("Sign") and v_u_2:DistanceFromCharacter(v_u_5.room.Sign.PrimaryPart.Position) > 20) then
				v_u_5.RoomManager:setMenuClosed()
			end
			if v_u_5.base and (v_u_5.base:FindFirstChild("Sign") and v_u_2:DistanceFromCharacter(v_u_5.base.Sign.PrimaryPart.Position) > 60) then
				v_u_5.BaseManager:setMenuClosed()
			end
			if v19 == "house" then
				local v21 = v_u_5.house.Building:FindFirstChildOfClass("Model")
				v_u_5.Furniture.furniturePlacer:SetBuilding(v21)
				v_u_4.ToggleBuild(true)
			elseif v19 == "room" then
				local v22 = v_u_5.room.Building:FindFirstChildOfClass("Model")
				v_u_5.Furniture.furniturePlacer:SetBuilding(v22)
				v_u_4.ToggleBuild(true)
			elseif v19 == "base" then
				local v23 = v_u_5.base.Building:FindFirstChildOfClass("Model")
				v_u_5.Furniture.furniturePlacer:SetBuilding(v23)
				v_u_4.ToggleBuild(true)
			else
				v_u_5.BuildWindow:resetBuild()
				v_u_4.ToggleBuild(false)
			end
			v_u_5.BuildWindow:updatePlacedLimit()
		else
			v_u_5.BuildWindow:resetBuild()
			v_u_5.HomeManager:setMenuClosed()
			v_u_4.ToggleBuild(false)
		end
	end
end
return v_u_6