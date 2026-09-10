local webview = require("src.ui.webiview")
local api = require("src.api.api")
local json = require("cjson")

local window

window = webview.create(function (message)
    print("\nAn event was triggered:")
    print("Message by Frontend: " ..message)

    local response = api.handle(message)

    print("Answer by Internal API: " ..response.message)
    local json_response = json.encode(response)
    webview.eval(window, "handleResponse(".. json_response ..")")
end)

webview.run(window)