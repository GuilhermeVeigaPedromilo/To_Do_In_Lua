local dbConfig = require("src.config.database")

dbConfig:exec([[
  CREATE TABLE IF NOT EXISTS controls (
    id_control INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    description TEXT,
    createdOn TEXT NOT NULL DEFAULT date('now')
    )
]])

local function post_control(
    name, description
)
    local query = dbConfig:prepare("INSERT INTO controls (name, description) VALUES (?, ?)")
    query:bind_values(name, description)
    local query_status = query:step()
    query:finalize()

    local result = {}

    if query_status == require("lsqlite3").DONE then
        result["message"] = "Control created successfully";
        return result;
    else
        result["errMessage"] = "Error: couldn't create the control. Message: " .. dbConfig.errmsg()
        return result;
    end
end

local function get_all_controls()
    local result = {
        data = dbConfig:nrows("SELECT * FROM controls"),
        message = "All controls has been selected"
    }

    return result
end

return {
    post_control = post_control,
    get_all_controls = get_all_controls
}