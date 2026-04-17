-- status (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > character
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("Scheduler")
local v_u_3 = v1("GUILoader")
local v_u_4 = v1("ClientReplicator")
local v_u_5 = v1("globals")
local v_u_6 = game:GetService("Players").LocalPlayer
local v_u_7 = {
	["health"] = {
		["max"] = 100
	},
	["stamina"] = {
		["max"] = 100,
		["regen"] = 2
	}
}
v_u_7.stamina.current = v_u_7.stamina.max
function v_u_7.isKnockedOut()
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	return v_u_4.Get(v_u_6, "knocked")
end
function v_u_7.tick() end
local v_u_8 = Color3.fromRGB(81, 255, 0)
local v_u_9 = Color3.fromRGB(255, 255, 0)
local v_u_10 = Color3.fromRGB(255, 0, 0)
function v_u_7.SetGui(p11)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_5
	local v12 = v_u_3.Get("Hotbar")
	local v13 = v_u_6.Character
	if v13 and v13:FindFirstChild("Humanoid") then
		local v14 = v13.Humanoid.Health
		local v15 = v13.Humanoid.MaxHealth
		local v16 = v14 / v15
		local v17 = math.clamp(v16, 0, 1)
		local v18 = UDim2.new(v17, -7, 1, -7)
		if p11 then
			v12.Holder.Bars.Health.Inner.Size = v18
		else
			v12.Holder.Bars.Health.Inner:TweenSize(v18, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
		end
		local v19 = v_u_8
		if v14 < v15 and v15 * 0.66 < v14 then
			v19 = v_u_8:lerp(v_u_9, (1 - v14 / v15) / 0.66)
		elseif v14 <= v15 * 0.66 and v15 * 0.33 < v14 then
			v19 = v_u_9:lerp(v_u_10, (0.66 - v14 / v15) / 0.33)
		elseif v14 <= v15 * 0.33 then
			v19 = v_u_10
		end
		v12.Holder.Bars.Health.Inner.BackgroundColor3 = v19
		local v20 = v_u_6:GetAttribute("armor")
		local v21 = v_u_6:GetAttribute("maxArmor")
		if v20 and v21 then
			local v22 = v21 / 100
			local v23 = math.clamp(v22, 0, 2)
			local v24 = v20 / v21
			local v25 = math.clamp(v24, 0, 1)
			v12.Holder.Bars.Armor.Size = UDim2.new(v23, 0, 0, 12)
			local v26 = UDim2.new(v25, -7, 1, -7)
			if p11 then
				v12.Holder.Bars.Armor.Inner.Size = v26
			else
				v12.Holder.Bars.Armor.Inner:TweenSize(v26, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
			end
			v12.Holder.Bars.Armor.Visible = v20 > 0
		else
			v12.Holder.Bars.Armor.Visible = false
		end
		local v27 = v_u_6:GetAttribute("strength")
		if v27 then
			local v28 = v_u_5.STRENGTH_LIMITS
			local v29 = (v27 - v28.SKINNY) / (v28.STRONG - v28.SKINNY)
			local v30 = math.clamp(v29, 0, 1)
			local v31 = UDim2.new(v30, -7, 1, -7)
			v12.Holder.Bars.Strength.Inner.Visible = v30 > 0
			if p11 then
				v12.Holder.Bars.Strength.Inner.Size = v31
				return
			end
			v12.Holder.Bars.Strength.Inner:TweenSize(v31, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
		end
	end
end
function v_u_7.UseStamina(_) end
function v_u_7.ResetStatus()
	-- upvalues: (copy) v_u_7
	v_u_7.SetGui(true)
end
local v_u_32 = 0
function v_u_7.ShowStrength()
	-- upvalues: (copy) v_u_3, (ref) v_u_32
	local v_u_33 = v_u_3.Get("Hotbar")
	v_u_33.Holder.Bars.Strength.Visible = true
	v_u_32 = v_u_32 + 1
	task.spawn(function()
		-- upvalues: (ref) v_u_32, (copy) v_u_33
		local v34 = v_u_32
		task.wait(4)
		if v34 == v_u_32 then
			v_u_33.Holder.Bars.Strength.Visible = false
		end
	end)
end
function v_u_7.Initialize()
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	v_u_2.Schedule(v_u_7.tick, 0.1, -1)
	v_u_2.Schedule(v_u_7.SetGui, 0.1, -1)
end
return v_u_7