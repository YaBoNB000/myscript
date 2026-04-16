-- ConversionHelper (ModuleScript)
-- ReplicatedStorage > devv > client > Helpers > ui
-- Original

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.devv).load("PromptPurchase")
local v_u_3 = 0
return function(p4, p5)
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	if os.clock() - v_u_3 > 60 or p5 then
		v_u_3 = os.clock()
		if p4 <= 20000 then
			v_u_2.Prompt(1337285519, Enum.InfoType.Product)
			return
		end
		if p4 <= 200000 then
			v_u_2.Prompt(1337285595, Enum.InfoType.Product)
			return
		end
		if p4 <= 400000 then
			v_u_2.Prompt(1337285652, Enum.InfoType.Product)
			return
		end
		if p4 <= 1000000 then
			v_u_2.Prompt(1337285726, Enum.InfoType.Product)
			return
		end
		if p4 <= 2500000 then
			v_u_2.Prompt(1559788888, Enum.InfoType.Product)
			return
		end
		v_u_2.Prompt(1559788888, Enum.InfoType.Product)
	end
end