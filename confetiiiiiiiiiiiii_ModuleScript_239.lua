-- confetiiiiiiiiiiiii (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = workspace.CurrentCamera
local v4 = require(v1.devv).load("Maid")
local v_u_5 = Random.new()
local v_u_6 = {}
local v_u_7 = 0
local v_u_8 = v4.new()
local v_u_9 = Instance.new("Part")
v_u_9.Name = "Confetti"
v_u_9.Size = Vector3.new(0.05, 0.05, 0.001)
v_u_9.Material = Enum.Material.SmoothPlastic
v_u_9.TopSurface = Enum.SurfaceType.SmoothNoOutlines
v_u_9.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
v_u_9.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
v_u_9.BackSurface = Enum.SurfaceType.SmoothNoOutlines
v_u_9.CanCollide = false
v_u_9.CanTouch = false
v_u_9.CanQuery = false
return function(p10)
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_2, (ref) v_u_7
	local v_u_11 = p10 or 40
	local function v_u_23()
		-- upvalues: (ref) v_u_9, (ref) v_u_5, (ref) v_u_3, (ref) v_u_6, (ref) v_u_8, (ref) v_u_2, (ref) v_u_7
		local v12 = v_u_9:Clone()
		v12.Color = Color3.fromHSV(v_u_5:NextNumber(), 1, 1)
		v12.Parent = v_u_3
		local v13 = v_u_6
		local v14 = {
			["part"] = v12,
			["startAt"] = os.clock(),
			["dropOffset"] = v_u_5:NextNumber(4, 5),
			["randomX"] = v_u_5:NextNumber(-1.5, 1.5),
			["randomY"] = v_u_5:NextNumber(0.5, 3),
			["direction"] = v_u_5:NextNumber() < 0.5 and 1 or -1
		}
		local v15 = v_u_5:NextNumber()
		v14.depth = math.sqrt(v15) * 0.1
		v14.isTweening = false
		table.insert(v13, v14)
		if #v_u_6 > 0 and #v_u_8._tasks == 0 then
			v_u_8:GiveTask(v_u_2.RenderStepped:Connect(function(p16)
				-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_3, (ref) v_u_8
				v_u_7 = v_u_7 + p16
				for v17, v18 in v_u_6 do
					local v19 = (os.clock() - v18.startAt) / v18.dropOffset
					local v20 = math.max(v19, 0)
					local v21 = CFrame.new(v18.randomX, 1 + v18.randomY - v20 * 8, -1 - v18.depth)
					local v22 = CFrame.Angles(6.283185307179586 * v_u_7 * 1.25, 0, 6.283185307179586 * v_u_7 * 0.005 * v18.direction)
					v18.part.CFrame = v_u_3.CFrame * v21 * v22
					if v20 > 0.75 then
						table.remove(v_u_6, v17)
						if v18.part then
							v18.part:Destroy()
						end
						if #v_u_6 == 0 then
							v_u_8:DoCleaning()
						end
					end
				end
			end))
		end
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_6, (copy) v_u_23
		for v24 = 1, v_u_11 do
			if #v_u_6 >= 120 then
				break
			end
			v_u_23()
			if v24 % 2 == 0 then
				task.wait()
			end
		end
	end)
end