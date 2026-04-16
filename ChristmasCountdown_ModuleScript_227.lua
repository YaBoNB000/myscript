-- ChristmasCountdown (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers > Christmas
-- Original

local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("SocialService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v2.devv).load("shortenTime")
local v_u_6 = DateTime.fromUniversalTime(2025, 12, 13, 17, 0, 0).UnixTimestamp
function v1.Initialize()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v_u_7 = workspace:WaitForChild("ChristmasCountdown"):WaitForChild("Sign")
	local v8 = v_u_6 - os.time()
	local v_u_9 = math.max(0, v8)
	task.spawn(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_6, (copy) v_u_7, (ref) v_u_5
		while task.wait(1) do
			local v10 = v_u_6 - os.time()
			v_u_9 = math.max(0, v10)
			if v_u_9 <= 0 then
				v_u_7.SurfaceGui.Frame.Countdown.Text = "SOON!"
			else
				v_u_7.SurfaceGui.Frame.Countdown.Text = v_u_5(v_u_9)
			end
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_7, (ref) v_u_4
		local v11, v12 = pcall(function()
			-- upvalues: (ref) v_u_3
			return v_u_3:GetEventRsvpStatusAsync("6715806791902167697")
		end)
		if v11 and (not v12 or v12 ~= Enum.RsvpStatus.Going) then
			local v_u_13 = Instance.new("ProximityPrompt")
			v_u_13.ActionText = "Notify Me"
			v_u_13.MaxActivationDistance = 15
			v_u_13.Parent = v_u_7
			v_u_13.Triggered:Connect(function(p14)
				-- upvalues: (ref) v_u_4, (ref) v_u_3, (copy) v_u_13
				if p14 == v_u_4 then
					pcall(function()
						-- upvalues: (ref) v_u_3, (ref) v_u_13
						if v_u_3:PromptRsvpToEventAsync("6715806791902167697") == Enum.RsvpStatus.Going then
							v_u_13:Destroy()
						end
					end)
				end
			end)
		end
	end)
end
return v1