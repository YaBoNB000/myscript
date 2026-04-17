-- ShiftLockRebind (LocalScript)
-- StarterPlayer > StarterPlayerScripts
-- Original

local v_u_1 = game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
local v_u_2 = UserSettings().GameSettings
local function v8(p_u_3)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v4, v5 = pcall(function()
		-- upvalues: (ref) v_u_2, (copy) p_u_3
		return v_u_2[p_u_3]
	end)
	if v4 and (p_u_3 == "ControlMode" and v5 == Enum.ControlMode.MouseLockSwitch) then
		local v6 = v_u_1:FindFirstChild("BoundKeys")
		if v6 then
			v6.Value = "LeftControl,RightControl"
			return
		end
		local v7 = Instance.new("StringValue")
		v7.Name = "BoundKeys"
		v7.Value = "LeftControl,RightControl"
		v7.Parent = v_u_1
	end
end
v_u_2.Changed:Connect(v8)
v8("ControlMode")