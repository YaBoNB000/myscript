-- FOVController (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > camera
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v2 = v1("RenderStepPriorities")
local v_u_3 = v1("count")
local v4 = game:GetService("RunService")
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = 70
local v_u_8 = 1
function v_u_5.sort()
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (ref) v_u_7, (ref) v_u_8
	if v_u_3(v_u_6) == 0 then
		v_u_7 = 70
		v_u_8 = 0.1
	else
		local function v_u_13(p9)
			-- upvalues: (ref) v_u_6, (copy) v_u_13
			local v10 = 0
			local v11 = {}
			for _, v12 in pairs(v_u_6) do
				if p9 and not v12.isAveraged then
					return v_u_13(false)
				end
				if v10 <= v12.weight then
					if p9 then
						table.insert(v11, v12)
					else
						v11 = { v12 }
					end
					v10 = v12.weight
				end
			end
			return v11
		end
		local v14 = v_u_13(true)
		if #v14 == 1 then
			v_u_7 = v14[1].goalFOV
			v_u_8 = v14[1].tweenSpeed
		else
			local v15 = 0
			local v16 = 0
			local v17 = 0
			for _, v18 in pairs(v14) do
				v15 = v15 + v18.goalFOV * v18.weight
				v16 = v16 + v18.tweenSpeed * v18.weight
				v17 = v17 + v18.weight
			end
			local v19 = v15 / v17
			local v20 = v16 / v17
			v_u_7 = v19
			v_u_8 = v20
		end
		local v21 = v_u_7
		v_u_7 = math.clamp(v21, 5, 140)
		local v22 = v_u_8
		v_u_8 = math.clamp(v22, 0, 1)
	end
end
function v_u_5.addConstraint(p23, p24, p25, p26, p27)
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	if not v_u_6[p23] then
		v_u_6[p23] = {
			["goalFOV"] = p24,
			["tweenSpeed"] = p25,
			["isAveraged"] = p26,
			["weight"] = p27
		}
		v_u_5.sort()
	end
end
function v_u_5.removeConstraint(p28)
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	if v_u_6[p28] then
		v_u_6[p28] = nil
		v_u_5.sort()
	end
end
function v_u_5.step()
	-- upvalues: (ref) v_u_7, (ref) v_u_8
	local v29 = workspace.Camera
	v29.FieldOfView = v29.FieldOfView + (v_u_7 - v29.FieldOfView) * v_u_8
end
v4:BindToRenderStep("FOVController", v2.FOVController, v_u_5.step)
return v_u_5