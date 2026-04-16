-- hook (ModuleScript)
-- ReplicatedStorage > CmdrClient > Types
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load
local v_u_3 = v_u_2("specialRoles")
local v_u_4 = game:GetService("RunService")
local v_u_5 = { "var" }
return function(p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	p6:RegisterHook("BeforeRun", function(p7)
		-- upvalues: (ref) v_u_3
		if p7.Group == "Developer" and v_u_3.isDeveloper(p7.Executor.UserId) ~= true then
			return "You don\'t have permission to run this command"
		end
		if (p7.Group == "Admin" or p7.Group == "DefaultAdmin") and v_u_3.isAdmin(p7.Executor.UserId) ~= true then
			return "You don\'t have permission to run this command"
		end
		if (p7.Group == "Hero" or p7.Group == "DefaultDebug") and v_u_3.isHero(p7.Executor.UserId) ~= true then
			return "You don\'t have permission to run this command"
		end
	end)
	p6:RegisterHook("AfterRun", function(p8)
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_2
		local v9 = p8.Executor
		local v10 = p8.Arguments
		local v11 = v10[1] and v10[1].Command
		if v11 then
			v11 = v10[1].Command.Name
		end
		if v_u_4:IsServer() and (game.JobId ~= "" and (v11 and not table.find(v_u_5, v11))) then
			local v12 = {}
			for _, v13 in v10 do
				local v14 = v13:GetValue()
				if typeof(v14) == "table" then
					local v15 = 0
					local v16 = ""
					for _, v17 in v14 do
						if v15 >= 1 then
							v16 = v16 .. ", "
						end
						v16 = v16 .. tostring(v17)
						v15 = v15 + 1
					end
					local v18 = {}
					local v19 = v13.Name
					v18.name = tostring(v19)
					v18.value = v16
					table.insert(v12, v18)
				else
					local v20 = {}
					local v21 = v13.Name
					v20.name = tostring(v21)
					v20.value = tostring(v14)
					table.insert(v12, v20)
				end
			end
			local v22 = v_u_2("WebhookHandler")
			task.spawn(v22.AdminCommandWebhook, v9, v11, v12)
		end
	end)
end