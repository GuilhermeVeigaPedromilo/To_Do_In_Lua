local taskModel = require("src.models.taskModel")

local function findTask(id_task)
    local task = taskModel.get_findTask(id_task)
    if task then
        return task
    else
        print("\nError: cannot possible find this task, try again")
        return nil
    end
end

return findTask