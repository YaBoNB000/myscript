-- DebugTeleport (LocalScript)
-- StarterPlayer > StarterPlayerScripts
-- Original

local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = v_u_1:GetMouse()
local v_u_3 = {
	38476745,
	63233311,
	277861465,
	153650149
}
v_u_2.KeyDown:Connect(function(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	if table.find(v_u_3, v_u_1.UserId) then
		if p4 == "t" then
			local v5 = v_u_2.Target
			local v6 = v_u_1.Character
			local v7
			if v6 then
				v7 = v6.PrimaryPart
			else
				v7 = v6
			end
			local v8
			if v6 then
				v8 = v6:FindFirstChild("Humanoid")
			else
				v8 = v6
			end
			if v8 and v8.SeatPart then
				return
			end
			if v5 and (v5:IsDescendantOf(workspace) and v7) then
				local v9 = v_u_2.Hit.Position
				local v10 = CFrame.new(v9)
				local v11 = v6:GetExtentsSize().Y * 0.5 + 0.25
				local v12 = (v10 + Vector3.new(0, v11, 0)).Position
				v6:PivotTo((CFrame.lookAt(v12, v12 + v7.CFrame.LookVector)))
			end
		end
	end
end)