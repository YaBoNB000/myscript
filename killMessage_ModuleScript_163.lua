-- killMessage (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
game:GetService("RunService")
local _ = game:GetService("Players").LocalPlayer
local v3 = require(v1.devv).load
local v_u_4 = v3("GUILoader")
local v5 = v3("Signal")
local v_u_6 = 0
local function v_u_11(p7, p8, p9)
	-- upvalues: (copy) v_u_2
	for _, v10 in p7 do
		v_u_2:Create(v10, p8, p9):Play()
	end
end
local function v21(p12, p13, p14)
	-- upvalues: (ref) v_u_6, (copy) v_u_4, (copy) v_u_2, (copy) v_u_11
	v_u_6 = v_u_6 + 1
	local v_u_15 = v_u_6
	local v_u_16 = TweenInfo.new(0.25, Enum.EasingStyle.Quad)
	local v_u_17 = v_u_4.Get("KillMessage")
	if v_u_17 then
		v_u_17.Frame.NameLabel.Text = p12
		local v18 = v_u_17.Frame.InfoLabel
		local v19 = string.format
		local v20 = p14 * 0.28
		v18.Text = v19("%s @ %sm", p13, (math.floor(v20)))
		v_u_17.Frame.NameLabel.TextTransparency = 1
		v_u_17.Frame.InfoLabel.TextTransparency = 1
		v_u_17.Frame.IconsFrame.Gun.ImageTransparency = 1
		v_u_17.Frame.IconsFrame.Skull.ImageTransparency = 1
		v_u_17.Frame.Position = UDim2.fromScale(0.95, 0)
		v_u_2:Create(v_u_17.Frame, v_u_16, {
			["Position"] = UDim2.fromScale(0.95, 0.05)
		}):Play()
		v_u_11({ v_u_17.Frame.IconsFrame.Gun, v_u_17.Frame.IconsFrame.Skull }, v_u_16, {
			["ImageTransparency"] = 0
		})
		v_u_11({ v_u_17.Frame.InfoLabel, v_u_17.Frame.NameLabel }, v_u_16, {
			["TextTransparency"] = 0
		})
		v_u_11({ v_u_17.Frame.InfoLabel.UIStroke, v_u_17.Frame.NameLabel.UIStroke }, v_u_16, {
			["Transparency"] = 0
		})
		task.delay(8, function()
			-- upvalues: (copy) v_u_15, (ref) v_u_6, (ref) v_u_11, (copy) v_u_17, (copy) v_u_16
			if v_u_15 == v_u_6 then
				v_u_11({ v_u_17.Frame.IconsFrame.Gun, v_u_17.Frame.IconsFrame.Skull }, v_u_16, {
					["ImageTransparency"] = 1
				})
				v_u_11({ v_u_17.Frame.InfoLabel, v_u_17.Frame.NameLabel }, v_u_16, {
					["TextTransparency"] = 1
				})
				v_u_11({ v_u_17.Frame.InfoLabel.UIStroke, v_u_17.Frame.NameLabel.UIStroke }, v_u_16, {
					["Transparency"] = 1
				})
			end
		end)
	end
end
v5.LinkSignal("killMessage", v21)
return v21