local function printTask(task)
    print("\nTask ID: " .. task.id)
    print("Title: " .. task.title)
    print("Description: " .. task.description)
    print("Status: " .. task.status)
end

return printTask