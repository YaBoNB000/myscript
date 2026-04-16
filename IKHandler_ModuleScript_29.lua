-- IKHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v_u_2 = v1("HumanoidReadyUtil")
local v_u_3 = v1("FABRIK")
local v_u_4 = v1("clean")
local v_u_5 = {}
local v_u_6 = game:GetService("Players")
local v_u_7 = {}
v_u_5.SetupFakeCharacter = require(script.SetupFakeCharacter)
function v_u_5.GetChains(p8)
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_5
	local v9 = v_u_6:GetPlayerFromCharacter(p8)
	if v_u_7[v9] and v_u_7[v9].character == p8 then
		return v_u_7[v9]
	end
	if v9 and p8 then
		return v_u_5.MakeChains(p8)
	end
end
function v_u_5.MakeChains(p10)
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7
	local v11 = v_u_6:GetPlayerFromCharacter(p10)
	local v12 = {
		["character"] = p10
	}
	local v13 = p10.UpperTorso
	local v14 = p10.RightUpperArm
	local v15 = p10.RightLowerArm
	local v16 = p10.LeftUpperArm
	local v17 = p10.LeftLowerArm
	local v18 = { v13.RightShoulderRigAttachment.WorldPosition, v14.RightElbowRigAttachment.WorldPosition, v15.RightWristRigAttachment.WorldPosition }
	local v19 = { v13.LeftShoulderRigAttachment.WorldPosition, v16.LeftElbowRigAttachment.WorldPosition, v17.LeftWristRigAttachment.WorldPosition }
	local v20 = v_u_3.new(v18, v13.Position)
	v20.constrained = true
	v20.tolerance = 0.1
	v20.left = 0.6981317007977318
	v20.right = 0
	v20.up = 0.6981317007977318
	v20.down = 0.6981317007977318
	local v21 = v_u_3.new(v19, v13.Position)
	v21.constrained = true
	v21.tolerance = 0.1
	v21.left = 0.6981317007977318
	v21.left = 0
	v21.up = 0.6981317007977318
	v21.down = 0.6981317007977318
	v12.rightChain = v20
	v12.leftChain = v21
	v12.fakeCharacter = v_u_5.SetupFakeCharacter(p10)
	v_u_7[v11] = v12
	return v12
end
function v_u_5.Clean(p22)
	-- upvalues: (copy) v_u_7, (copy) v_u_4
	if v_u_7[p22] then
		if v_u_7[p22].fakeCharacter and v_u_7[p22].fakeCharacter.model then
			v_u_7[p22].fakeCharacter.model:Destroy()
			v_u_7[p22].fakeCharacter.model = nil
			v_u_7[p22].fakeCharacter = nil
		end
		v_u_4(v_u_7[p22])
		v_u_7[p22] = nil
	end
end
function v_u_5.Initialize()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_2
	v_u_6.PlayerRemoving:Connect(v_u_5.Clean)
	v_u_2.registerHumanoidReady(function(p_u_23, _, p24)
		-- upvalues: (ref) v_u_5
		local v_u_25 = nil
		v_u_25 = p24.Died:Connect(function()
			-- upvalues: (ref) v_u_25, (ref) v_u_5, (copy) p_u_23
			v_u_25:Disconnect()
			v_u_25 = nil
			v_u_5.Clean(p_u_23)
		end)
	end)
end
return v_u_5