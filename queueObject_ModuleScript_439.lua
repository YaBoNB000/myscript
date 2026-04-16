-- queueObject (ModuleScript)
-- ReplicatedStorage > devv > shared > Helpers > table
-- Original

local v1 = require(game:GetService("ReplicatedStorage").devv).load("object")()
function v1.Init(p2)
	p2._queue = {}
end
function v1.Add(p3, p4)
	local v5 = p3._queue
	table.insert(v5, p4)
	if #p3._queue == 1 then
		p4:Init()
	end
end
function v1.Next(p6)
	local v7 = table.remove(p6._queue, 1)
	if v7 and v7.clean then
		v7:clean()
	end
	if #p6._queue >= 1 then
		p6._queue[1]:Init()
	end
end
function v1.Clear(p8)
	for _, v9 in pairs(p8._queue) do
		v9:clean()
	end
	p8._queue = {}
end
function v1.Num(p10)
	return #p10._queue
end
return v1:new()