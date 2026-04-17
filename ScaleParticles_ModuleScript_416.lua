-- ScaleParticles (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > model
-- Original

return function(p1, p2)
	for _, v3 in p1:GetDescendants() do
		if v3:IsA("ParticleEmitter") then
			local v4 = v3.Size
			if type(v4) == "userdata" then
				local v5 = {}
				for _, v6 in pairs(v3.Size.Keypoints) do
					local v7 = NumberSequenceKeypoint.new
					local v8 = v6.Time
					local v9 = v6.Value * p2
					local v10 = v6.Envelope
					local v11 = v6.Value * p2
					local v12 = v7(v8, v9, (math.clamp(v10, 0, v11)))
					table.insert(v5, v12)
				end
				v3.Size = NumberSequence.new(v5)
			else
				v3.Size = v3.Size * p2
			end
		end
	end
end