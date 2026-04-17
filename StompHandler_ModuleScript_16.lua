-- StompHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load
local v2 = v1("object")
local v_u_3 = v1("Signal")
local v_u_4 = v1("v3item")
local v_u_5 = v1("FFCChain")
local v_u_6 = v1("GUILoader")
local v_u_7 = v1("animLoader")
local v_u_8 = v1("InputHandler")
local v_u_9 = v1("CASPriorities")
local v_u_10 = v1("ClientReplicator")
local v_u_11 = v1("CameraShakeHandler")
local v_u_12 = game:GetService("Players")
local v_u_13 = v_u_12.LocalPlayer
local v_u_14 = game:GetService("ContextActionService")
local v_u_15 = Enum.ContextActionResult.Pass
local v_u_16 = game:GetService("UserInputService")
local v_u_17 = v_u_16.TouchEnabled
local v_u_18 = v_u_16.GamepadEnabled
local v_u_19 = os.clock()
local v_u_20 = false
local v_u_21 = v2()
function v_u_21.getPlayerToStomp()
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_10
	if v_u_13.Character and v_u_13.Character.PrimaryPart then
		local v22 = nil
		local v23 = nil
		for _, v24 in pairs(v_u_12:GetPlayers()) do
			if v24 ~= v_u_13 and (v24.Character and v24.Character.PrimaryPart) and v_u_10.Check(v24, {
				["knocked"] = true,
				["carried"] = false
			}) then
				local v25 = v_u_13:DistanceFromCharacter(v24.Character.PrimaryPart.Position)
				if v22 == nil or v25 < v22 then
					v23 = v24
					v22 = v25
				end
			end
		end
		if v22 ~= nil and v22 <= 10 then
			return v23
		end
	end
end
function v_u_21.stomp()
	-- upvalues: (ref) v_u_20, (copy) v_u_10, (copy) v_u_13, (ref) v_u_19, (copy) v_u_5, (copy) v_u_21, (copy) v_u_7, (copy) v_u_4, (copy) v_u_3, (copy) v_u_11
	local v26 = {
		["knocked"] = false,
		["carried"] = false,
		["crawl"] = false,
		["ragdolled"] = false,
		["blocking"] = false,
		["aiming"] = false,
		["scoped"] = false
	}
	if v_u_20 then
		return
	elseif v_u_10.Check(v_u_13, v26) then
		if os.clock() < v_u_19 + 1 then
			return
		else
			local v27 = v_u_5(v_u_13.Character, "Humanoid", "Animator")
			if v27 then
				local v28 = v_u_21.getPlayerToStomp()
				if v28 then
					v_u_19 = os.clock()
					local v29 = v27:LoadAnimation((v_u_7.Get("stomp")))
					v29:AdjustSpeed(1)
					v29:Play()
					v_u_4.movement.meleeStop = os.clock() + 0.8
					v_u_3.FireServer("finish", v28)
					v_u_11.Get():ShakeOnce(unpack({
						5,
						3.5,
						0.15,
						0.35,
						1,
						0.5
					}))
				end
			end
		end
	else
		return
	end
end
function v_u_21.Initialize()
	-- upvalues: (copy) v_u_6, (copy) v_u_21, (copy) v_u_17, (copy) v_u_8, (copy) v_u_9, (copy) v_u_18, (copy) v_u_16, (ref) v_u_20, (copy) v_u_14, (copy) v_u_15
	task.defer(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_21, (ref) v_u_17, (ref) v_u_8, (ref) v_u_9, (ref) v_u_18
		local v30 = v_u_6.Get("Hotbar")
		local v31 = false
		while true do
			local v32 = v_u_21.getPlayerToStomp()
			if v31 or not v32 then
				if v31 and not v32 then
					v31 = false
					if v_u_17 then
						v_u_8:UnbindAction("stomp")
					end
				end
			else
				v31 = true
				if v_u_17 then
					v_u_8:BindActionAtPriority("stomp", v_u_21.stomp, true, v_u_9.stompPlayer)
				end
			end
			if not v_u_17 then
				v30.Holder.StompLabel.Text = v_u_18 and "DPad Down to stomp" or "Press E to stomp"
				if v32 then
					v30.Holder.StompLabel.Visible = v31
				else
					v30.Holder.StompLabel.Visible = false
				end
			end
			task.wait(2)
		end
	end)
	if not v_u_17 then
		v_u_16.TextBoxFocused:Connect(function()
			-- upvalues: (ref) v_u_20
			v_u_20 = true
		end)
		v_u_16.TextBoxFocusReleased:Connect(function()
			-- upvalues: (ref) v_u_20
			v_u_20 = false
		end)
		v_u_14:BindActionAtPriority("stompPlayer", function(_, p33, p34)
			-- upvalues: (ref) v_u_15, (ref) v_u_21
			if p33 ~= Enum.UserInputState.End then
				return v_u_15
			end
			if p34.KeyCode ~= Enum.KeyCode.E and p34.KeyCode ~= Enum.KeyCode.DPadDown then
				return v_u_15
			end
			v_u_21.stomp()
			return v_u_15
		end, false, v_u_9.stompPlayer, Enum.UserInputType.Keyboard, Enum.KeyCode.DPadDown)
	end
end
return v_u_21