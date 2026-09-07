local webviewLib = require("webview")

for key, value in pairs(webviewLib) do
    print(key, type(value))
end