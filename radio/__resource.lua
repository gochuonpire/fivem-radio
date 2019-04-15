lresource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_01_CLASS_ROCK" { url = "http://azuraURL", volume = 0.1, name = "RADIONAME", api = "azuraapiurl/api/nowplaying/1" }

files {
        "index.html"
}

ui_page "index.html"

client_scripts {
        "data.js",
        "client.js"
}
server_script "server.lua"
