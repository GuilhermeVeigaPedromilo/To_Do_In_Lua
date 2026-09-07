local webviewLib = require("webview")

local webview = {}
local url_local = "file://" .. os.getenv("PWD") .. "/src/ui/index.html"

function webview.create(callback)
    local window = webviewLib.new(
        url_local, -- path of index.html
        "To Do In Lua", -- app name
        800, 600, -- Width and Height in pixels of Windown
        true, true
    )

    webviewLib.callback(window, callback)
    return window
end

function webview.run(window)
    webviewLib.loop(window)    
end

function webview.eval(window, jsCode)
    webviewLib.eval(window, jsCode)
end

return webview