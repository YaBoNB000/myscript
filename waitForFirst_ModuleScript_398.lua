-- waitForFirst (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > signals
-- Original

return function(...)
	local v_u_1 = Instance.new("BindableEvent")
	local v_u_2 = { ... }
	local function v4(...)
		-- upvalues: (copy) v_u_2, (copy) v_u_1
		for v3 = 1, #v_u_2 do
			v_u_2[v3]:Disconnect()
		end
		return v_u_1:Fire(...)
	end
	for v5 = 1, #v_u_2 do
		v_u_2[v5] = v_u_2[v5]:Connect(v4)
	end
	return v_u_1.Event:Wait()
end