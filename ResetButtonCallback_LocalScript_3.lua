-- ResetButtonCallback (LocalScript)
-- StarterPlayer > StarterPlayerScripts
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("StarterGui")
local v_u_3 = v1:WaitForChild("ResetEvent")
local v_u_4 = Instance.new("BindableEvent")
v_u_4.Event:Connect(function()
	-- upvalues: (copy) v_u_3
	v_u_3:FireServer()
end)
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	while not pcall(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_4
		return v_u_2:SetCore("ResetButtonCallback", v_u_4)
	end) do
		task.wait(1)
	end
end)