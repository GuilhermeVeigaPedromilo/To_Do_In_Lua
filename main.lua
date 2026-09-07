local webview = require("src.ui.webiview")
local api = require("src.api.api")
local json = require("cjson")

local window

window = webview.create(function (message)
    print("\nAn event was triggered:")
    print("Message by Frontend: " ..message)

    local response = api.handle(message)
    local responseDecoded = json.decode(response)

    print("Answer by Internal API: " ..responseDecoded.message)
    webview.eval(window, "handleResponse(`.. response ..`)")
end)

webview.run(window)