-- v3effect (ModuleScript)
-- ReplicatedStorage > devv > client > Objects
-- Original

local v_u_1 = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v3 = require(v2.devv).load
local v_u_4 = v3("v3effects")
local v_u_5 = v3("Signal")
local v_u_6 = v3("state")
local v_u_7 = {}
for _, v8 in script.Effect:GetChildren() do
	v_u_7[v8.Name] = require(v8)
end
local v_u_28 = {
	["NewEffect"] = function(p9, p10)
		-- upvalues: (copy) v_u_4, (copy) v_u_7
		local v11 = v_u_4.effects[p9]
		if v11 then
			local v12 = v11.type
			local v13 = v11.data
			local v14 = table.clone(v13)
			for v15, v16 in p10 do
				v14[v15] = v16
			end
			return v_u_7[v12].new(v14)
		end
		warn(p9 .. " is an invalid effect!")
	end,
	["SyncEffects"] = function(p17)
		-- upvalues: (copy) v_u_28
		for v18, v19 in p17 do
			v_u_28.ReplicateEffect(v18, v19)
		end
	end,
	["ReplicateEffect"] = function(p20, p21)
		-- upvalues: (copy) v_u_28
		v_u_28.NewEffect(p20, p21):Create()
	end,
	["Initialize"] = function()
		-- upvalues: (copy) v_u_5, (copy) v_u_28, (copy) v_u_1, (copy) v_u_6
		v_u_5.LinkSignal("SyncEffects", v_u_28.SyncEffects)
		v_u_5.LinkSignal("ReplicateEffect", v_u_28.ReplicateEffect)
		v_u_5.LinkSignal("pepperSprayHit", function(p22)
			-- upvalues: (ref) v_u_28, (ref) v_u_1
			v_u_28.NewEffect("pepperspray", {
				["position"] = v_u_1.Character.PrimaryPart.Position,
				["tintColor"] = p22
			}):Create()
		end)
		v_u_5.LinkSignal("extinguishFlames", function(p23, p24)
			-- upvalues: (ref) v_u_6
			local v25 = v_u_6.FireOctree:GetNearest(p23, p24, 20)
			for _, v26 in ipairs(v25) do
				local v27 = v26.Object
				if v27 and not v27.disabled then
					v27:Disable()
				end
			end
		end)
	end
}
return v_u_28