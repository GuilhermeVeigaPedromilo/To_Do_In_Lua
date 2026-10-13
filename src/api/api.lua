local json = require("cjson")
local createTaskService = require("src.services.createTask")
local insertTaskService = require("src.services.insertTask")
local selectAllTasks = require("src.services.selectAllTasks")
local insertControl  = require("src.services.insertControl")
local createControl  = require("src.services.createControl")

local api = {}

function api.handle(message)

    local request = json.decode(message)

    if request.action == "task.create" then
        return insertTaskService(createTaskService(request.data.title, request.data.description))

    elseif request.action == "task.selectAll" then
        return selectAllTasks()

    elseif request.action == "control.create" then
        print(request.data)
        return insertControl(createControl(request.data.name, request.data.description));

    else
        local result = {
            errMessage = "There is a problem to identify the request action",
            data = nil
        }

        return result
    end

end

return api