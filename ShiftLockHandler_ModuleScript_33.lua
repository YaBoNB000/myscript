-- ShiftLockHandler (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v_u_6 = workspace.CurrentCamera
local v_u_7 = require(v_u_2.devv).load
local v_u_8 = CFrame.new(1.7, 0, 0)
local v_u_9 = CFrame.new(-1.7, 0, 0)
local v_u_10 = nil
local v_u_11 = false
local function v_u_23()
	-- upvalues: (copy) v_u_5, (ref) v_u_11, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	local v12 = v_u_5.Character
	local v13
	if v12 then
		v13 = v12.PrimaryPart
	else
		v13 = v12
	end
	if v12 then
		v12 = v12:FindFirstChild("Humanoid")
	end
	if v13 and v12 then
		if v12.SeatPart then
			return
		else
			v_u_11 = true
			local v14 = v_u_5.Character
			if v14 then
				v14 = v14:FindFirstChild("Humanoid")
			end
			if v14 then
				v14.AutoRotate = false
			end
			local v15 = v_u_5.Character
			if v15 then
				v15 = v15.PrimaryPart
			end
			local v16
			if v15 then
				local v17 = CFrame.new
				local v18 = v15.Position
				local v19 = v_u_6.CFrame.LookVector.X * 900000
				local v20 = v15.Position.Y
				local v21 = v_u_6.CFrame.LookVector.Z * 900000
				v16 = v17(v18, (Vector3.new(v19, v20, v21)))
			else
				v16 = nil
			end
			v13.CFrame = v16
			local v22 = v_u_7("v3item").inventory.getEquippedItem()
			if not v22 or v22.type ~= "Gun" then
				v_u_6.CFrame = v_u_6.CFrame * v_u_8
			end
		end
	else
		return
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_2, (ref) v_u_10, (copy) v_u_4, (copy) v_u_23, (copy) v_u_6, (copy) v_u_9, (ref) v_u_11
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_7, (ref) v_u_3, (ref) v_u_2, (ref) v_u_10, (ref) v_u_4, (ref) v_u_23, (ref) v_u_6, (ref) v_u_9, (ref) v_u_11
		repeat
			task.wait(0.1)
		until v_u_5:GetAttribute("isLoaded")
		local v_u_24 = v_u_7("specialRoles")
		if v_u_24.isHero(v_u_5.UserId) and v_u_3.TouchEnabled then
			local v25 = require(script:WaitForChild("Icon"))
			local v_u_26 = nil
			v_u_26 = v25.new():setLabel("CMDR"):bindEvent("selected", function()
				-- upvalues: (ref) v_u_2, (copy) v_u_24, (ref) v_u_5, (ref) v_u_26
				local v27 = v_u_2:FindFirstChild("CmdrClient")
				if v27 and v_u_24.isHero(v_u_5.UserId) then
					require(v27):Toggle()
				end
				v_u_26:deselect()
			end)
		end
		if v_u_3.TouchEnabled or v_u_3.GamepadEnabled then
			local v_u_28 = require(script:WaitForChild("Icon")).new()
			v_u_28:setImage("17898761878")
			v_u_28:setImageScale(0.7)
			v_u_28:bindEvent("selected", function()
				-- upvalues: (ref) v_u_5, (copy) v_u_28, (ref) v_u_3, (ref) v_u_10, (ref) v_u_4, (ref) v_u_23, (ref) v_u_6, (ref) v_u_9, (ref) v_u_11
				local v29 = v_u_5.Character
				if v29 then
					v29 = v29:FindFirstChild("Humanoid")
				end
				if v29 and v29.Health > 0 and true or false then
					v_u_28:setImage("17898761708")
					if v_u_3.TouchEnabled or v_u_3.GamepadEnabled then
						if v_u_10 then
							local v30 = v_u_5.Character
							if v30 then
								v30 = v30:FindFirstChild("Humanoid")
							end
							if v30 then
								v30.AutoRotate = true
							end
							v_u_6.CFrame = v_u_6.CFrame * v_u_9
							v_u_11 = false
							if v_u_10 then
								v_u_10:Disconnect()
								v_u_10 = nil
							end
						else
							v_u_10 = v_u_4.RenderStepped:Connect(function()
								-- upvalues: (ref) v_u_23
								v_u_23()
							end)
						end
					else
						return
					end
				else
					return
				end
			end)
			v_u_28:bindEvent("deselected", function()
				-- upvalues: (ref) v_u_5, (copy) v_u_28, (ref) v_u_3, (ref) v_u_10, (ref) v_u_4, (ref) v_u_23, (ref) v_u_6, (ref) v_u_9, (ref) v_u_11
				local v31 = v_u_5.Character
				if v31 then
					v31 = v31:FindFirstChild("Humanoid")
				end
				if v31 and v31.Health > 0 and true or false then
					v_u_28:setImage("17898761878")
					if v_u_3.TouchEnabled or v_u_3.GamepadEnabled then
						if v_u_10 then
							local v32 = v_u_5.Character
							if v32 then
								v32 = v32:FindFirstChild("Humanoid")
							end
							if v32 then
								v32.AutoRotate = true
							end
							v_u_6.CFrame = v_u_6.CFrame * v_u_9
							v_u_11 = false
							if v_u_10 then
								v_u_10:Disconnect()
								v_u_10 = nil
							end
						else
							v_u_10 = v_u_4.RenderStepped:Connect(function()
								-- upvalues: (ref) v_u_23
								v_u_23()
							end)
						end
					else
						return
					end
				else
					return
				end
			end)
			local function v36(p33)
				-- upvalues: (ref) v_u_10, (ref) v_u_3, (ref) v_u_4, (ref) v_u_23, (ref) v_u_5, (ref) v_u_6, (ref) v_u_9, (ref) v_u_11
				if p33 then
					p33 = p33:WaitForChild("Humanoid", 5)
				end
				if p33 then
					p33.Died:Once(function()
						-- upvalues: (ref) v_u_10, (ref) v_u_3, (ref) v_u_4, (ref) v_u_23, (ref) v_u_5, (ref) v_u_6, (ref) v_u_9
						if v_u_10 then
							if not (v_u_3.TouchEnabled or v_u_3.GamepadEnabled) then
								return
							end
							if not v_u_10 then
								v_u_10 = v_u_4.RenderStepped:Connect(function()
									-- upvalues: (ref) v_u_23
									v_u_23()
								end)
								return
							end
							local v34 = v_u_5.Character
							if v34 then
								v34 = v34:FindFirstChild("Humanoid")
							end
							if v34 then
								v34.AutoRotate = true
							end
							v_u_6.CFrame = v_u_6.CFrame * v_u_9
							if v_u_10 then
								v_u_10:Disconnect()
								v_u_10 = nil
							end
						end
					end)
				end
				if v_u_11 then
					if not (v_u_3.TouchEnabled or v_u_3.GamepadEnabled) then
						return
					end
					if not v_u_10 then
						v_u_10 = v_u_4.RenderStepped:Connect(function()
							-- upvalues: (ref) v_u_23
							v_u_23()
						end)
						return
					end
					local v35 = v_u_5.Character
					if v35 then
						v35 = v35:FindFirstChild("Humanoid")
					end
					if v35 then
						v35.AutoRotate = true
					end
					v_u_6.CFrame = v_u_6.CFrame * v_u_9
					v_u_11 = false
					if v_u_10 then
						v_u_10:Disconnect()
						v_u_10 = nil
					end
				end
			end
			v36(v_u_5.Character)
			v_u_5.CharacterAdded:Connect(v36)
		end
	end)
end
return v1