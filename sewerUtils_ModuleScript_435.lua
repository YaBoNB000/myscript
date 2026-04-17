-- sewerUtils (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > gameSpecific
-- Original

local v_u_1 = game:GetService("RunService")
local v_u_2 = {}
task.defer(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v3 = workspace:WaitForChild("SewerZone"):WaitForChild("ZoneParts")
	for _, v4 in v3:GetChildren() do
		if v4:IsA("BasePart") then
			local v5 = v_u_2
			local v6 = {
				["hx"] = v4.Size.X * 0.5,
				["hy"] = v4.Size.Y * 0.5,
				["hz"] = v4.Size.Z * 0.5,
				["cframe"] = v4.CFrame
			}
			table.insert(v5, v6)
		end
	end
	if v_u_1:IsClient() then
		v3:Destroy()
	end
end)
local function v_u_13(p7)
	-- upvalues: (copy) v_u_2
	for _, v8 in v_u_2 do
		local v9 = v8.cframe:PointToObjectSpace(p7)
		local v10 = v9.X
		if math.abs(v10) <= v8.hx then
			local v11 = v9.Y
			if math.abs(v11) <= v8.hy then
				local v12 = v9.Z
				if math.abs(v12) <= v8.hz then
					return true
				end
			end
		end
	end
	return false
end
return {
	["isPlayerInSewer"] = function(p14)
		-- upvalues: (copy) v_u_13
		if p14 then
			p14 = p14.Character
		end
		if p14 then
			p14 = p14.PrimaryPart
		end
		if p14 then
			return v_u_13(p14.CFrame.Position)
		else
			return false
		end
	end,
	["isPointInSewer"] = v_u_13
}