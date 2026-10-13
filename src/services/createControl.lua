local function createControl(name, description)
    local newControl = {
        name = name,
        description = description
    }

    if newControl.name == nil or newControl.name == "" then
        print(newControl.name)
        print("Error: the name of control is required to create one");
        return;
    else
        if newControl.description == nil or newControl.description == "" then
            newControl.description = "No description"
        end
    end
    return newControl
end

return createControl