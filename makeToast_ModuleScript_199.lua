-- makeToast (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("RunService")
local _ = game:GetService("Players").LocalPlayer
local v4 = require(v1.devv).load
local v_u_5 = v4("GUILoader")
local v_u_6 = v4("colors")
local v7 = v4("Signal")
local v_u_8 = 0
local function v19(p9, p10, p11)
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_2
	local v12 = p10 or "white"
	local v13 = p11 or 4
	v_u_8 = v_u_8 + 1
	local v_u_14 = nil
	local v_u_15 = v_u_8
	local v_u_16 = TweenInfo.new(0.25, Enum.EasingStyle.Quad)
	local v_u_17 = v_u_5.Get("Toast")
	if v_u_17 then
		if v12 == "rainbow" then
			task.spawn(function()
				-- upvalues: (copy) v_u_17, (ref) v_u_8, (copy) v_u_15, (ref) v_u_3
				local v18 = 0
				while v_u_17 and v_u_8 == v_u_15 do
					v18 = v18 + v_u_3.Heartbeat:Wait()
					if v_u_8 == v_u_15 then
						v_u_17.Label.TextColor3 = Color3.fromHSV(v18 * 0.5 % 1, 0.25, 1)
					end
				end
			end)
		else
			v_u_17.Label.TextColor3 = v_u_6[v12] or Color3.new(1, 1, 1)
		end
		v_u_17.Label.Text = p9
		v_u_17.Label.TextTransparency = 1
		v_u_17.Label.Position = UDim2.new(0.5, 0, 0.7, 15)
		v_u_2:Create(v_u_17.Label, v_u_16, {
			["Position"] = UDim2.fromScale(0.5, 0.7),
			["TextTransparency"] = 0
		}):Play()
		v_u_2:Create(v_u_17.Label.UIStroke, v_u_16, {
			["Transparency"] = 0
		}):Play()
		task.delay(v13, function()
			-- upvalues: (copy) v_u_15, (ref) v_u_8, (ref) v_u_2, (copy) v_u_17, (copy) v_u_16, (ref) v_u_14
			if v_u_15 == v_u_8 then
				v_u_2:Create(v_u_17.Label, v_u_16, {
					["Position"] = UDim2.new(0.5, 0, 0.7, 15),
					["TextTransparency"] = 1
				}):Play()
				v_u_2:Create(v_u_17.Label.UIStroke, v_u_16, {
					["Transparency"] = 1
				}):Play()
				v_u_17.Label.Button.Visible = false
				if v_u_14 then
					v_u_14:Disconnect()
					v_u_14 = nil
				end
			end
		end)
	end
end
v7.LinkSignal("makeToast", v19)
return v19