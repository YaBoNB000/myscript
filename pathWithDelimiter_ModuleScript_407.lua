-- pathWithDelimiter (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > table
-- Original

return function(p_u_1, p2)
	local v_u_3 = false
	local v_u_4 = ""
	string.gsub(p2, "([^%.]+)(%.*)", function(p5, p6)
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) p_u_1
		if p6 == "." then
			if v_u_3 then
				p5 = v_u_4 .. p5
				v_u_3 = false
				v_u_4 = ""
			end
			p_u_1 = p_u_1[p5]
		else
			v_u_4 = v_u_4 .. p5 .. p6
			v_u_3 = true
		end
	end)
	return p_u_1[v_u_4]
end