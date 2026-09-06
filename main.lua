local createTaskService = require("src.services.createTask")
local listTasksService = require("src.services.listTasks")
local insertTaskService = require("src.services.insertTask")
local removeTaskService = require("src.services.removeTask")
local toggleStatusService = require("src.services.toggleStatus")
local findTaskService = require("src.services.findTask")

local tasks = {}
local lastId_registered = 0

insertTaskService(tasks, createTaskService("Task 1", lastId_registered), lastId_registered)
lastId_registered = lastId_registered + 1
insertTaskService(tasks, createTaskService("Task 2", lastId_registered), lastId_registered)
lastId_registered = lastId_registered + 1
insertTaskService(tasks, createTaskService("Task 3", lastId_registered), lastId_registered)
lastId_registered = lastId_registered + 1

findTaskService(tasks, 2)
removeTaskService(tasks, 1)
findTaskService(tasks, 1)
findTaskService(tasks, 3)
toggleStatusService(tasks, 2)
listTasksService(tasks)