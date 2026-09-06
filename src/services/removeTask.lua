local findTaskService = require("src.services.findTask")

local function removeTask(tasks, id)
    local task_founded = findTaskService(tasks, id)
    if task_founded then
        for i, n in ipairs(tasks) do
            if n.id == id then
                table.remove(tasks, i)
                print("\nTask removed successfully")
                return true
            end
        end
    else
        print("Error: cannot possible remove this task")
        return false
    end
end

return removeTask