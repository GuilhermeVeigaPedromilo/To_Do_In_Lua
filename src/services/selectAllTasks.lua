local taskModel = require("src.models.taskModel")

local function selectAllTasks()
    return taskModel.get_allTasks()
end

return selectAllTasks