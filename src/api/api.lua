local json = require("cjson")
local createTaskService = require("src.services.createTask")
local insertTaskService = require("src.services.insertTask")
local listTasksService = require("src.services.listTasks")

local api = {}

function api.handle(message)

    local request = json.decode(message)

    if request.action == "task.create" then
        local result = insertTaskService(createTaskService(request.data.title, request.data.description))
        return json.encode(result)

    elseif request.action == "task.list" then
        listTasksService()

    else
        return "There is a problem to identify the request action"
    end

end

return api