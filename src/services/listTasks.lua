
local function listTasks(tasks)
    for i, n in ipairs(tasks) do
        print(n.id, n.title, n.status)
    end
end

return listTasks