local findTaskService = require("src.services.findTask")
local taskModel = require("src.models.taskModel")

local toggleTask = function(id)
    local task_founded = findTaskService(id)
    if task_founded then
        if task_founded.status == 1 then
            taskModel.put_toggleStatus(id, 0)
            return true
        else
            taskModel.put_toggleStatus(id, 1)
            return true
        end
    else
        print("Error: cannot possible toggle this task")
        return false
    end
end

return toggleTask