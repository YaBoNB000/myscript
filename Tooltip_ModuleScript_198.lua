-- Tooltip (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("TextService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players").LocalPlayer
local v_u_6 = v5:GetMouse()
require(v1.devv).load("Maid")
local v7 = v1.Guis.ScreenGuis.Tooltips:Clone()
v7.Parent = v5:WaitForChild("PlayerGui")
local v_u_8 = v1.Guis.Frames.Tooltip:Clone()
v_u_8.Parent = v7
return function(p_u_9, p_u_10, p11)
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	if not (v_u_2.TouchEnabled or v_u_2.GamepadEnabled) then
		if p_u_9 ~= "" then
			local v_u_12 = nil
			local v_u_13 = nil
			local v_u_14 = p11 or "Right"
			local function v_u_15()
				-- upvalues: (ref) v_u_8, (ref) v_u_6, (ref) v_u_14
				v_u_8.Position = UDim2.fromOffset(v_u_6.X + 10 + (v_u_14 == "Left" and (-v_u_8.Size.X.Offset - 10 or 0) or 0), v_u_6.Y)
			end
			local v_u_16 = false
			local v_u_21 = p_u_10.InputBegan:Connect(function(p_u_17)
				-- upvalues: (ref) v_u_8, (copy) p_u_9, (ref) v_u_3, (ref) v_u_6, (ref) v_u_14, (ref) v_u_12, (ref) v_u_4, (copy) v_u_15, (ref) v_u_16, (ref) v_u_13, (copy) p_u_10
				if p_u_17.UserInputType == Enum.UserInputType.MouseMovement then
					v_u_8.Label.Text = p_u_9
					v_u_8.Visible = true
					task.defer(function()
						-- upvalues: (ref) v_u_3, (ref) v_u_8
						local v18 = v_u_3:GetTextSize(v_u_8.Label.Text, 18, Enum.Font.FredokaOne, Vector2.new(500, 1000))
						v_u_8.Size = UDim2.fromOffset(v18.X + 10, v18.Y + 10)
					end)
					v_u_8.Position = UDim2.fromOffset(v_u_6.X + 10 + (v_u_14 == "Left" and (-v_u_8.Size.X.Offset - 10 or 0) or 0), v_u_6.Y)
					v_u_12 = v_u_4.Heartbeat:Connect(v_u_15)
				elseif p_u_17.UserInputType == Enum.UserInputType.Touch then
					v_u_16 = true
					v_u_13 = p_u_10.InputEnded:Connect(function(p19)
						-- upvalues: (copy) p_u_17, (ref) v_u_16, (ref) v_u_8, (ref) v_u_12, (ref) v_u_13
						if p_u_17 == p19 then
							v_u_16 = false
							v_u_8.Visible = false
							if v_u_12 then
								v_u_12:Disconnect()
								v_u_12 = nil
							end
							if v_u_13 then
								v_u_13:Disconnect()
								v_u_13 = nil
							end
						end
					end)
					task.delay(0.2, function()
						-- upvalues: (ref) v_u_16, (ref) v_u_8, (ref) p_u_9, (ref) v_u_3, (ref) v_u_6, (ref) v_u_14, (ref) v_u_12, (ref) v_u_4, (ref) v_u_15
						if v_u_16 then
							v_u_8.Label.Text = p_u_9
							v_u_8.Visible = true
							task.defer(function()
								-- upvalues: (ref) v_u_3, (ref) v_u_8
								local v20 = v_u_3:GetTextSize(v_u_8.Label.Text, 18, Enum.Font.FredokaOne, Vector2.new(500, 1000))
								v_u_8.Size = UDim2.fromOffset(v20.X + 10, v20.Y + 10)
							end)
							v_u_8.Position = UDim2.fromOffset(v_u_6.X + 10 + (v_u_14 == "Left" and (-v_u_8.Size.X.Offset - 10 or 0) or 0), v_u_6.Y)
							v_u_12 = v_u_4.Heartbeat:Connect(v_u_15)
						end
					end)
				end
			end)
			local v_u_23 = p_u_10.InputEnded:Connect(function(p22)
				-- upvalues: (ref) v_u_8, (ref) v_u_12, (ref) v_u_13
				if p22.UserInputType == Enum.UserInputType.MouseMovement then
					v_u_8.Visible = false
					if v_u_12 then
						v_u_12:Disconnect()
						v_u_12 = nil
					end
					if v_u_13 then
						v_u_13:Disconnect()
						v_u_13 = nil
					end
				end
			end)
			return function()
				-- upvalues: (ref) v_u_21, (ref) v_u_23, (ref) v_u_8, (ref) v_u_12, (ref) v_u_13
				v_u_21:Disconnect()
				v_u_23:Disconnect()
				v_u_21 = nil
				v_u_23 = nil
				v_u_8.Visible = false
				if v_u_12 then
					v_u_12:Disconnect()
					v_u_12 = nil
				end
				if v_u_13 then
					v_u_13:Disconnect()
					v_u_13 = nil
				end
			end
		end
	end
end