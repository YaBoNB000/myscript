-- KunaiEffects (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > effects
-- Original

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.devv).load("v3sound")
local function v_u_11(p3)
	local v4 = p3.Character
	local v5
	if v4 then
		v5 = v4.PrimaryPart
	else
		v5 = v4
	end
	if v5 then
		local v_u_6 = Instance.new("Model")
		v_u_6.Name = "Ghost"
		for _, v7 in v4:GetDescendants() do
			if v7:IsA("BasePart") and v7.Transparency < 1 then
				local v8 = v7.Archivable
				v7.Archivable = true
				local v9 = v7:Clone()
				v7.Archivable = v8
				v9.Parent = v_u_6
				v9:PivotTo(v7:GetPivot())
				v9.Anchored = true
				v9.CanCollide = false
				v9.CanTouch = false
				v9.CanQuery = false
				v9.LocalTransparencyModifier = 0.95
				v9.Color = Color3.new(1, 1, 1)
				if v9:IsA("MeshPart") then
					v9.TextureID = ""
				end
				for _, v10 in v9:GetChildren() do
					if v10:IsA("SpecialMesh") then
						v10.TextureID = ""
					else
						v10:Destroy()
					end
				end
			end
		end
		v_u_6.Parent = workspace.Game.Local
		task.delay(0.3, function()
			-- upvalues: (copy) v_u_6
			v_u_6:Destroy()
		end)
	end
end
local function v_u_15(p12)
	-- upvalues: (copy) v_u_1
	local v13 = p12.Character
	if v13 then
		v13 = v13.PrimaryPart
	end
	if v13 then
		local v_u_14 = v_u_1.Models.Particles.Anime1:Clone()
		v_u_14.Attachment.ParticleEmitter.Enabled = false
		v_u_14:PivotTo(v13.CFrame)
		v_u_14.Parent = workspace.Game.Local
		v_u_14.Attachment.ParticleEmitter:Emit(1)
		task.delay(4, function()
			-- upvalues: (copy) v_u_14
			v_u_14:Destroy()
		end)
	end
end
local function v_u_20(p16)
	-- upvalues: (copy) v_u_1
	local v17 = p16.Character
	if v17 then
		v17 = v17.PrimaryPart
	end
	if v17 then
		local v_u_18 = v_u_1.Models.Particles.Anime2:Clone()
		v_u_18.Attachment.ParticleEmitter.Enabled = false
		v_u_18:PivotTo(v17.CFrame)
		v_u_18.Parent = workspace.Game.Local
		v_u_18.Attachment.ParticleEmitter:Emit(1)
		local v_u_19 = v_u_1.Models.Particles.Anime3:Clone()
		v_u_19.Attachment.ParticleEmitter.Enabled = false
		v_u_19:PivotTo(v17.CFrame)
		v_u_19.Parent = workspace.Game.Local
		v_u_19.Attachment.ParticleEmitter:Emit(1)
		task.delay(4, function()
			-- upvalues: (copy) v_u_18, (copy) v_u_19
			v_u_18:Destroy()
			v_u_19:Destroy()
		end)
	end
end
return {
	["JumpEffect"] = function(p_u_21, p22)
		-- upvalues: (copy) v_u_15, (copy) v_u_2, (copy) v_u_11
		v_u_15(p_u_21)
		local v23 = p_u_21.Character
		local v24
		if v23 then
			v24 = v23.PrimaryPart
		else
			v24 = v23
		end
		if v24 then
			local v25 = v_u_2.newSound("kunaiJump")
			v25:attachToPart(v23.PrimaryPart)
			if p22 then
				v25.distortion = true
			end
			v25:play()
		end
		if p22 then
			task.spawn(function()
				-- upvalues: (ref) v_u_11, (copy) p_u_21, (ref) v_u_15
				for _ = 1, 6 do
					v_u_11(p_u_21)
					v_u_15(p_u_21)
					task.wait(0.05)
				end
			end)
		end
	end,
	["DashEffect"] = function(p_u_26, p27)
		-- upvalues: (copy) v_u_20, (copy) v_u_2, (copy) v_u_11
		v_u_20(p_u_26)
		local v28 = p_u_26.Character
		local v29
		if v28 then
			v29 = v28.PrimaryPart
		else
			v29 = v28
		end
		if v29 then
			local v30 = v_u_2.newSound("kunaiDash")
			v30:attachToPart(v28.PrimaryPart)
			if p27 then
				v30.distortion = true
			end
			v30:play()
		end
		if p27 then
			task.spawn(function()
				-- upvalues: (ref) v_u_11, (copy) p_u_26, (ref) v_u_20
				for _ = 1, 6 do
					v_u_11(p_u_26)
					v_u_20(p_u_26)
					task.wait(0.05)
				end
			end)
		end
	end
}