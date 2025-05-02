fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'xWhitie'
description 'Simple ESX Farming Script'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    '@NativeUI/NativeUI.lua',
    'client.lua'
}

server_script 'server.lua'

escrow_ignore 'config.lua'

dependencies {
}
