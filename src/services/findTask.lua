local function findTask(tasks, id_task)
    for i, n in ipairs(tasks) do
        if n.id == id_task then
            print("\nTask found: \n- " .. n.title)
            return n
        end
    end
    print("Error: that task does not exist")
    return nil
end

return findTask