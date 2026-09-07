local taskModel = require("src.models.taskModel")
local printTaskService = require("src.services.printTask")

local function listTasks()
    for row in taskModel.get_allTasks() do
        printTaskService(row)
    end
end

return listTasks