local json = require("cjson")
local createTaskService = require("src.services.createTask")
local insertTaskService = require("src.services.insertTask")
local selectAllTasks = require("src.services.selectAllTasks")

local api = {}

function api.handle(message)

    local request = json.decode(message)

    if request.action == "task.create" then
        return insertTaskService(createTaskService(request.data.title, request.data.description))

    elseif request.action == "task.selectAll" then
        return selectAllTasks()

    else
        local result = {
            message = "There is a problem to identify the request action",
            data = nil
        }

        return result
    end

end

return api