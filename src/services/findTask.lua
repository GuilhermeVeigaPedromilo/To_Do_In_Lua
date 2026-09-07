local taskModel = require("src.models.taskModel")
local printTaskService = require("src.services.printTask")

local function findTask(id_task)
    local task = taskModel.get_findTask(id_task)
    if task then
        printTaskService(task)
        return task
    else
        print("\nError: cannot possible find this task, try again")
        return nil
    end
end

return findTask