-- ClientCarnival (ModuleScript)
-- ReplicatedStorage > devv > client > Handlers
-- Original

local v1 = {}
local _ = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("CollectionService")
local _ = require(v2.devv).load
local v_u_4 = require(script.FerrisWheel)
local v_u_5 = require(script.Carousel)
local v_u_6 = require(script.CrystalBall)
local v_u_7 = {}
local v_u_8 = {}
local function v_u_12(p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_7
	for _, v10 in p9:GetDescendants() do
		if v10:IsA("BasePart") then
			v10.LocalTransparencyModifier = 1
		end
	end
	task.wait(1)
	v_u_7[p9] = v_u_4.new(p9)
	for _, v11 in p9:GetDescendants() do
		if v11:IsA("BasePart") then
			v11.LocalTransparencyModifier = 0
		end
	end
end
local function v_u_15(p13)
	-- upvalues: (copy) v_u_7
	local v14 = v_u_7[p13]
	if v14 then
		v14:Destroy()
		v_u_7[p13] = nil
	end
end
local function v_u_19(p16)
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	for _, v17 in p16:GetDescendants() do
		if v17:IsA("BasePart") then
			v17.LocalTransparencyModifier = 1
		end
	end
	task.wait(1)
	v_u_8[p16] = v_u_5.new(p16)
	for _, v18 in p16:GetDescendants() do
		if v18:IsA("BasePart") then
			v18.LocalTransparencyModifier = 0
		end
	end
end
local function v_u_22(p20)
	-- upvalues: (copy) v_u_8
	local v21 = v_u_8[p20]
	if v21 then
		v21:Destroy()
		v_u_8[p20] = nil
	end
end
function v1.Initialize()
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_15, (copy) v_u_19, (copy) v_u_22, (copy) v_u_6
	v_u_3:GetInstanceAddedSignal("FerrisWheel"):Connect(v_u_12)
	v_u_3:GetInstanceRemovedSignal("FerrisWheel"):Connect(v_u_15)
	for _, v23 in v_u_3:GetTagged("FerrisWheel") do
		task.spawn(v_u_12, v23)
	end
	v_u_3:GetInstanceAddedSignal("Carousel"):Connect(v_u_19)
	v_u_3:GetInstanceRemovedSignal("Carousel"):Connect(v_u_22)
	for _, v24 in v_u_3:GetTagged("Carousel") do
		task.spawn(v_u_19, v24)
	end
	v_u_6.Initialize()
end
return v1