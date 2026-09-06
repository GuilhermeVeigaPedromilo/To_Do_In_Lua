local findTaskService = require("src.services.findTask")

local toggleTask = function(tasks, id)
    local task_founded = findTaskService(tasks, id)
    if task_founded then
        task_founded.status = not task_founded.status
        print("\nTask toggled successfully")
        return true
    else
        print("Error: cannot possible toggle this task")
        return false
    end
end

return toggleTask