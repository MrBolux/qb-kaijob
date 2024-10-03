fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Mr.Bolux as Bob Togolo'
description 'Job Kai Restaurant'
version '1.0.0'

client_scripts {
    'client/main.lua',
    'client/processing.lua',
    'client/delivery.lua',
}

server_scripts {
    'server/main.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
	'config.lua',
    'config/processing.lua',
    'config/delivery.lua',
}

files {
    'locales/*.json'
}

dependencys {
    'togolo_lib',
}

ox_lib 'locale'