local controlModel = require("src.models.controlModel")

local function insertControl(control)
    if control == nil then
        local result = {};
        result["message"] = "Error: you must insert a name to your control."
        return result;
    end
    return controlModel.post_control(control.name, control.description)
end

return insertControl