local function createTask(title, lastId_registered)
    local newTask = {
        id = lastId_registered + 1,
        title = title,
        status = false
    }
    lastId_registered = lastId_registered + 1
    return newTask
end

return createTask