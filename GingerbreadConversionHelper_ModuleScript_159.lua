-- GingerbreadConversionHelper (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load("PromptPurchase")
local v_u_3 = 0
return function(p4, p5)
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	if os.clock() - v_u_3 > 10 or p5 then
		v_u_3 = os.clock()
		if p4 <= 10000 then
			v_u_2.Prompt(1702766072, Enum.InfoType.Product)
			return
		end
		if p4 <= 50000 then
			v_u_2.Prompt(1702766172, Enum.InfoType.Product)
			return
		end
		if p4 <= 250000 then
			v_u_2.Prompt(1702766272, Enum.InfoType.Product)
			return
		end
		if p4 <= 1000000 then
			v_u_2.Prompt(1702766337, Enum.InfoType.Product)
			return
		end
		v_u_2.Prompt(1702766337, Enum.InfoType.Product)
	end
end