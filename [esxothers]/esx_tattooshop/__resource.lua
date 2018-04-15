resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX tattoo shop'

version '1.1.0'

client_scripts {
	'@es_extended/locale.lua',
	'locates/en.lua',
	'locates/sv.lua',
	'config.lua',
	'client/tattoosList/list.lua',
	'client/client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locates/en.lua',
	'locates/sv.lua',
	'config.lua',
	'server/server.lua'
}