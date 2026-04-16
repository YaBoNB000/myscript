-- InviteHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("SocialService")
local v_u_4 = game:GetService("HttpService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v6 = require(v2.devv).load
local v_u_7 = v6("commavalue")
local v_u_8 = v6("Promise")
local v_u_9 = v6("globals")
local function v_u_12()
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_4, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3
	local v_u_10 = Instance.new("ExperienceInviteOptions")
	v_u_10.InviteMessageId = "6edad800-da9c-d94a-bef7-d8549c9b99f5"
	v_u_10.PromptMessage = "\240\159\146\184 Get $" .. v_u_7(v_u_9.INVITES.CASH) .. " join bonus! \240\159\146\184"
	v_u_10.LaunchData = v_u_4:JSONEncode({
		["inviteeId"] = v_u_5.UserId
	})
	v_u_8.try(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_5
		return v_u_3:CanSendGameInviteAsync(v_u_5)
	end):andThen(function(p11)
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (copy) v_u_10
		if p11 then
			pcall(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_5, (ref) v_u_10
				v_u_3:PromptGameInvite(v_u_5, v_u_10)
			end)
		end
	end):catch(warn)
end
function v1.Initialize()
	-- upvalues: (copy) v_u_5, (copy) v_u_12, (copy) v_u_9
	if game.PlaceId == 11958318242 then
		workspace.InviteSigns:Destroy()
	else
		task.delay(5, function()
			-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_9
			repeat
				task.wait(0.1)
			until v_u_5:GetAttribute("isLoaded")
			for _, v13 in workspace.InviteSigns:GetChildren() do
				local v14 = v13:FindFirstChild("ProximityPrompt", true)
				if v14 then
					v14.Triggered:Connect(function(p15)
						-- upvalues: (ref) v_u_5, (ref) v_u_12
						if p15 == v_u_5 then
							v_u_12()
						end
					end)
				end
			end
			task.defer(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_9
				local function v19()
					-- upvalues: (ref) v_u_5, (ref) v_u_9
					local v16 = (v_u_5:GetAttribute("invites") or 0) < v_u_9.INVITES.MAX_INVITES
					for _, v17 in workspace.InviteSigns:GetChildren() do
						local v18 = v17:FindFirstChild("ProximityPrompt", true)
						if v18 then
							v18.Enabled = v16
						end
					end
				end
				v19()
				v_u_5:GetAttributeChangedSignal("invites"):Connect(v19)
			end)
		end)
	end
end
return v1