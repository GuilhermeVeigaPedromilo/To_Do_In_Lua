local function createTask(title, description)
    local newTask = {
        title = title,
        description = description
    }
    if newTask.title == nil or newTask.title == "" then
        newTask.title = "Untitled Task"
    end

    if newTask.description == nil or newTask.description == "" then
        newTask.description = "No description"
    end
    return newTask
end

return createTask