-- Octree (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > spatial
-- Original

local function v_u_6(p1, p2, p3)
	local v4 = p3 / 2
	local v5
	if p1.X >= p2.X - v4 and (p1.X <= p2.X + v4 and (p1.Y >= p2.Y - v4 and (p1.Y <= p2.Y + v4 and p1.Z >= p2.Z - v4))) then
		v5 = p1.Z <= p2.Z + v4
	else
		v5 = false
	end
	return v5
end
local function v_u_10(p7)
	-- upvalues: (copy) v_u_10
	local v8 = 0
	if p7.Nodes then
		return #p7.Nodes
	end
	for _, v9 in ipairs(p7.Regions) do
		v8 = v8 + v_u_10(v9)
	end
	return v8
end
local function v_u_24(p11, p12, p13)
	local v14 = p11.Size
	local v15 = p12.X / v14
	local v16 = math.round(v15) * v14
	local v17 = p12.Y / v14
	local v18 = math.round(v17) * v14
	local v19 = p12.Z / v14
	local v20 = math.round(v19) * v14
	local v21 = Vector3.new(v16, v18, v20)
	local v22 = p11.Regions[v21]
	if not v22 and p13 then
		v22 = {
			["Regions"] = {},
			["Level"] = 1,
			["Size"] = v14
		}
		local v23 = v14 * v14 + v14 * v14 + v14 * v14
		v22.Radius = math.sqrt(v23)
		v22.Center = v21
		table.freeze(v22)
		p11.Regions[v21] = v22
	end
	return v22
end
local function v_u_55(p25, p_u_26, p_u_27)
	-- upvalues: (copy) v_u_24
	local v_u_28 = {}
	local function v_u_32(p29)
		-- upvalues: (copy) p_u_26, (copy) p_u_27, (copy) v_u_28, (copy) v_u_32
		for _, v30 in ipairs(p29) do
			if (p_u_26 - v30.Center).Magnitude < p_u_27 + v30.Radius then
				if v30.Nodes then
					local v31 = v_u_28
					table.insert(v31, v30)
				else
					v_u_32(v30.Regions)
				end
			end
		end
	end
	local v33 = {}
	local v34 = p25.Size
	local v35 = p_u_27 / v34
	local v36 = math.ceil(v35)
	if p_u_27 < p25.Size then
		for v37 = 0, 26 do
			local v38 = v37 % 3 - 1
			local v39 = v37 / 9
			local v40 = math.floor(v39) - 1
			local v41 = v37 / 3
			local v42 = math.floor(v41) % 3 - 1
			local v43 = v38 * p_u_27
			local v44 = v40 * p_u_27
			local v45 = v42 * p_u_27
			local v46 = v_u_24(p25, p_u_26 + Vector3.new(v43, v44, v45), false)
			if v46 and not v33[v46] then
				v33[v46] = true
				v_u_32(v46.Regions)
			end
		end
		return v_u_28
	elseif v36 <= 3 then
		for v47 = -v36, v36 do
			for v48 = -v36, v36 do
				for v49 = -v36, v36 do
					local v50 = v47 * v34
					local v51 = v48 * v34
					local v52 = v49 * v34
					local v53 = v_u_24(p25, p_u_26 + Vector3.new(v50, v51, v52), false)
					if v53 and not v33[v53] then
						v33[v53] = true
						v_u_32(v53.Regions)
					end
				end
			end
		end
		return v_u_28
	else
		for _, v54 in p25.Regions do
			if (p_u_26 - v54.Center).Magnitude < p_u_27 + v54.Radius then
				v_u_32(v54.Regions)
			end
		end
		return v_u_28
	end
end
local v_u_56 = {}
v_u_56.__index = v_u_56
function v_u_56.new(p57)
	-- upvalues: (copy) v_u_56
	local v58 = v_u_56
	local v59 = setmetatable({}, v58)
	v59.Size = p57 or 512
	v59.Regions = {}
	return v59
end
function v_u_56.ClearAllNodes(p60)
	table.clear(p60.Regions)
end
function v_u_56.GetAllNodes(p61)
	local v_u_62 = {}
	local function v_u_66(p63)
		-- upvalues: (copy) v_u_62, (copy) v_u_66
		for _, v64 in p63 do
			local v65 = v64.Nodes
			if v65 then
				table.move(v65, 1, #v65, #v_u_62 + 1, v_u_62)
			else
				v_u_66(v64.Regions)
			end
		end
	end
	v_u_66(p61.Regions)
	return v_u_62
end
function v_u_56.ForEachNode(p_u_67)
	local function v_u_72(p68)
		-- upvalues: (copy) p_u_67, (copy) v_u_72
		for _, v69 in p68 or p_u_67.Regions do
			local v70 = v69.Nodes
			if v70 then
				for _, v71 in v70 do
					coroutine.yield(v71)
				end
			else
				v_u_72(v69.Regions)
			end
		end
	end
	return coroutine.wrap(v_u_72)
end
function v_u_56.FindFirstNode(p73, p74)
	for v75 in p73:ForEachNode() do
		if v75.Object == p74 then
			return v75
		end
	end
	return nil
end
function v_u_56.CountNodes(p76)
	return #p76:GetAllNodes()
end
function v_u_56.CreateNode(p77, p78, p79)
	local v80 = p77:_getRegion(4, p78)
	local v81 = {
		["Region"] = v80,
		["Position"] = p78,
		["Object"] = p79
	}
	local v82 = v80.Nodes
	table.insert(v82, v81)
	return v81
end
function v_u_56.RemoveNode(_, p83)
	-- upvalues: (copy) v_u_10
	if p83.Region then
		local v84 = p83.Region.Nodes
		local v85 = table.find(v84, p83)
		if v85 then
			local v86 = #v84
			v84[v85] = v84[v86]
			v84[v86] = nil
		end
		if #v84 == 0 then
			local v87 = p83.Region
			while v87 do
				local v88 = v87.Parent
				if v88 and v_u_10(v87) == 0 then
					local v89 = table.find(v88.Regions, v87)
					if v89 then
						local v90 = v88.Regions
						local v91 = #v90
						v90[v89] = v90[v91]
						v90[v91] = nil
						v87 = v88
					else
						v87 = v88
					end
				else
					v87 = v88
				end
			end
		end
		p83.Region = nil
	end
end
function v_u_56.ChangeNodePosition(p92, p93, p94)
	p93.Position = p94
	local v95 = p92:_getRegion(4, p94)
	if v95 ~= p93.Region then
		p92:RemoveNode(p93)
		p93.Region = v95
		local v96 = v95.Nodes
		table.insert(v96, p93)
	end
end
function v_u_56.SearchRadius(p97, p98, p99)
	-- upvalues: (copy) v_u_55
	local v100 = v_u_55(p97, p98, p99)
	local v101 = {}
	for _, v102 in ipairs(v100) do
		for _, v103 in ipairs(v102.Nodes) do
			if (v103.Position - p98).Magnitude < p99 then
				table.insert(v101, v103)
			end
		end
	end
	return v101
end
function v_u_56.ForEachInRadius(p104, p_u_105, p_u_106)
	-- upvalues: (copy) v_u_55
	local v_u_107 = v_u_55(p104, p_u_105, p_u_106)
	return coroutine.wrap(function()
		-- upvalues: (copy) v_u_107, (copy) p_u_105, (copy) p_u_106
		for _, v108 in ipairs(v_u_107) do
			for _, v109 in ipairs(v108.Nodes) do
				if (v109.Position - p_u_105).Magnitude < p_u_106 then
					coroutine.yield(v109)
				end
			end
		end
	end)
end
function v_u_56.GetNearest(p110, p_u_111, p112, p113)
	local v114 = p110:SearchRadius(p_u_111, p112, p113)
	table.sort(v114, function(p115, p116)
		-- upvalues: (copy) p_u_111
		return (p115.Position - p_u_111).Magnitude < (p116.Position - p_u_111).Magnitude
	end)
	if p113 == nil or p113 >= #v114 then
		return v114
	else
		return table.move(v114, 1, p113, 1, table.create(p113))
	end
end
function v_u_56._getRegion(p_u_117, p_u_118, p_u_119)
	-- upvalues: (copy) v_u_6, (copy) v_u_24
	local function v_u_137(p120, p121, p122)
		-- upvalues: (ref) v_u_6, (copy) p_u_119, (copy) p_u_117, (copy) p_u_118, (copy) v_u_137
		local v123 = nil
		for _, v124 in p121 do
			if v_u_6(p_u_119, v124.Center, v124.Size) then
				v123 = v124
				break
			end
		end
		if not v123 then
			local v125 = p_u_117.Size / 2 ^ (p122 - 1)
			local v126
			if p120 then
				v126 = p120.Center
			else
				local v127 = p_u_119.X / v125
				local v128 = math.round(v127) * v125
				local v129 = p_u_119.Y / v125
				local v130 = math.round(v129) * v125
				local v131 = p_u_119.Z / v125
				local v132 = math.round(v131) * v125
				v126 = Vector3.new(v128, v130, v132)
			end
			if p120 then
				local v133
				if p_u_119.X > v126.X then
					v133 = v125 / 2
				else
					v133 = -v125 / 2
				end
				local v134
				if p_u_119.Y > v126.Y then
					v134 = v125 / 2
				else
					v134 = -v125 / 2
				end
				local v135
				if p_u_119.Z > v126.Z then
					v135 = v125 / 2
				else
					v135 = -v125 / 2
				end
				v126 = v126 + Vector3.new(v133, v134, v135)
			end
			v123 = {
				["Regions"] = {},
				["Level"] = p122,
				["Size"] = v125
			}
			local v136 = v125 * v125 + v125 * v125 + v125 * v125
			v123.Radius = math.sqrt(v136)
			v123.Center = v126
			v123.Parent = p120
			v123.Nodes = p122 == 4 and {} or nil
			table.freeze(v123)
			table.insert(p121, v123)
		end
		if p122 == p_u_118 then
			return v123
		else
			return v_u_137(v123, v123.Regions, p122 + 1)
		end
	end
	local v138 = v_u_24(p_u_117, p_u_119, true)
	return v_u_137(v138, v138.Regions, 2)
end
return v_u_56