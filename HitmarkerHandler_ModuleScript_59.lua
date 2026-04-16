-- HitmarkerHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v_u_3 = v2("GUILoader")
local v4 = v2("Bindable")
local v_u_5 = v2("v3sound")
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("TweenService")
local v_u_8 = {
	["OnPlayerHit"] = v4.new()
}
local v_u_9 = {}
local v_u_10 = nil
function v_u_8.ArmorHit()
	-- upvalues: (copy) v_u_3, (ref) v_u_10, (copy) v_u_7
	local v11 = v_u_3.Get("Crosshair")
	if v_u_10 then
		v_u_10:Cancel()
	end
	v11.CrosshairContainer.ArmorIndicator.ImageTransparency = 0.25
	v11.CrosshairContainer.ArmorBreakIndicator.ImageTransparency = 1
	v_u_10 = v_u_7:Create(v11.CrosshairContainer.ArmorIndicator, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		["ImageTransparency"] = 1
	})
	v_u_10:Play()
end
function v_u_8.ArmorBreak()
	-- upvalues: (copy) v_u_3, (ref) v_u_10, (copy) v_u_7
	local v12 = v_u_3.Get("Crosshair")
	if v_u_10 then
		v_u_10:Cancel()
	end
	v12.CrosshairContainer.ArmorIndicator.ImageTransparency = 1
	v12.CrosshairContainer.ArmorBreakIndicator.ImageTransparency = 0.25
	v_u_10 = v_u_7:Create(v12.CrosshairContainer.ArmorBreakIndicator, TweenInfo.new(2.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		["ImageTransparency"] = 1
	})
	v_u_10:Play()
end
function v_u_8.PlayerHit(p13, _, p14)
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_5
	if p13 and p13.type then
		if p13.type == "bullet" then
			local v_u_15 = p13.guid
			local v_u_16 = p14.hitPlayerId
			if v_u_16 then
				v_u_16 = v_u_6:GetPlayerByUserId(p14.hitPlayerId)
			end
			local v_u_17 = "hitmarker"
			if not v_u_16 then
				return
			end
			local v18 = v_u_16:GetAttribute("armor")
			if v18 and v18 > 0 then
				v_u_9[v_u_16.UserId] = v_u_15
				v_u_8.ArmorHit()
				v_u_17 = "hitmarkerArmor"
			elseif v18 and (v18 <= 0 and v_u_9[v_u_16.UserId]) then
				v_u_8.ArmorBreak()
				v_u_9[v_u_16.UserId] = nil
				v_u_17 = "hitmarkerBreakArmor"
			end
			task.delay(0.05, function()
				-- upvalues: (ref) v_u_5, (ref) v_u_17, (ref) v_u_9, (copy) v_u_16, (copy) v_u_15
				local v19 = v_u_5.newLocalSound(v_u_17)
				v19.PlaybackSpeed = math.random(80, 120) / 100
				v19:Play()
				task.wait(1)
				v19:Destroy()
				task.wait(2)
				if v_u_9[v_u_16.UserId] == v_u_15 then
					v_u_9[v_u_16.UserId] = nil
				end
			end)
		end
	end
end
function v_u_8.Initialize()
	-- upvalues: (copy) v_u_8
	v_u_8.OnPlayerHit:Connect(v_u_8.PlayerHit)
end
return v_u_8