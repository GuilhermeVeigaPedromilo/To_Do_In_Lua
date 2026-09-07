local webview = require("webview")

local caminho_atual = os.getenv("PWD") or "."
local url_local = "file://" .. caminho_atual .. "/index.html"

print("Iniciando interface em: " .. url_local)

local w = webview.new(
    url_local,
    "To-Do In Lua",
    1024,
    768,
    true,
    true
)

webview.callback(w, function(msg)
    print("---------------------------------------")
    print("Mensagem recebida do Frontend:")
    print(tostring(msg))
    print("---------------------------------------")

    if msg == "clicou_no_botao_invoke" then
        print("SUCESSO! Lua recebeu o evento!")
    end
end)

webview.loop(w)