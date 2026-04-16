-- nearbyPlayerUtil (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
local v_u_3 = {}
local v_u_4 = {}
local v6 = {
	["PlayerDistCached"] = function(p5)
		-- upvalues: (ref) v_u_3
		return not v_u_3[p5] and {
			["dist"] = 99999,
			["pos"] = Vector3.new(0, 0, 0)
		} or v_u_3[p5]
	end,
	["GetNearby"] = function()
		-- upvalues: (ref) v_u_4
		return table.clone(v_u_4)
	end
}
task.defer(function()
	-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) v_u_1, (copy) v_u_2
	while true do
		task.wait(1)
		v_u_3 = {}
		v_u_4 = {}
		for _, v7 in ipairs(v_u_1:GetPlayers()) do
			if v7 ~= v_u_2 then
				if v7.Character and v7.Character.PrimaryPart then
					local v8 = v7.Character.PrimaryPart.Position
					local v9 = v_u_2:DistanceFromCharacter(v8)
					v_u_3[v7] = {
						["dist"] = v9,
						["pos"] = v8
					}
					if v9 <= 100 then
						local v10 = v_u_4
						table.insert(v10, v7)
					end
				else
					v_u_3[v7] = nil
				end
			end
		end
	end
end)
return v6