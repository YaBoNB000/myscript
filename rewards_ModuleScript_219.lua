-- rewards (ModuleScript)
-- ReplicatedStorage > devv > shared > Indicies
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.devv).load
local v_u_4 = v_u_3("Signal")
local v9 = {
	["PlaytimeRewards"] = {
		{
			{
				["rewardType"] = "item",
				["rewardValue"] = "Mossberg"
			},
			{
				["rewardType"] = "cash",
				["rewardValue"] = 1000
			},
			{
				["rewardType"] = "item",
				["rewardValue"] = "AK-47"
			},
			{
				["rewardType"] = "cash",
				["rewardValue"] = 1500
			},
			{
				["rewardType"] = "item",
				["rewardValue"] = "Orange Lucky Block"
			},
			{
				["rewardType"] = "cash",
				["rewardValue"] = 3000
			}
		},
		{
			{
				["rewardType"] = "item",
				["rewardValue"] = "AR-15"
			},
			{
				["rewardType"] = "cash",
				["rewardValue"] = 1500
			},
			{
				["rewardType"] = "item",
				["rewardValue"] = "AK-47"
			},
			{
				["rewardType"] = "item",
				["rewardValue"] = "Orange Lucky Block"
			},
			{
				["rewardType"] = "case",
				["rewardValue"] = "Series2Light"
			},
			{
				["rewardType"] = "cash",
				["rewardValue"] = 3500
			}
		},
		{
			{
				["rewardType"] = "item",
				["rewardValue"] = "AK-47"
			},
			{
				["rewardType"] = "cash",
				["rewardValue"] = 2000
			},
			{
				["rewardType"] = "case",
				["rewardValue"] = "Series2Heavy"
			},
			{
				["rewardType"] = "item",
				["rewardValue"] = "M4A1"
			},
			{
				["rewardType"] = "item",
				["rewardValue"] = "Green Lucky Block"
			},
			{
				["rewardType"] = "cash",
				["rewardValue"] = 4000
			}
		}
	},
	["DailyRewards"] = {
		{
			["rewardType"] = "cash",
			["rewardValue"] = 5000
		},
		{
			["getReward"] = function(p5)
				-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
				local v6
				if v_u_2:IsServer() then
					v6 = v_u_3("PlaytimeRewardsHandler").GetHasReward(p5, "house", "Tier2House")
				else
					v6 = v_u_4.InvokeServer("getHasReward", "house", "Tier2House")
				end
				if v6 then
					return "cash", 7500
				else
					return "house", "Tier2House"
				end
			end
		},
		{
			["rewardType"] = "case",
			["rewardValue"] = "Series2Light"
		},
		{
			["rewardType"] = "item",
			["rewardValue"] = "AS Val"
		},
		{
			["rewardType"] = "case",
			["rewardValue"] = "Series2Heavy"
		},
		{
			["getReward"] = function(p7)
				-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
				local v8
				if v_u_2:IsServer() then
					v8 = v_u_3("PlaytimeRewardsHandler").GetHasReward(p7, "furniture", "GlockCrate")
				else
					v8 = v_u_4.InvokeServer("getHasReward", "furniture", "GlockCrate")
				end
				if v8 then
					return "cash", 4500
				else
					return "furniture", "GlockCrate"
				end
			end
		},
		{
			["rewardType"] = "cash",
			["rewardValue"] = 5000
		},
		{
			["rewardType"] = "cash",
			["rewardValue"] = 6000
		},
		{
			["rewardType"] = "cash",
			["rewardValue"] = 6500
		},
		{
			["rewardType"] = "cash",
			["rewardValue"] = 7000
		},
		{
			["rewardType"] = "cash",
			["rewardValue"] = 8000
		},
		{
			["rewardType"] = "item",
			["rewardValue"] = "Purple Lucky Block"
		}
	}
}
return v9