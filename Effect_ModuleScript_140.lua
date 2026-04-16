-- Effect (ModuleScript)
-- ReplicatedStorage > devv > client > Objects > v3effect
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.devv).load
local v_u_3 = v2("RetrieveModel")
local v_u_4 = v2("Scheduler")
v2("state")
local v_u_5 = v2("Maid")
local v_u_6 = {
	["ClassName"] = "Effect",
	["EffectType"] = "Base"
}
v_u_6.__index = v_u_6
function v_u_6.new(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v8 = {}
	for v9, v10 in p7 do
		v8[v9] = v10
	end
	v8._maid = v_u_5.new()
	v8._tasks = {}
	local v11 = v_u_6
	setmetatable(v8, v11)
	return v8
end
function v_u_6.Create(p_u_12)
	-- upvalues: (copy) v_u_3
	if p_u_12.disableRender then
		return
	else
		local v13 = p_u_12.particleObjectName
		local v14 = p_u_12.skinName
		if typeof(v14) == "table" then
			return
		else
			local v15 = v_u_3(v13, "Particles")
			local v16 = p_u_12.skinName
			if v16 then
				v16 = v_u_3(p_u_12.skinName .. "_" .. v13, "Particles", true)
			end
			local v17 = v16 or v15
			if p_u_12.skinColor and v16 then
				v16:SetAttribute("skinColor", p_u_12.skinColor)
			end
			assert(v17)
			local v18 = v17:Clone()
			p_u_12._effectPart = v18
			if p_u_12.position then
				v18.CFrame = CFrame.new(p_u_12.position)
			end
			v18.Parent = workspace.Game.Local.Effects
			if p_u_12.scale and p_u_12.scale ~= 1 then
				p_u_12:Scale(p_u_12.scale)
			end
			if p_u_12.attachedTo then
				p_u_12:Attach(p_u_12.attachedTo)
			end
			if p_u_12.persistent then
				p_u_12:Emit()
			else
				task.spawn(function()
					-- upvalues: (copy) p_u_12
					p_u_12:Emit()
					task.wait(p_u_12.lifetime)
					p_u_12:Disable()
					task.wait(10)
					p_u_12:Destroy()
				end)
			end
		end
	end
end
function v_u_6.Scale(p19, p20)
	for _, v21 in pairs(p19._effectPart:GetDescendants()) do
		if v21:IsA("ParticleEmitter") then
			local v22 = v21.Size
			if type(v22) == "userdata" then
				local v23 = {}
				for _, v24 in pairs(v21.Size.Keypoints) do
					local v25 = NumberSequenceKeypoint.new
					local v26 = v24.Time
					local v27 = v24.Value * p20
					local v28 = v24.Envelope
					local v29 = v24.Value * p20
					local v30 = v25(v26, v27, (math.clamp(v28, 0, v29)))
					table.insert(v23, v30)
				end
				v21.Size = NumberSequence.new(v23)
			else
				v21.Size = v21.Size * p20
			end
		end
	end
end
function v_u_6.Attach(p_u_31, p_u_32)
	-- upvalues: (copy) v_u_4
	p_u_31._effectPart.Anchored = true
	local v34 = v_u_4.Schedule(function()
		-- upvalues: (copy) p_u_32, (copy) p_u_31
		if p_u_32 and p_u_32:IsDescendantOf(workspace) then
			local v33 = nil
			if p_u_32:IsA("BasePart") then
				v33 = p_u_32.CFrame
			elseif p_u_32:IsA("Attachment") then
				v33 = p_u_32.WorldCFrame
			end
			p_u_31._effectPart.CFrame = v33
		else
			p_u_31:Disable()
		end
	end, 0.1, -1)
	p_u_31._tasks.attach = v34
end
function v_u_6.SetEmitters(p35, p36)
	if p35._effectPart then
		for _, v37 in p35._effectPart:GetDescendants() do
			if v37:IsA("ParticleEmitter") then
				v37.Enabled = p36
			end
		end
	end
end
function v_u_6.Disable(p38)
	if not p38.disabled then
		p38.disabled = true
		p38:SetEmitters(false)
		if p38._soundObject then
			p38._soundObject:Stop()
			p38._soundObject = nil
		end
		for v39, v40 in p38._tasks do
			v40:cancel()
			p38._tasks[v39] = nil
		end
	end
end
function v_u_6.clean(p41)
	p41:Destroy()
end
function v_u_6.Destroy(p42)
	p42:Disable()
	if p42._effectPart then
		p42._effectPart:Destroy()
		p42._effectPart = nil
	end
	if p42._soundObject then
		p42._soundObject:Stop()
		p42._soundObject = nil
	end
	for v43, v44 in p42._tasks do
		v44:cancel()
		p42._tasks[v43] = nil
	end
	p42._maid:DoCleaning()
	for v45, _ in p42 do
		p42[v45] = nil
	end
end
return v_u_6