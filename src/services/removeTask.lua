local findTaskService = require("src.services.findTask")
local taskModel = require("src.models.taskModel")

local removeTask = function(id)
    local task_founded = findTaskService(id)
    if task_founded then
        if taskModel.delete_removeTask(id) == false then
            print("\nError: cannot possible delete this task, try again")
            return false
        end
    else
        print("Error: cannot possible delete this task")
        return false
    end
end

return removeTask