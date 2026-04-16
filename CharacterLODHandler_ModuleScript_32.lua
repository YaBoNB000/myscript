-- CharacterLODHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v_u_1("Scheduler")
local v_u_3 = v_u_1("TransparencyMask")
local v_u_4 = {
	["MAX_LOD_DIST"] = 1000,
	["override"] = 0
}
local v_u_5 = game:GetService("Players")
local v_u_6 = v_u_5.LocalPlayer
function v_u_4.GetFidelity(p7)
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	if not (p7.Character and p7.Character.PrimaryPart) then
		return 0
	end
	if v_u_4.override ~= 0 then
		return v_u_4.override == 1 and 1 or 0
	end
	local v8 = v_u_6.ReplicationFocus and v_u_6.ReplicationFocus.Position or (v_u_6.Character and (v_u_6.Character.PrimaryPart and v_u_6.Character.PrimaryPart.Position) or workspace.CurrentCamera.CFrame.p)
	return (p7.Character.PrimaryPart.Position - v8).magnitude <= v_u_4.MAX_LOD_DIST and 1 or 0
end
function v_u_4.SetOverride(p9)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3
	local v10 = v_u_1("GrabHandler")
	v_u_4.override = p9
	local v11 = v_u_5:GetPlayers()
	for _, v12 in pairs(v11) do
		if v12 ~= v_u_6 and (v12 ~= v10.heldPlayer and v12.Character) then
			local v13 = v_u_4.GetFidelity(v12)
			v_u_3.SetMasked(v12, v13 == 0)
		end
	end
end
function v_u_4.Initialize()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v_u_14 = v_u_1("GrabHandler")
	local v_u_15 = 1
	v_u_2.Schedule(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_15, (ref) v_u_6, (copy) v_u_14, (ref) v_u_4, (ref) v_u_3
		local v16 = v_u_5:GetPlayers()
		v_u_15 = v_u_15 >= #v16 and 1 or v_u_15 + 1
		local v17 = v16[v_u_15]
		if v17 ~= v_u_6 and (v17 ~= v_u_14.heldPlayer and v17.Character) then
			local v18 = v_u_4.GetFidelity(v17)
			v_u_3.SetMasked(v17, v18 == 0)
		end
	end, 0.1, -1)
end
return v_u_4