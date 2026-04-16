-- LODCheck (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = workspace.CurrentCamera
local v3 = game:GetService("ReplicatedStorage")
local v4 = require(v3.devv).load
local v_u_5 = v4("ClientReplicator")
local v_u_6 = v4("nearbyPlayerUtil")
return function(p7, p8, p9)
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2
	debug.profilebegin("lodcheck")
	if v_u_1:GetAttribute("isCamera") then
		return true
	else
		if v_u_5.Get(v_u_1, "scoped") then
			p8 = p8 * 5
		end
		local v10 = nil
		local v11 = nil
		if typeof(p7) == "Vector3" then
			v11 = v_u_1:DistanceFromCharacter(p7)
			v10 = p7
		elseif typeof(p7) == "Instance" and p7:IsA("Player") then
			local v12 = v_u_6.PlayerDistCached(p7)
			v10 = v12.pos
			v11 = v12.dist
		end
		if p9 and v11 <= p9 then
			debug.profileend()
			return true, true
		elseif v11 <= p8 then
			local v13 = v_u_2.CFrame
			local v14 = (v13.Position - v10).Unit
			local v15 = v13.LookVector.Unit:Dot(v14)
			if math.acos(v15) < 1.5707963267948966 then
				debug.profileend()
				return false
			else
				debug.profileend()
				return true, false
			end
		else
			debug.profileend()
			return false
		end
	end
end